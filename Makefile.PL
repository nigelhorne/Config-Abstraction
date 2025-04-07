use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
	NAME		 => 'Config::Abstraction',
	VERSION_FROM => 'lib/Config/Abstraction.pm', # Path to your module
	AUTHOR	=> 'Nigel Horne <njh@nigelhorne.com>',
	ABSTRACT_FROM	=> 'lib/Config/Abstraction.pm',
	((defined($ExtUtils::MakeMaker::VERSION) && ($ExtUtils::MakeMaker::VERSION >= 6.3002))
		? ('LICENSE'=> 'GPL')
		: ()),
	MIN_PERL_VERSION => '5.10.0',
	PREREQ_PM	=> {
		'Carp'		 => 0,
		'Config::IniFiles' => 0,
		'JSON::MaybeXS'	=> 0,
		'YAML::XS'	 => 0,
		'XML::Simple' => 0,
		'File::Slurp'	=> 0,
		'File::Spec'	=> 0,
		'Hash::Merge'	=> 0,
		'Hash::Flatten'	=> 0,
	},
	META_MERGE => {
		resources => {
			repository => 'https://github.com/nigelhorne/Config-Abstraction',
			bugtracker => 'https://github.com/nigelhorne/Config-Abstraction/issues',
			homepage => 'https://metacpan.org/pod/Config::Abstraction',
		},
	}, TEST_REQUIRES => {
		'Test::DescribeMe' => 0,
		'Test::Needs' => 0,
		'Test::TempDir::Tiny' => 0,
	}
);
