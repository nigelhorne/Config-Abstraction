use strict;
use warnings;
use Test::Most;
# use File::Path qw(make_path remove_tree);
use File::Spec;
use File::Slurp qw(write_file);
# use FindBin;
# use lib "$FindBin::Bin/../lib";
use Test::TempDir::Tiny;

use Config::Abstraction;

# my $test_dir = File::Spec->catdir($FindBin::Bin, 'test_config');
my $test_dir = tempdir();
# remove_tree($test_dir);
# make_path($test_dir);

# base.yaml
write_file("$test_dir/base.yaml", <<'YAML');
database:
  user: base_user
  pass: base_pass
YAML

# local.json
write_file("$test_dir/local.json", <<'JSON');
{
  "database": {
    "pass": "local_pass"
  },
  "feature": {
    "enabled": true
  }
}
JSON

# base.xml
write_file("$test_dir/base.xml", <<'XML');
<config>
  <api>
    <url>https://api.example.com</url>
    <timeout>30</timeout>
  </api>
</config>
XML

# local.xml
write_file("$test_dir/local.xml", <<'XML');
<config>
  <api>
    <timeout>60</timeout>
  </api>
</config>
XML

# base.ini
write_file("$test_dir/base.ini", <<'INI');
[logging]
level=info
file=logfile.log
INI

# local.ini
write_file("$test_dir/local.ini", <<'INI');
[logging]
level=debug
INI

# Set ENV override
local %ENV;
$ENV{APP_DATABASE__USER} = 'env_user';
$ENV{APP_EXTRA__DEBUG}   = '1';

# Load config
my $config = Config::Abstraction->new(
	config_dirs => [$test_dir],
	env_prefix  => 'APP_',
	flatten     => 0,
);

# YAML + JSON
is $config->get('database.user'), 'env_user', 'ENV override on database.user';
is $config->get('database.pass'), 'local_pass', 'local.json overrides base.yaml';
ok $config->get('feature.enabled'), 'feature.enabled from JSON';
is $config->get('extra.debug'), '1', 'extra.debug from ENV';

# XML merge
is $config->get('api.url'), 'https://api.example.com', 'API URL from base.xml';
is $config->get('api.timeout'), '60', 'local.xml overrides base.xml';

# Check INI merging
is $config->get('logging.level'), 'debug', 'local.ini overrides base.ini';
is $config->get('logging.file'), 'logfile.log', 'base.ini sets logging.file';

# Check ENV merging
is $config->get('extra.debug'), '1', 'extra.debug from ENV';

# Undefined value
is($config->get('extra.foo'), undef, 'Undefined keys return undef');

# Flattened test
my $flat = Config::Abstraction->new(
	config_dirs => [$test_dir],
	env_prefix  => 'APP_',
	flatten     => 1,
);

is $flat->get('api.timeout'), '60', 'Flattened: XML override timeout';
is($flat->get('database.user'), 'env_user', 'Flattened: ENV override still works');

# Test config_file
write_file("$test_dir/foo", <<'YAML');
first:
  second: value
YAML

$config = Config::Abstraction->new(
	config_dirs => [$test_dir],
	config_file => 'foo'
);

diag(Data::Dumper->new([$config])->Dump()) if($ENV{'TEST_VERBOSE'});

cmp_ok($config->get('first.second'), 'eq', 'value', 'Action similar to Config::Auto works');

# remove_tree($test_dir);
done_testing();
