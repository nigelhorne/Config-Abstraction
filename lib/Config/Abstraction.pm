package Config::Abstraction;

use strict;
use warnings;

use Carp;
use Config::IniFiles;
use YAML::XS qw(LoadFile);
use JSON::MaybeXS qw(decode_json);
use XML::Simple qw(XMLin);
use File::Slurp qw(read_file);
use File::Spec;
use File::Basename;
use Hash::Merge qw( merge );
use Hash::Flatten qw(flatten unflatten);

our $VERSION = '0.01';

=head1 NAME

Config::Abstraction - Configuration Abstraction Layer

=head1 SYNOPSIS

  use Config::Abstraction;

  my $config = Config::Abstraction->new(
    config_dirs => ['config'],
    env_prefix  => 'MYAPP_',
    flatten => 0,
  );

  my $db_user = $config->get('database.user');

=head1 DESCRIPTION

This module loads layered configuration files in YAML, JSON, XML and INI format
and merges them together.
It also supports environment variable and command line overrides.

=head1 METHODS

=head2 new

Options:

=over 4

=item * C<config_dirs>

Arrayref of directories to look for config files

=item * C<env_prefix>

Prefix for ENV keys and command line options (e.g. MYAPP_DATABASE__USER)

=item * C<flatten>

Return flat keys like 'database.user'

=back

=cut

sub new {
	my ($class, %opts) = @_;
	my $self = bless {
		config_dirs => $opts{config_dirs} || ['config'],
		env_prefix => $opts{env_prefix} || 'APP_',
		flatten	 => $opts{flatten} // 0,
		config	=> {},
	}, $class;

	$self->_load_config();

	return $self;
}

sub _load_config
{
	my $self = shift;
	my %merged;

	for my $dir (@{ $self->{config_dirs} }) {
		for my $file (qw/base.yaml base.json base.xml base.ini local.yaml local.json local.xml local.ini/) {
			my $path = File::Spec->catfile($dir, $file);
			next unless -f $path;

			my $data;
			if ($file =~ /\.ya?ml$/) {
				$data = eval { LoadFile($path) };
				croak "Failed to load YAML from $path: $@" if $@;
			} elsif ($file =~ /\.json$/) {
				$data = eval { decode_json(read_file($path)) };
				croak "Failed to load JSON from $path: $@" if $@;
			} elsif ($file =~ /\.xml$/) {
				$data = eval { XMLin($path, ForceArray => 0, KeyAttr => []) };
				croak "Failed to load XML from $path: $@" if $@;
			} elsif ($file =~ /\.ini$/) {
				my $ini = Config::IniFiles->new(-file => $path);
				croak "Failed to load INI from $path" unless $ini;
				$data = { map {
					my $section = $_;
					$section => { map { $_ => $ini->val($section, $_) } $ini->Parameters($section) }
				} $ini->Sections };
			}
			%merged = %{ merge( $data, \%merged ) };
		}
	}

	# Merge ENV vars
	for my $key (keys %ENV) {
		next unless $key =~ /^$self->{env_prefix}(.*)$/;
		my $path = lc $1;
		my @parts = split /__/, $path;
		my $ref = \%merged;
		$ref = ($ref->{$_} //= {}) for @parts[0..$#parts-1];
		$ref->{ $parts[-1] } = $ENV{$key};
	}

	# Merge command line options
	if(@ARGV) {
		foreach my $arg(@ARGV) {
			next unless($arg =~ /=/);
			my ($key, $value) = split(/=/, $arg, 2);
			next unless $key =~ /^$self->{env_prefix}(.*)$/;

			my $path = lc $1;
			my @parts = split /__/, $path;
			my $ref = \%merged;
			$ref = ($ref->{$_} //= {}) for @parts[0..$#parts-1];
			$ref->{ $parts[-1] } = $arg;
		}
	}

	$self->{config} = $self->{flatten} ? flatten(\%merged) : \%merged;
}

=head2 get(key)

Retrieve a value using dotted key notation.

=cut

sub get {
	my ($self, $key) = @_;
	if ($self->{flatten}) {
		return $self->{config}{$key};
	}
	my $ref = $self->{config};
	for my $part (split /\./, $key) {
		return undef unless ref $ref eq 'HASH';
		$ref = $ref->{$part};
	}
	return $ref;
}

=head2 all()

Return the entire config hash (possibly flattened).

=cut

sub all {
	my $self = shift;

	return $self->{'config'};
}

1;

=head1 SUPPORT

This module is provided as-is without any warranty.

Please report any bugs or feature requests to C<bug-config-abstraction at rt.cpan.org>,
or through the web interface at
L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Config-Abstraction>.
I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.

You can find documentation for this module with the perldoc command.

    perldoc Config::Abstraction

=head1 SEE ALSO

=over 4

=item * L<Config::Auto>

=back

=head1 AUTHOR

Nigel Horne, C<< <njh at nigelhorne.com> >>

=cut

__END__
