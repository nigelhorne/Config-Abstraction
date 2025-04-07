Here’s a `Makefile.PL` you can use to package and install **Config::Abstraction** using `ExtUtils::MakeMaker`:

```perl
use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME         => 'Config::Abstraction',
    VERSION_FROM => 'lib/Config/Abstraction.pm', # Path to your module
    AUTHOR       => 'Nigel Horne <njh@nigelhorne.com>',
    ABSTRACT     => 'A modern layered configuration loader with ENV support',
    LICENSE      => 'perl',
    MIN_PERL_VERSION => '5.10.0',
    PREREQ_PM    => {
        'Carp'             => 0,
        'YAML::XS'         => 0,
        'JSON::MaybeXS'    => 0,
        'File::Slurp'      => 0,
        'File::Spec'       => 0,
        'Hash::Merge'      => 0,
        'Hash::Flatten'    => 0,
    },
    META_MERGE => {
        resources => {
            repository => 'https://github.com/nigelhorne/Config-Abstraction',
            bugtracker => 'https://github.com/nigelhorne/Config-Abstraction/issues',
            homepage   => 'https://metacpan.org/pod/Config::Abstraction',
        },
    },
);
