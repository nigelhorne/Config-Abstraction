use strict;
use warnings;
use Test::Most;
use File::Path qw(make_path remove_tree);
use File::Spec;
use File::Slurp qw(write_file);
use FindBin;
use lib "$FindBin::Bin/../lib";

use Config::Abstraction;

my $test_dir = File::Spec->catdir($FindBin::Bin, 'test_config');
remove_tree($test_dir);
make_path($test_dir);

# Create base.yaml
write_file("$test_dir/base.yaml", <<'YAML');
database:
  user: base_user
  pass: base_pass
YAML

# Create local.json
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

# Set an environment variable to override config
$ENV{APP_DATABASE__USER} = 'env_user';
$ENV{APP_EXTRA__DEBUG}   = '1';

# Basic test (flatten = 0)
my $config = Config::Abstraction->new(
    config_dirs => [$test_dir],
    env_prefix  => 'APP_',
    flatten     => 0,
);

is $config->get('database.user'), 'env_user', 'ENV override works';
is $config->get('database.pass'), 'local_pass', 'local.json overrides base.yaml';
ok $config->get('feature.enabled'), 'feature.enabled is true';
is $config->get('extra.debug'), '1', 'extra.debug loaded from ENV';
is_deeply $config->get('database'), {
    user => 'env_user',
    pass => 'local_pass',
}, 'database merged properly';

# Flattened test
my $flat = Config::Abstraction->new(
    config_dirs => [$test_dir],
    env_prefix  => 'APP_',
    flatten     => 1,
);

is $flat->get('database.user'), 'env_user', 'Flattened: ENV override still works';
is $flat->get('feature.enabled'), 1, 'Flattened: JSON boolean true works';
ok exists $flat->all->{'extra.debug'}, 'Flattened: ENV key exists';

remove_tree($test_dir);

done_testing();
