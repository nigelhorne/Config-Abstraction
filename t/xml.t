use strict;
use warnings;
use Test::Most;
# use File::Path qw(make_path remove_tree);
use File::Spec;
use File::Slurp qw(write_file);
# use FindBin;
# use lib "$FindBin::Bin/../lib";
use Test::TempDir::Tiny;

BEGIN { use_ok('Config::Abstraction') }

my $test_dir = tempdir();

write_file(File::Spec->catdir($test_dir, 'xml_test'), <<'XML');
<?xml version="1.0"?>
<config>
	<UserName>njh</UserName>
</config>
XML

my $config = Config::Abstraction->new(
	config_dirs => [$test_dir],
	config_file => 'xml_test'
);

diag(Data::Dumper->new([$config])->Dump()) if($ENV{'TEST_VERBOSE'});
cmp_ok($config->get('UserName'), 'eq', 'njh', 'XML can be read in from a file');

done_testing();
