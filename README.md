# NAME

Config::Abstraction - Configuration Abstraction Layer

# SYNOPSIS

    use Config::Abstraction;

    my $config = Config::Abstraction->new(
      config_dirs => ['config'],
      env_prefix  => 'MYAPP_',
      flatten => 0,
    );

    my $db_user = $config->get('database.user');

# DESCRIPTION

This module loads layered configuration files in YAML, JSON, XML and INI format
and merges them together.
It also supports environment variable and command line overrides.

# METHODS

## new

Options:

- `config_dirs`

    Arrayref of directories to look for config files

- `env_prefix`

    Prefix for ENV keys and command line options (e.g. MYAPP\_DATABASE\_\_USER)

- `flatten`

    Return flat keys like 'database.user'

## get(key)

Retrieve a value using dotted key notation.

## all()

Return the entire config hash (possibly flattened).

# SUPPORT

This module is provided as-is without any warranty.

Please report any bugs or feature requests to `bug-config-abstraction at rt.cpan.org`,
or through the web interface at
[http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Config-Abstraction](http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Config-Abstraction).
I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.

You can find documentation for this module with the perldoc command.

    perldoc Config::Abstraction

# SEE ALSO

- [Config::Auto](https://metacpan.org/pod/Config%3A%3AAuto)

# AUTHOR

Nigel Horne, `<njh at nigelhorne.com>`
