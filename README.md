# NAME

Config::Abstraction - Configuration Abstraction Layer

# SYNOPSIS

    use Config::Abstraction;

    my $config = Config::Abstraction->new(
        config_dirs => ['config'],
        env_prefix  => 'MYAPP_',
        flatten     => 0,
    );

    my $db_user = $config->get('database.user');

# DESCRIPTION

This module loads layered configuration files in YAML or JSON format
and merges them together. It also supports environment variable overrides.

# METHODS

## new

Options:
  - config\_dirs: Arrayref of directories to look for config files
  - env\_prefix: Prefix for ENV keys (e.g. MYAPP\_DATABASE\_\_USER)
  - flatten: Return flat keys like 'database.user'

## get(key)

Retrieve a value using dotted key notation.

## all()

Return the entire config hash (possibly flattened).

# AUTHOR

Nigel Horne, `<njh at nigelhorne.com>`
