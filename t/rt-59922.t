use strict;
use warnings;
use Test::Most;
use File::Spec;
use File::Slurp qw(write_file);
use Test::TempDir::Tiny;

BEGIN { use_ok('Config::Abstraction') }

my $test_dir = tempdir();

write_file(File::Spec->catdir($test_dir, 'test'), <<'FIN');
foo: "xyzzy plugh"
FIN

my $config = Config::Abstraction->new(
	config_dirs => [$test_dir],
	config_file => 'test'
);

diag(Data::Dumper->new([$config])->Dump()) if($ENV{'TEST_VERBOSE'});
cmp_ok($config->get('foo'), 'eq', 'xyzzy plugh', 'Handles RT#59922');

done_testing();
