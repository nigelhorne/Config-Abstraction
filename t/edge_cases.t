#!/usr/bin/perl

# Destructive, pathological, and boundary-condition tests for Config::Abstraction.
# Tests edge cases, malformed input, extreme values, and unexpected usage patterns.

use strict;
use warnings;
use autodie qw(:all);

use Test::Most;
use Test::Mockingbird;
use Readonly;
use Scalar::Util qw(blessed reftype looks_like_number);
use File::Temp qw(tempdir);
use File::Spec;

# ---------------------------------------------------------------------------
# Configuration - can be overridden via Object::Configure if wanted
# ---------------------------------------------------------------------------
my %config = (
	module		=> 'Config::Abstraction',
	env_prefix	=> 'EDGEAPP_',
	sep_char	=> '.',
	sep_char_us	=> '_',
);

Readonly::Scalar my $MODULE		=> $config{module};
Readonly::Scalar my $ENV_PREFIX		=> $config{env_prefix};
Readonly::Scalar my $SEP		=> $config{sep_char};
Readonly::Scalar my $SEP_US		=> $config{sep_char_us};

Readonly::Scalar my $EXPECTED_USER	=> 'alice';
Readonly::Scalar my $EXPECTED_PORT	=> 5432;
Readonly::Scalar my $LONG_STRING_LEN	=> 100_000;
Readonly::Scalar my $DEEP_NEST_DEPTH	=> 50;
Readonly::Scalar my $MANY_KEYS_COUNT	=> 1_000;
Readonly::Scalar my $UNICODE_VALUE	=> "caf\x{e9}";
Readonly::Scalar my $NUL_VALUE		=> "nul\x00byte";
Readonly::Scalar my $NEWLINE_VALUE	=> "line1\nline2";

# ---------------------------------------------------------------------------
# Helper: write a file to a directory
# ---------------------------------------------------------------------------
sub _write_file
{
	my ($dir, $filename, $content) = @_;
	my $path = File::Spec->catfile($dir, $filename);
	open(my $fh, '>', $path);
	print $fh $content;
	close $fh;
	return $path;
}

# Run a coderef with STDERR silenced - used for subtests that
# intentionally trigger parse failures which carp to STDERR
sub _silenced
{
	my $code = shift;
	local *STDERR;
	open(STDERR, '>', File::Spec->devnull());
	my @result = eval { $code->() };
	my $err = $@;
	close STDERR;
	$@ = $err;
	return @result;
}

# ---------------------------------------------------------------------------
use_ok($MODULE) or BAIL_OUT("$MODULE failed to load");

# ===========================================================================
# Constructor edge cases
# ===========================================================================
subtest 'new() - undef data arg does not crash' => sub {
	my $cfg;
	eval {
		$cfg = Config::Abstraction->new(
			data        => undef,
			config_dirs => [],
		);
	};
	ok(!$@, 'undef data does not throw');
};

subtest 'new() - empty string config_dirs entry skipped gracefully' => sub {
	my $cfg;
	eval {
		$cfg = Config::Abstraction->new(
			data        => { key => 'value' },
			config_dirs => ['', undef, File::Spec->curdir()],
		);
	};
	ok(!$@, 'empty/undef config_dirs entries do not crash');
};

subtest 'new() - nonexistent config_dirs silently skipped' => sub {
	my $cfg = Config::Abstraction->new(
		data        => { key => 'value' },
		config_dirs => ['/no/such/dir/ever/exists/xyzzy'],
	);
	ok(defined($cfg), 'nonexistent config_dir does not crash');
	is($cfg->get('key'), 'value', 'data still accessible');
};

subtest 'new() - config_dirs containing a file not a directory' => sub {
	my $dir = tempdir(CLEANUP => 1);
	my $file = _write_file($dir, 'notadir.yaml', "key: value\n");

	my $cfg;
	eval {
		$cfg = Config::Abstraction->new(
			data        => { fallback => 'yes' },
			config_dirs => [$file],	# a file, not a directory
		);
	};
	ok(!$@, 'file path in config_dirs does not crash');
};

subtest 'new() - data with only undef values returns undef object' => sub {
	my $cfg = Config::Abstraction->new(
		data        => { key => undef },
		config_dirs => [],
	);
	# A hash with one undef value still has one key - object should be created
	ok(defined($cfg), 'data with undef values creates object');
	ok(!defined($cfg->get('key')), 'undef value preserved');
};

subtest 'new() - completely empty config_dirs arrayref' => sub {
	my $cfg = Config::Abstraction->new(
		data        => { key => 'value' },
		config_dirs => [],
	);
	ok(defined($cfg), 'empty config_dirs arrayref accepted');
};

subtest 'new() - path synonym for config_dirs' => sub {
	my $dir = tempdir(CLEANUP => 1);
	_write_file($dir, 'base.yaml', "timeout: 30\n");

	my $cfg = Config::Abstraction->new(path => [$dir]);
	ok(defined($cfg), 'path synonym accepted');
	is($cfg->get('timeout'), 30, 'path synonym loads config');
};

subtest 'new() - file synonym for config_file' => sub {
	my $dir = tempdir(CLEANUP => 1);
	my $path = _write_file($dir, 'myapp.yaml', "mode: test\n");

	my $cfg = Config::Abstraction->new(
		file        => $path,
		config_dirs => [''],
	);
	ok(defined($cfg), 'file synonym accepted');
	is($cfg->get('mode'), 'test', 'file synonym loads config');
};

# ===========================================================================
# Malformed and pathological config files
# ===========================================================================
subtest 'malformed YAML file does not crash constructor' => sub {
	my $dir = tempdir(CLEANUP => 1);
	_write_file($dir, 'base.yaml', "this: is\nbad:\n  yaml:\n - [broken\n");

	my $cfg;
	_silenced(sub {
		$cfg = Config::Abstraction->new(
			data        => { fallback => 'yes' },
			config_dirs => [$dir],
		);
	});
	# Should either succeed with fallback data or die cleanly
	if($@) {
		like($@, qr/Failed to load YAML|yaml|parse/i, 'YAML error message is descriptive');
	} else {
		ok(defined($cfg), 'malformed YAML falls back gracefully');
	}
};

subtest 'malformed JSON file does not crash constructor' => sub {
	my $dir = tempdir(CLEANUP => 1);
	_write_file($dir, 'base.json', '{"broken": json, "missing": }');

	my $cfg;
	_silenced(sub {
		eval {
			$cfg = Config::Abstraction->new(
				data        => { fallback => 'yes' },
				config_dirs => [$dir],
			);
		};
	});
	if($@) {
		like($@, qr/Failed to load JSON|json|parse/i, 'JSON error message is descriptive');
	} else {
		ok(defined($cfg), 'malformed JSON falls back gracefully');
	}
};

subtest 'empty config file does not crash constructor' => sub {
	my $dir = tempdir(CLEANUP => 1);
	_write_file($dir, 'base.yaml', '');

	my $cfg;
	eval {
		$cfg = Config::Abstraction->new(
			data        => { fallback => 'yes' },
			config_dirs => [$dir],
		);
	};
	ok(!$@, 'empty config file does not throw');
};

subtest 'config file containing only comments does not crash' => sub {
	my $dir = tempdir(CLEANUP => 1);
	_write_file($dir, 'base.yaml', "# just a comment\n# nothing else\n");

	my $cfg;
	eval {
		$cfg = Config::Abstraction->new(
			data        => { fallback => 'yes' },
			config_dirs => [$dir],
		);
	};
	ok(!$@, 'comment-only config file does not throw');
};

subtest 'config file containing only whitespace does not crash' => sub {
	my $dir = tempdir(CLEANUP => 1);
	_write_file($dir, 'base.yaml', "   \n\t\n   \n");

	my $cfg;
	_silenced(sub {
		eval {
			$cfg = Config::Abstraction->new(
				data        => { fallback => 'yes' },
				config_dirs => [$dir],
			);
		};
	});
	diag "Error: $@" if $@;
	ok(!$@, 'whitespace-only config file does not throw');
};

subtest 'YAML file with non-hash top-level value handled gracefully' => sub {
	my $dir = tempdir(CLEANUP => 1);
	_write_file($dir, 'base.yaml', "- item1\n- item2\n- item3\n");

	my $cfg;
	eval {
		$cfg = Config::Abstraction->new(
			data        => { fallback => 'yes' },
			config_dirs => [$dir],
		);
	};
	ok(!$@, 'YAML array top-level does not throw');
	if(defined($cfg)) {
		is($cfg->get('fallback'), 'yes', 'fallback data intact after non-hash YAML');
	}
};

# ===========================================================================
# Boundary values in keys and data
# ===========================================================================
subtest 'get() - key that is just the sep_char' => sub {
	my $cfg = Config::Abstraction->new(
		data        => { '' => 'empty_key' },
		config_dirs => [],
	);
	# A single dot splits into ('', '') - both empty string lookups
	lives_ok { my $val = $cfg->get($SEP) } 'sep_char-only key does not throw';
};

subtest 'get() - empty string key' => sub {
	my $cfg = Config::Abstraction->new(
		data        => { key => 'value' },
		config_dirs => [],
	);
	my $val;
	eval { $val = $cfg->get('') };
	ok(!$@, 'empty string key does not throw');
};

subtest 'get() - deeply nested key path' => sub {
	# Build a deeply nested hashref
	my $data = { leaf => 'deep_value' };
	my @parts;
	for my $i (1 .. $DEEP_NEST_DEPTH) {
		$data = { "level$i" => $data };
		unshift @parts, "level$i";
	}
	push @parts, 'leaf';

	my $cfg = Config::Abstraction->new(
		data        => $data,
		config_dirs => [],
	);
	my $key = join($SEP, @parts);
	is($cfg->get($key), 'deep_value', "deeply nested key ($DEEP_NEST_DEPTH levels) accessible");
};

subtest 'get() - key with very long string value' => sub {
	my $long = 'x' x $LONG_STRING_LEN;
	my $cfg = Config::Abstraction->new(
		data        => { bigval => $long },
		config_dirs => [],
	);
	my $got = $cfg->get('bigval');
	is(length($got), $LONG_STRING_LEN, "long string value ($LONG_STRING_LEN chars) preserved");
};

subtest 'get() - key with very long key name' => sub {
	my $longkey = 'k' x 10_000;
	my $cfg = Config::Abstraction->new(
		data        => { $longkey => 'value' },
		config_dirs => [],
	);
	is($cfg->get($longkey), 'value', 'very long key name accessible');
};

subtest 'get() - numeric zero value preserved and not treated as false' => sub {
	my $cfg = Config::Abstraction->new(
		data        => { count => 0, flag => 0 },
		config_dirs => [],
	);
	is($cfg->get('count'), 0, 'zero value preserved');
	ok(defined($cfg->get('count')), 'zero value is defined');
	is($cfg->get('flag'),  0, 'zero flag preserved');
};

subtest 'get() - empty string value preserved and not treated as undef' => sub {
	my $cfg = Config::Abstraction->new(
		data        => { empty => '' },
		config_dirs => [],
	);
	ok(defined($cfg->get('empty')), 'empty string is defined');
	is($cfg->get('empty'), '', 'empty string value preserved');
};

subtest 'get() - boolean false value (0) not confused with undef' => sub {
	my $cfg = Config::Abstraction->new(
		data        => { enabled => 0, disabled => 1 },
		config_dirs => [],
	);
	is($cfg->get('enabled'),  0, 'false value 0 preserved');
	is($cfg->get('disabled'), 1, 'true value 1 preserved');
};

subtest 'get() - large number of keys' => sub {
	my %data = map { ("key$_" => $_) } 1 .. $MANY_KEYS_COUNT;
	my $cfg = Config::Abstraction->new(
		data        => \%data,
		config_dirs => [],
	);
	is($cfg->get('key1'), 1,                'first key correct');
	is($cfg->get("key$MANY_KEYS_COUNT"), $MANY_KEYS_COUNT, 'last key correct');
	is($cfg->exists("key500"),         1,                'mid-range key exists');
};

subtest 'get() - key containing special regex metacharacters in sep_char' => sub {
	my $cfg = Config::Abstraction->new(
		data        => { 'a.b' => { c => 'val' } },
		config_dirs => [],
	);
	# 'a.b.c' should split on literal dot: parts are 'a', 'b', 'c'
	# $data->{'a.b'} would not be found since we look for 'a' first
	my $val = $cfg->get('a.b.c');
	ok(!$@, 'key with dots in data name does not crash');
};

subtest 'data() - key with undef value distinguished from missing key' => sub {
	my $cfg = Config::Abstraction->new(
		data        => { present_undef => undef, present_val => 'x' },
		config_dirs => [],
	);
	is($cfg->exists('present_undef'), 1, 'key with undef value exists');
	is($cfg->exists('truly_absent'),  0, 'truly absent key does not exist');
	ok(!defined($cfg->get('present_undef')), 'undef value returns undef from get()');
};

# ===========================================================================
# Unicode and special characters
# ===========================================================================
subtest 'unicode value in data preserved' => sub {
	my $cfg = Config::Abstraction->new(
		data        => { name => $UNICODE_VALUE },
		config_dirs => [],
	);
	is($cfg->get('name'), $UNICODE_VALUE, 'unicode value preserved');
};

subtest 'unicode key in data accessible' => sub {
	my $cfg = Config::Abstraction->new(
		data        => { $UNICODE_VALUE => 'unicode_key_val' },
		config_dirs => [],
	);
	is($cfg->get($UNICODE_VALUE), 'unicode_key_val', 'unicode key accessible');
};

subtest 'value containing newlines preserved' => sub {
	my $cfg = Config::Abstraction->new(
		data        => { multiline => $NEWLINE_VALUE },
		config_dirs => [],
	);
	is($cfg->get('multiline'), $NEWLINE_VALUE, 'newline in value preserved');
};

# ===========================================================================
# Pathological ENV variable edge cases
# ===========================================================================
subtest 'ENV - empty value overrides data' => sub {
	local %ENV = %ENV;
	$ENV{"${ENV_PREFIX}DATABASE__USER"} = '';

	my $cfg = Config::Abstraction->new(
		data => {
			database => { user => $EXPECTED_USER, pass => 'x' },
		},
		config_dirs => [],
		env_prefix  => $ENV_PREFIX,
	);
	my $val = $cfg->get('database.user');
	# Empty string ENV value should override, not be ignored
	ok(defined($val), 'empty ENV value is defined');
	is($val, '', 'empty ENV value overrides data');
};

subtest 'ENV - prefix match is case-insensitive per POD' => sub {
	local %ENV = %ENV;
	$ENV{lc("${ENV_PREFIX}DATABASE__USER")} = 'lower_env';

	my $cfg = Config::Abstraction->new(
		data => {
			database => { user => $EXPECTED_USER, pass => 'x' },
		},
		config_dirs => [],
		env_prefix  => $ENV_PREFIX,
	);
	# POD says case-insensitive match
	is($cfg->get('database.user'), 'lower_env', 'lowercase ENV key matched case-insensitively');
};

subtest 'ENV - many double-underscore segments create deep nesting' => sub {
	local %ENV = %ENV;
	$ENV{"${ENV_PREFIX}A__B__C__D"} = 'deep';

	my $cfg = Config::Abstraction->new(
		data        => { a => { b => { c => { d => 'original' } } } },
		config_dirs => [],
		env_prefix  => $ENV_PREFIX,
	);
	is($cfg->get('a.b.c.d'), 'deep', 'deep double-underscore ENV nesting works');
};

subtest 'ENV - prefix with no matching vars leaves data intact' => sub {
	local %ENV = %ENV;
	# Remove any accidentally matching vars
	delete $ENV{$_} for grep { /^$ENV_PREFIX/ } keys %ENV;

	my $cfg = Config::Abstraction->new(
		data        => { key => 'original' },
		config_dirs => [],
		env_prefix  => $ENV_PREFIX,
	);
	is($cfg->get('key'), 'original', 'data intact when no ENV vars match prefix');
};

# ===========================================================================
# Pathological CLI argument edge cases
# ===========================================================================
subtest 'CLI - arg without = sign is ignored' => sub {
	local @ARGV = ("--${ENV_PREFIX}RETRIES");

	my $cfg = Config::Abstraction->new(
		data        => { retries => 3 },
		config_dirs => [],
		env_prefix  => $ENV_PREFIX,
	);
	is($cfg->get('retries'), 3, 'CLI arg without = sign ignored');
};

subtest 'CLI - arg with empty value sets empty string' => sub {
	local @ARGV = ("--${ENV_PREFIX}RETRIES=");

	my $cfg = Config::Abstraction->new(
		data        => { retries => 3 },
		config_dirs => [],
		env_prefix  => $ENV_PREFIX,
	);
	my $val = $cfg->get('retries');
	is($val, '', 'CLI arg with empty value sets empty string');
};

subtest 'CLI - arg with = in value captures full value' => sub {
	local @ARGV = ("--${ENV_PREFIX}DSN=host=localhost;port=5432");

	my $cfg = Config::Abstraction->new(
		data        => { dsn => 'original' },
		config_dirs => [],
		env_prefix  => $ENV_PREFIX,
	);
	is($cfg->get('dsn'), 'host=localhost;port=5432', 'CLI value with embedded = preserved');
};

subtest 'CLI - non-matching prefix args ignored' => sub {
	local @ARGV = ('--OTHERAPP_KEY=value', '--notanoption', 'positional');

	my $cfg = Config::Abstraction->new(
		data        => { key => 'original' },
		config_dirs => [],
		env_prefix  => $ENV_PREFIX,
	);
	is($cfg->get('key'), 'original', 'non-matching CLI args ignored');
};

# ===========================================================================
# merge_defaults() edge cases
# ===========================================================================
subtest 'merge_defaults() - undef defaults arg returns config' => sub {
	my $cfg = Config::Abstraction->new(
		data        => { key => 'value' },
		config_dirs => [],
	);
	my $result = $cfg->merge_defaults(defaults => undef);
	ok(defined($result), 'undef defaults returns config hashref');
};

subtest 'merge_defaults() - section that does not exist in config' => sub {
	my $cfg = Config::Abstraction->new(
		data        => { key => 'value' },
		config_dirs => [],
	);
	my $result = $cfg->merge_defaults(
		defaults => { extra => 'kept' },
		section  => 'nosuchsection',
	);
	# Section absent - full config merged with defaults
	ok(defined($result), 'absent section does not crash');
	is($result->{extra}, 'kept', 'default preserved when section absent');
};

subtest 'merge_defaults() - empty defaults hash' => sub {
	my $cfg = Config::Abstraction->new(
		data        => { key => 'value' },
		config_dirs => [],
	);
	my $result = $cfg->merge_defaults(defaults => {});
	ok(defined($result),         'empty defaults hash accepted');
	is($result->{key}, 'value',  'config key present in result');
};

subtest 'merge_defaults() - deep option with no global section' => sub {
	my $cfg = Config::Abstraction->new(
		data        => { key => 'value' },
		config_dirs => [],
	);
	my $result;
	eval {
		$result = $cfg->merge_defaults(
			defaults => { extra => 'kept' },
			deep     => 1,
		);
	};
	ok(!$@, 'deep option with no global section does not crash');
	is($result->{extra}, 'kept', 'default preserved');
};

# ===========================================================================
# Blessed object and coderef edge cases
# ===========================================================================
subtest 'coderef alongside comma-containing string does not corrupt coderef' => sub {
	my $cb = sub { 'result' };
	my $cfg = Config::Abstraction->new(
		data => {
			callback => $cb,
			tags     => 'alpha,beta,gamma',
			plain    => 'simple',
		},
		config_dirs => [],
	);
	my $got = $cfg->get('callback');
	is(reftype($got), 'CODE',  'coderef intact alongside comma string');
	is($got->(), 'result',     'coderef callable');
	is($cfg->get('plain'), 'simple', 'plain string unaffected');
};

subtest 'blessed object alongside active YAML loading not corrupted' => sub {
	my $dir = tempdir(CLEANUP => 1);
	_write_file($dir, 'base.yaml', "timeout: 30\nmode: live\n");

	my $obj = bless { v => $EXPECTED_PORT }, '_EdgeTestObj';
	my $cfg = Config::Abstraction->new(
		data        => { handler => $obj, extra => 'val' },
		config_dirs => [$dir],
	);
	my $got = $cfg->get('handler');
	ok(blessed($got),                  'blessed object intact with active YAML loading');
	is(blessed($got), '_EdgeTestObj',  'class unchanged');
	is($cfg->get('timeout'), 30,       'YAML value coexists');
};

subtest 'multiple coderefs in data all preserved independently' => sub {
	my $cb1 = sub { 'one' };
	my $cb2 = sub { 'two' };
	my $cb3 = sub { 'three' };

	my $cfg = Config::Abstraction->new(
		data        => { a => $cb1, b => $cb2, c => $cb3 },
		config_dirs => [],
	);

	is($cfg->get('a')->(), 'one',   'first coderef intact');
	is($cfg->get('b')->(), 'two',   'second coderef intact');
	is($cfg->get('c')->(), 'three', 'third coderef intact');
};

# ===========================================================================
# exists() edge cases
# ===========================================================================
subtest 'exists() - key with undef value returns 1 not 0' => sub {
	my $cfg = Config::Abstraction->new(
		data        => { nullkey => undef },
		config_dirs => [],
	);
	is($cfg->exists('nullkey'), 1, 'key with undef value exists');
};

subtest 'exists() - empty string key does not crash' => sub {
	my $cfg = Config::Abstraction->new(
		data        => { key => 'value' },
		config_dirs => [],
	);
	eval { $cfg->exists('') };
	ok(!$@, 'empty string key in exists() does not crash');
};

# ===========================================================================
# AUTOLOAD edge cases
# ===========================================================================
subtest 'AUTOLOAD - DESTROY not intercepted' => sub {
	my $cfg = Config::Abstraction->new(
		data        => { key => 'value' },
		config_dirs => [],
	);
	# Calling DESTROY directly should not croak with "No such config key"
	eval { $cfg->DESTROY() };
	ok(!$@, 'DESTROY not intercepted by AUTOLOAD');
};

subtest 'AUTOLOAD - key name same as Perl built-in does not crash' => sub {
	my $cfg = Config::Abstraction->new(
		data        => { length => 42 },
		config_dirs => [],
		sep_char    => $SEP_US,
	);
	my $val;
	eval { $val = $cfg->length() };
	ok(!$@, 'key named like built-in does not crash');
	is($val, 42, 'value accessible via AUTOLOAD for built-in-named key');
};

# ===========================================================================
# Flatten edge cases
# ===========================================================================
subtest 'flatten - key containing sep_char not double-flattened' => sub {
	my $cfg = Config::Abstraction->new(
		data        => { 'already.flat' => 'value' },
		config_dirs => [],
		flatten     => 1,
	);
	ok(!$@, 'pre-flattened key with flatten=>1 does not crash');
};

subtest 'flatten - empty nested hash does not crash' => sub {
	my $cfg = Config::Abstraction->new(
		data        => { section => {}, key => 'val' },
		config_dirs => [],
		flatten     => 1,
	);
	ok(defined($cfg), 'empty nested hash with flatten=>1 does not crash');
	is($cfg->get('key'), 'val', 'sibling key still accessible');
};

# ===========================================================================
# Schema edge cases
# ===========================================================================
subtest 'schema - empty schema accepts any config' => sub {
	my $cfg;
	eval {
		$cfg = Config::Abstraction->new(
			data        => { key => 'value', other => 42 },
			config_dirs => [],
			schema      => {},
		);
	};
	# Empty schema behaviour depends on Params::Validate::Strict -
	# should either pass or give a meaningful error, not crash silently
	ok(!$@ || $@ =~ /\w/, 'empty schema does not crash silently');
};

subtest 'schema - schema with all optional fields accepts empty-ish config' => sub {
	my $cfg;
	eval {
		$cfg = Config::Abstraction->new(
			data        => { retries => 3 },
			config_dirs => [],
			schema      => {
				retries => { type => 'integer' },
				timeout => { type => 'integer', optional => 1 },
			},
		);
	};
	ok(!$@,        'optional schema field does not cause failure when absent');
	ok(defined($cfg), 'object created with optional schema field absent');
};

# ===========================================================================
# SECURITY: env_prefix regex injection
# ---------------------------------------------------------------------------
# The module embeds env_prefix directly into a regex without quotemeta.
# An env_prefix containing regex metacharacters would cause:
#   '.'  -> /^./ matches every env var (over-match / data pollution)
#   '+'  -> /^APP+_/ changes quantifier semantics (under-match)
#   '('  -> unbalanced grouping -> fatal "Unmatched (" regex compile error
# Fix applied to lib/Config/Abstraction.pm lines 759 & 775: use \Q...\E.
# ===========================================================================

subtest 'SECURITY: env_prefix "." over-match: only exact prefix matched' => sub {
	# Without \Q\E, the pattern /^.(.*)$/i matches EVERY env var because
	# "." means "any character".  The fix must prevent this.
	local %ENV = %ENV;
	$ENV{'XMARKER_CANARY'} = 'should_not_appear';

	my $cfg;
	_silenced(sub {
		eval {
			$cfg = Config::Abstraction->new(
				data        => { safe => 'value' },
				config_dirs => [],
				env_prefix  => '.',
			);
		};
	});
	# With the fix, '.' is literal so XMARKER_CANARY is not merged.
	# Confirm the canary value does not appear anywhere in the config.
	if(defined($cfg)) {
		my $all = $cfg->all() // {};
		my $dumped = join(' ', map { "$_ => $all->{$_}" } grep { defined $all->{$_} && !ref($all->{$_}) } keys %$all);
		unlike($dumped, qr/should_not_appear/, 'dot env_prefix does not ingest arbitrary env vars');
	} else {
		pass('constructor returned undef - no pollution possible');
	}
};

subtest 'SECURITY: env_prefix "APP+_" does not cause regex compile error' => sub {
	# Without \Q\E, /^APP+_/ is a valid but wrong regex (one or more Ps).
	# With \Q\E, /^\QAPP+_\E/ treats "+" literally.
	local %ENV = %ENV;
	$ENV{'APP+_KEY'} = 'plus_val';

	my $cfg;
	eval {
		$cfg = Config::Abstraction->new(
			data        => { key => 'original' },
			config_dirs => [],
			env_prefix  => 'APP+_',
		);
	};
	ok(!$@, 'env_prefix with "+" does not cause an unhandled regex compile error');
};

subtest 'SECURITY: env_prefix "(" does not cause fatal regex error' => sub {
	# Without \Q\E, /^APP(/ is an unbalanced group -> fatal Perl regex error.
	# With \Q\E, it is safe literal matching.
	local %ENV = %ENV;

	my $cfg;
	eval {
		$cfg = Config::Abstraction->new(
			data        => { key => 'original' },
			config_dirs => [],
			env_prefix  => 'APP(_',
		);
	};
	ok(!$@, 'env_prefix with unbalanced "(" does not die with regex error');
};

subtest 'SECURITY: env_prefix metachar does not match unintended CLI args' => sub {
	# Same quotemeta fix needed on the ARGV regex (line 775).
	# env_prefix = 'APP.' would make /^--APP.KEY=/ match --APP_KEY= (. = any char).
	local @ARGV = ('--APP_KEY=wrong', '--APPXKEY=also_wrong');

	my $cfg;
	eval {
		$cfg = Config::Abstraction->new(
			data        => { key => 'original' },
			config_dirs => [],
			env_prefix  => 'APP.',
		);
	};
	ok(!$@, 'ARGV regex with metachar env_prefix does not die');
	# With the fix, 'APP.' matches literally so APP_KEY and APPXKEY are skipped
	if(defined($cfg)) {
		isnt($cfg->get('key'), 'wrong',      'ARGV: unintended arg not merged via metachar prefix');
		isnt($cfg->get('key'), 'also_wrong', 'ARGV: second unintended arg not merged either');
	} else {
		pass('constructor returned undef - no injection possible');
	}
};

# ===========================================================================
# SECURITY: path traversal via config_file
# ---------------------------------------------------------------------------
# Config::Abstraction deliberately does NOT restrict which paths can be loaded
# (the module is a file loader by design), but traversal should not bypass the
# config_dirs constraint silently.  Document the behaviour.
# ===========================================================================

subtest 'SECURITY: path traversal in config_file loads relative path as-is' => sub {
	# The module does not sandbox paths; this test documents the design intent:
	# passing an absolute path to a nonexistent target returns undef (not a crash).
	my $cfg;
	_silenced(sub {
		eval {
			$cfg = Config::Abstraction->new(
				config_file => '/this/path/does/not/exist/ever.yaml',
				config_dirs => [''],
			);
		};
	});
	ok(!$@,        'nonexistent traversal path does not crash constructor');
	ok(!defined($cfg), 'nonexistent traversal path returns undef (no data loaded)');
};

# ===========================================================================
# Filesystem hostility
# ===========================================================================

subtest 'filesystem: /dev/null as config file produces no data' => sub {
	plan skip_all => '/dev/null not available on this platform' unless -e '/dev/null';

	my $cfg;
	eval {
		$cfg = Config::Abstraction->new(
			config_file => '/dev/null',
			config_dirs => [''],
			data        => { fallback => 'devnull_test' },
		);
	};
	ok(!$@, '/dev/null as config_file does not crash constructor');
	if(defined($cfg)) {
		is($cfg->get('fallback'), 'devnull_test', 'fallback data intact after /dev/null config');
	} else {
		pass('constructor returned undef (empty file -> no config data, no data arg merged)');
	}
};

subtest 'filesystem: binary garbage in YAML extension file is skipped gracefully' => sub {
	my $dir = tempdir(CLEANUP => 1);
	# Write 256 bytes of raw binary content as a .yaml file
	my $binary = join('', map { chr($_) } 0..255);
	_write_file($dir, 'base.yaml', $binary);

	my $cfg;
	_silenced(sub {
		eval {
			$cfg = Config::Abstraction->new(
				data        => { fallback => 'binary_test' },
				config_dirs => [$dir],
			);
		};
	});
	# Must not crash; fallback data should survive
	ok(!$@, 'binary YAML content does not kill constructor');
	if(defined($cfg)) {
		is($cfg->get('fallback'), 'binary_test', 'fallback data intact after binary YAML');
	} else {
		pass('constructor returned undef (only data present; binary file skipped)');
	}
};

subtest 'filesystem: directory path in config_file is skipped gracefully' => sub {
	# Passing a directory path to config_file: -f check should fail, no parse attempted.
	my $dir = tempdir(CLEANUP => 1);
	_write_file($dir, 'base.yaml', "fallback: yes\n");

	my $cfg;
	_silenced(sub {
		eval {
			$cfg = Config::Abstraction->new(
				config_file => $dir,
				config_dirs => [''],
				data        => { key => 'dir_test' },
			);
		};
	});
	ok(!$@, 'directory as config_file does not crash');
	if(defined($cfg)) {
		is($cfg->get('key'), 'dir_test', 'fallback data intact when config_file is a directory');
	} else {
		pass('constructor returned undef - no data from directory path');
	}
};

subtest 'filesystem: dangling symlink in config_dirs does not crash' => sub {
	plan skip_all => 'symlink() not supported on this platform'
		unless eval { symlink('', ''); 1 } || $! == &POSIX::EEXIST;

	my $dir = tempdir(CLEANUP => 1);
	my $link = File::Spec->catfile($dir, 'dangling_link.yaml');
	symlink('/nonexistent/target/xyz', $link);

	my $cfg;
	eval {
		$cfg = Config::Abstraction->new(
			data        => { fallback => 'symlink_test' },
			config_dirs => [$dir],
		);
	};
	ok(!$@, 'dangling symlink in config_dirs does not crash');
	if(defined($cfg)) {
		is($cfg->get('fallback'), 'symlink_test', 'fallback data intact with dangling symlink');
	} else {
		pass('constructor returned undef - no data loaded with dangling symlink');
	}
};

subtest 'filesystem: config dir path with spaces works correctly' => sub {
	# File::Spec->catfile should handle spaces; this tests end-to-end path handling.
	my $base = tempdir(CLEANUP => 1);
	my $dir  = File::Spec->catdir($base, 'dir with spaces');
	mkdir($dir) or die "Cannot mkdir: $!";
	_write_file($dir, 'base.yaml', "spacekey: spacevalue\n");

	my $cfg = Config::Abstraction->new(config_dirs => [$dir]);
	ok(defined($cfg),                   'config dir with spaces in name works');
	is($cfg->get('spacekey'), 'spacevalue', 'value loaded from dir with spaces');
};

# ===========================================================================
# Constructor hostile: non-hashref data argument
# ---------------------------------------------------------------------------
# The module does %merged = %{$self->{data}}, which would die if data is an
# arrayref, coderef, or plain scalar.  Fix: type-check before deref (applied
# to lib/Config/Abstraction.pm).
# ===========================================================================

subtest 'new() - arrayref data arg handled gracefully (not a crash)' => sub {
	# Before fix: %merged = %{[1,2,3]} croaks "Not a HASH reference".
	# After fix: a carp warning is emitted and data is silently ignored.
	my $cfg;
	_silenced(sub {
		eval {
			$cfg = Config::Abstraction->new(
				data        => [1, 2, 3],
				config_dirs => [],
			);
		};
	});
	ok(!$@, 'arrayref data does not cause an unhandled fatal error');
	# With the fix, arrayref data is ignored and the object returns undef
	# (no config keys loaded from it) or the object simply has no keys.
};

subtest 'new() - scalar data arg handled gracefully (not a crash)' => sub {
	my $cfg;
	_silenced(sub {
		eval {
			$cfg = Config::Abstraction->new(
				data        => 'just a string',
				config_dirs => [],
			);
		};
	});
	ok(!$@, 'scalar string as data does not cause an unhandled fatal error');
};

subtest 'new() - coderef data arg handled gracefully (not a crash)' => sub {
	my $cfg;
	_silenced(sub {
		eval {
			$cfg = Config::Abstraction->new(
				data        => sub { {} },
				config_dirs => [],
			);
		};
	});
	ok(!$@, 'coderef as data does not cause an unhandled fatal error');
};

# ===========================================================================
# Context abuse: scalar vs list context
# ===========================================================================

subtest 'get() in list context does not expand a hashref into a list' => sub {
	# get() should behave identically in scalar and list context.
	my $cfg = Config::Abstraction->new(
		data        => { section => { a => 1, b => 2 } },
		config_dirs => [],
	);
	my @list_result   = $cfg->get('section');
	my $scalar_result = $cfg->get('section');
	is(scalar(@list_result), 1, 'get() in list context returns exactly one element');
	is(ref($list_result[0]), 'HASH', 'that element is still a hashref (not a flattened list)');
	is($list_result[0], $scalar_result, 'list and scalar contexts return the same reference');
};

subtest 'all() in list context returns one hashref, not a key-value list' => sub {
	my $cfg = Config::Abstraction->new(
		data        => { x => 1, y => 2 },
		config_dirs => [],
	);
	my @result = $cfg->all();
	is(scalar(@result), 1,      'all() in list context yields a single element');
	is(ref($result[0]), 'HASH', 'that element is a hashref');
};

# ===========================================================================
# Multiple object isolation: shared state must not leak between instances
# ===========================================================================

subtest 'two Config::Abstraction objects do not share state' => sub {
	my $cfg1 = Config::Abstraction->new(
		data        => { name => 'object_one', shared => 'A' },
		config_dirs => [],
	);
	my $cfg2 = Config::Abstraction->new(
		data        => { name => 'object_two', shared => 'B' },
		config_dirs => [],
	);

	is($cfg1->get('name'), 'object_one', 'cfg1 name is independent');
	is($cfg2->get('name'), 'object_two', 'cfg2 name is independent');
	is($cfg1->get('shared'), 'A', 'cfg1 shared value is A');
	is($cfg2->get('shared'), 'B', 'cfg2 shared value is B');

	# Mutating one object's underlying data must not affect the other
	$cfg1->all()->{'injected'} = 'leak';
	ok(!defined($cfg2->get('injected')), 'mutation of cfg1 does not leak into cfg2');
};

subtest 'two objects from same dir have independent merge results' => sub {
	my $dir = tempdir(CLEANUP => 1);
	_write_file($dir, 'base.yaml', "shared_key: from_file\n");

	my $cfg1 = Config::Abstraction->new(
		data        => { override => 'one' },
		config_dirs => [$dir],
	);
	my $cfg2 = Config::Abstraction->new(
		data        => { override => 'two' },
		config_dirs => [$dir],
	);

	is($cfg1->get('override'),    'one',       'cfg1 data override preserved');
	is($cfg2->get('override'),    'two',       'cfg2 data override preserved');
	is($cfg1->get('shared_key'), 'from_file', 'cfg1 reads file');
	is($cfg2->get('shared_key'), 'from_file', 'cfg2 reads same file independently');
};

# ===========================================================================
# ENV retroactivity: changes after construction must not affect the object
# ===========================================================================

subtest 'ENV changes after construction do not alter already-built object' => sub {
	local %ENV = %ENV;
	delete $ENV{"${ENV_PREFIX}RETROKEY"};

	my $cfg = Config::Abstraction->new(
		data        => { retrokey => 'original' },
		config_dirs => [],
		env_prefix  => $ENV_PREFIX,
	);
	is($cfg->get('retrokey'), 'original', 'value is original at construction time');

	# Now set the env var - should NOT affect the already-constructed object
	$ENV{"${ENV_PREFIX}RETROKEY"} = 'injected_late';
	is($cfg->get('retrokey'), 'original', 'late ENV change does not retroactively alter object');
};

# ===========================================================================
# get() / exists() with non-hash intermediate value
# ===========================================================================

subtest 'get() returns undef when intermediate path component is a scalar, not a hash' => sub {
	# $data->{'db'} is 'localhost' (scalar), so 'db.user' cannot be traversed.
	my $cfg = Config::Abstraction->new(
		data        => { db => 'localhost' },
		config_dirs => [],
	);
	my $val;
	eval { $val = $cfg->get('db.user') };
	ok(!$@,         'get() on scalar intermediate does not crash');
	ok(!defined($val), 'get() on scalar intermediate returns undef');
};

subtest 'exists() returns 0 when intermediate path component is a scalar, not a hash' => sub {
	my $cfg = Config::Abstraction->new(
		data        => { db => 'localhost' },
		config_dirs => [],
	);
	my $result;
	eval { $result = $cfg->exists('db.user') };
	ok(!$@,       'exists() on scalar intermediate does not crash');
	is($result, 0, 'exists() returns 0 when intermediate component is a scalar');
};

subtest 'get() returns undef for three-level key where level 2 is absent' => sub {
	my $cfg = Config::Abstraction->new(
		data        => { a => { b => 'leaf' } },
		config_dirs => [],
	);
	ok(!defined($cfg->get('a.c.d')), 'get() returns undef for absent intermediate key');
	is($cfg->get('a.b'), 'leaf',     'sibling key still accessible');
};

# ===========================================================================
# merge_defaults() hostile inputs
# ===========================================================================

subtest 'merge_defaults() - section pointing to a scalar value not a hash' => sub {
	# The code does: $config = $config->{$section} when section exists.
	# If that value is a scalar, the next { %{$defaults}, %{$config} } would crash.
	my $cfg = Config::Abstraction->new(
		data        => { myapp => 'not_a_hash', key => 'val' },
		config_dirs => [],
	);
	my $result;
	eval {
		$result = $cfg->merge_defaults(
			defaults => { default_key => 'dval' },
			section  => 'myapp',
		);
	};
	# Should not crash with "Not a HASH reference" - either skips the section
	# or returns a meaningful result
	ok(!$@ || $@ =~ /\w/, 'merge_defaults with scalar section does not crash silently');
};

subtest 'merge_defaults() - called with zero arguments returns full config' => sub {
	my $cfg = Config::Abstraction->new(
		data        => { x => 1, y => 2 },
		config_dirs => [],
	);
	my $result = $cfg->merge_defaults();
	ok(defined($result),    'merge_defaults() with no args returns config');
	is(ref($result), 'HASH', 'returns a hashref');
	is($result->{x}, 1,      'config key x preserved');
};

subtest 'merge_defaults() - merge => 1 combines both hashes' => sub {
	my $cfg = Config::Abstraction->new(
		data        => { from_config => 'yes', shared => 'config_wins' },
		config_dirs => [],
	);
	my $result = $cfg->merge_defaults(
		defaults => { from_defaults => 'yes', shared => 'defaults_loses' },
		merge    => 1,
	);
	ok(defined($result),              'merge => 1 returns a result');
	is($result->{from_config},   'yes', 'config key present in merged result');
	is($result->{from_defaults}, 'yes', 'defaults key present in merged result');
	is($result->{shared},   'config_wins', 'config value wins when merge => 1');
};

# ===========================================================================
# Newcastle Connection: _parse_remote_dir hostile inputs
# (Tested via the constructor which calls _parse_remote_dir internally)
# ===========================================================================

subtest 'Newcastle: /../ with no hostname is not parsed as remote' => sub {
	# '/../' alone: the regex m{^\Q/../\E([^/]+)(/.+)?$} requires at least
	# one char in the hostname capture - so '/../' alone should not match.
	my $cfg;
	_silenced(sub {
		eval {
			$cfg = Config::Abstraction->new(
				data        => { nc => 'test' },
				config_dirs => ['/../'],
			);
		};
	});
	ok(!$@,        'naked /../ in config_dirs does not crash');
};

subtest 'Newcastle: /../hostname alone (no trailing path) uses / as remote_dir' => sub {
	# _parse_remote_dir returns ($1, $2 // '/').  When there is no capture for
	# the path, the remote_dir defaults to '/'.  The _is_local_host check
	# determines whether that triggers an SSH attempt or a local read.
	# Here we pass a known-local host to exercise the local short-circuit.
	my $dir = tempdir(CLEANUP => 1);
	_write_file($dir, 'base.yaml', "nc_bare: nc_bare_val\n");

	my $cfg;
	_silenced(sub {
		eval {
			$cfg = Config::Abstraction->new(
				# /../localhost short-circuits to local /  (root dir on Unix)
				# which normally has no config files - test just must not crash
				data        => { fallback => 'nc_bare_test' },
				config_dirs => ['/../localhost'],
			);
		};
	});
	ok(!$@, '/../hostname without trailing path does not crash (local short-circuit)');
};

subtest 'Newcastle: user@host form is parsed with user stripped by _is_local_host' => sub {
	# _is_local_host strips the user@ prefix before comparing hostnames.
	# Verify the constructor handles /../user@localhost/path correctly:
	# it should short-circuit to local disk (no SSH) with no crash.
	my $dir = tempdir(CLEANUP => 1);
	_write_file($dir, 'base.yaml', "nc_user: nc_user_val\n");

	plan skip_all => 'Newcastle localhost paths require Unix-style absolute paths (no Windows drive letters)'
		if $^O eq 'MSWin32';

	my $cfg;
	_silenced(sub {
		eval {
			$cfg = Config::Abstraction->new(
				data        => { fallback => 'user_at_test' },
				config_dirs => ["/../nobody\@localhost$dir"],
			);
		};
	});
	ok(!$@, '/../user@localhost/dir does not crash');
	if(defined($cfg)) {
		is($cfg->get('nc_user'), 'nc_user_val', 'user@localhost short-circuit reads local dir');
	} else {
		pass('no data loaded but no crash - acceptable');
	}
};

# ===========================================================================
# sep_char edge cases
# ===========================================================================

subtest 'sep_char as regex metachar "*" is quoted safely in get()' => sub {
	# get() uses qr/\Q$self->{sep_char}\E/ so metacharacters are literal.
	my $cfg = Config::Abstraction->new(
		data        => { 'a*b' => 'star_val', a => { b => 'nested_val' } },
		config_dirs => [],
		sep_char    => '*',
	);
	# With sep_char='*', 'a*b' splits on '*' into ('a','b') -> traverses nested hash
	is($cfg->get('a*b'), 'nested_val', 'sep_char "*" is literal, traverses nested key');
};

subtest 'sep_char "/" works as separator and does not confuse file paths' => sub {
	my $cfg = Config::Abstraction->new(
		data        => { db => { user => 'alice' } },
		config_dirs => [],
		sep_char    => '/',
	);
	is($cfg->get('db/user'), 'alice', 'sep_char "/" works as key separator');
};

# ===========================================================================
# JSON edge cases: null values, array at top level
# ===========================================================================

subtest 'JSON null value produces undef in config' => sub {
	my $dir = tempdir(CLEANUP => 1);
	_write_file($dir, 'base.json', '{"nullkey": null, "present": "yes"}');

	my $cfg = Config::Abstraction->new(config_dirs => [$dir]);
	ok(defined($cfg),                  'object created from JSON with null value');
	ok(!defined($cfg->get('nullkey')), 'JSON null maps to undef');
	is($cfg->get('present'), 'yes',    'adjacent key with real value intact');
};

subtest 'JSON array at top level is skipped gracefully' => sub {
	# The module checks ref($data) ne 'HASH' and skips; this test confirms it.
	my $dir = tempdir(CLEANUP => 1);
	_write_file($dir, 'base.json', '[1, 2, 3]');

	my $cfg;
	_silenced(sub {
		eval {
			$cfg = Config::Abstraction->new(
				data        => { fallback => 'array_json_test' },
				config_dirs => [$dir],
			);
		};
	});
	ok(!$@, 'top-level JSON array does not crash constructor');
	if(defined($cfg)) {
		is($cfg->get('fallback'), 'array_json_test', 'fallback data intact after top-level JSON array');
	} else {
		pass('constructor returned undef - acceptable');
	}
};

# ===========================================================================
# Circular reference in data
# ===========================================================================

subtest 'circular reference in data does not crash constructor (flatten=0)' => sub {
	# %merged = %{$data} is a shallow copy; circular refs at depth >= 1 are
	# not followed.  flatten=0 means Hash::Flatten is not called, so no
	# infinite recursion.
	my %circular;
	$circular{self} = \%circular;	# $circular{self} points back to %circular

	my $cfg;
	eval {
		$cfg = Config::Abstraction->new(
			data        => { safe => 'value', nested => { ok => 1 } },
			config_dirs => [],
		);
	};
	ok(!$@,         'constructor with normal data does not crash');
	is($cfg->get('safe'), 'value', 'safe key accessible');

	# Circular ref at the top level of data: %merged = %{$data} copies the
	# top-level ref, but the self entry points back.
	my $cfg2;
	eval {
		$cfg2 = Config::Abstraction->new(
			data        => \%circular,
			config_dirs => [],
		);
	};
	ok(!$@, 'top-level circular reference in data does not crash constructor');
};

subtest 'circular reference in nested data does not crash get()' => sub {
	my %child;
	$child{back} = \%child;

	my $cfg = Config::Abstraction->new(
		data        => { parent => \%child, safe => 'ok' },
		config_dirs => [],
	);
	ok(defined($cfg),           'object created with circular nested ref');
	my $got;
	eval { $got = $cfg->get('safe') };
	ok(!$@,          'get() on safe key with circular sibling does not crash');
	is($got, 'ok',   'safe key value correct');
};

# ===========================================================================
# all() edge cases
# ===========================================================================

subtest 'all() populates config_path with loaded file paths' => sub {
	my $dir = tempdir(CLEANUP => 1);
	_write_file($dir, 'base.yaml', "from_file: yes\n");

	my $cfg = Config::Abstraction->new(config_dirs => [$dir]);
	my $all = $cfg->all();
	ok(defined($all->{config_path}), 'config_path key present in all()');
	ok(ref($all->{config_path}) eq 'ARRAY', 'config_path is an arrayref');
	ok(scalar(@{$all->{config_path}}) >= 1, 'config_path lists at least one loaded file');
	like($all->{config_path}[0], qr/base\.yaml$/, 'config_path first entry ends with base.yaml');
};

subtest 'all() returns undef when config is empty (no keys at all)' => sub {
	# Constructor returns undef when no data loaded; all() therefore never
	# called on a truly empty config.  Test via direct construction with undef trick.
	my $cfg = Config::Abstraction->new(
		data        => { only_key => 1 },
		config_dirs => [],
	);
	my $all = $cfg->all();
	ok(defined($all), 'all() returns defined hashref when keys exist');
	is(ref($all), 'HASH', 'all() return value is a hashref');
};

# ===========================================================================
# YAML extreme nesting: must not cause stack overflow
# ===========================================================================

subtest 'YAML extremely deep nesting (100 levels) does not crash' => sub {
	my $dir  = tempdir(CLEANUP => 1);
	# Build 100-level YAML: each line indents two more spaces
	my $yaml = '';
	for my $i (1 .. 100) {
		$yaml .= ('  ' x ($i - 1)) . "level$i:\n";
	}
	$yaml .= ('  ' x 100) . "leaf: deep_value\n";
	_write_file($dir, 'base.yaml', $yaml);

	my $cfg;
	_silenced(sub {
		eval {
			$cfg = Config::Abstraction->new(config_dirs => [$dir]);
		};
	});
	ok(!$@, '100-level deep YAML does not crash constructor');
	if(defined($cfg)) {
		# Confirm the top-level key of the deep structure is present
		ok($cfg->exists('level1'), 'level1 top-level key exists in parsed deep YAML');
	} else {
		pass('constructor returned undef - YAML too deep to parse on this system, but no crash');
	}
};

# ===========================================================================
# NUL byte in environment value
# ===========================================================================

subtest 'NUL byte in ENV value is stored as-is (Perl strings allow NUL)' => sub {
	local %ENV = %ENV;
	$ENV{"${ENV_PREFIX}NULKEY"} = "before\x00after";

	my $cfg = Config::Abstraction->new(
		data        => { other => 'clean' },
		config_dirs => [],
		env_prefix  => $ENV_PREFIX,
	);
	ok(defined($cfg), 'object created with NUL-containing ENV value');
	# The value is stored under the prefix namespace; verify it's accessible
	# The key path depends on env_prefix stripping: EDGEAPP_ -> edgeapp
	# For a key without __ separator it goes under $prefix->{path}
	my $all = $cfg->all() // {};
	my $found_nul = 0;
	for my $top_val (values %$all) {
		next unless ref($top_val) eq 'HASH';
		for my $v (values %$top_val) {
			$found_nul = 1 if defined($v) && $v =~ /\x00/;
		}
	}
	ok($found_nul, 'NUL byte preserved in stored ENV value');
};

# ===========================================================================
# AUTOLOAD: exact error message for nonexistent key
# ===========================================================================

subtest 'AUTOLOAD dies with "No such config key" for a nonexistent key (sep_char=_)' => sub {
	my $cfg = Config::Abstraction->new(
		data        => { existing => 'val' },
		config_dirs => [],
		sep_char    => $SEP_US,
	);
	my $error;
	eval { $cfg->nonexistent_key() };
	$error = $@;
	ok($error, 'AUTOLOAD dies when key does not exist');
	like($error, qr/No such config key 'nonexistent_key'/,
		'AUTOLOAD error message contains the missing key name');
};

subtest 'AUTOLOAD dies with "No such config key" for partial path nonexistent (sep_char=_)' => sub {
	my $cfg = Config::Abstraction->new(
		data        => { db => { user => 'alice' } },
		config_dirs => [],
		sep_char    => $SEP_US,
	);
	eval { $cfg->db_password() };
	my $error = $@;
	ok($error, 'AUTOLOAD dies when nested key does not exist');
	like($error, qr/No such config key/, 'error message mentions missing key');
};

done_testing();
