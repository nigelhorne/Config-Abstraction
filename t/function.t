#!/usr/bin/perl

# White-box tests for Config::Abstraction public and internal methods.
# Uses Test::Mockingbird to mock non-core dependencies.

use strict;
use warnings;
use autodie qw(:all);

use Test::Most;
use Test::Mockingbird;
use Readonly;
use Scalar::Util qw(blessed reftype);

# ---------------------------------------------------------------------------
# Configuration - can be overridden via Object::Configure
# ---------------------------------------------------------------------------
my %config = (
	module		=> 'Config::Abstraction',
	sep_char	=> '.',
	env_prefix	=> 'TESTAPP_',
	flatten_off	=> 0,
	flatten_on	=> 1,
);

Readonly::Scalar my $MODULE		=> $config{module};
Readonly::Scalar my $SEP		=> $config{sep_char};
Readonly::Scalar my $ENV_PREFIX		=> $config{env_prefix};
Readonly::Scalar my $FLATTEN_OFF	=> $config{flatten_off};
Readonly::Scalar my $FLATTEN_ON		=> $config{flatten_on};

Readonly::Scalar my $EXPECTED_USER	=> 'alice';
Readonly::Scalar my $EXPECTED_PASS	=> 'secret';
Readonly::Scalar my $EXPECTED_PORT	=> 5432;
Readonly::Scalar my $EXPECTED_LEVEL	=> 'info';
Readonly::Scalar my $EXPECTED_RETRIES	=> 3;
Readonly::Scalar my $EXPECTED_CB_RESULT	=> 'callback_result';

Readonly::Hash my %FLAT_DATA => (
	'database.user'	=> $EXPECTED_USER,
	'database.pass'	=> $EXPECTED_PASS,
	'log.level'	=> $EXPECTED_LEVEL,
);

Readonly::Hash my %NESTED_DATA => (
	database => {
		user => $EXPECTED_USER,
		pass => $EXPECTED_PASS,
		port => $EXPECTED_PORT,
	},
	log => {
		level => $EXPECTED_LEVEL,
	},
	retries => $EXPECTED_RETRIES,
);

# ---------------------------------------------------------------------------
use_ok($MODULE) or BAIL_OUT("$MODULE failed to load");

# ---------------------------------------------------------------------------
# Helper: build a basic object with no filesystem config loading
# ---------------------------------------------------------------------------
sub _make_cfg
{
	my (%extra) = @_;
	return Config::Abstraction->new(
		data        => \%NESTED_DATA,
		config_dirs => [],
		%extra,
	);
}

# ===========================================================================
# new() - constructor
# ===========================================================================
subtest 'new() - basic construction with data' => sub {
	my $cfg = _make_cfg();
	ok(defined($cfg),        'returns a defined object');
	ok(blessed($cfg),        'object is blessed');
	is(blessed($cfg), $MODULE, 'blessed into correct class');
};

subtest 'new() - single-arg form treated as filename' => sub {
	# When one arg given, it should be stored as 'file'
	# Mock File::Slurp and parsers so no actual filesystem hit is needed;
	# we just verify the object initialises the key correctly.
	my $cfg = Config::Abstraction->new(
		file        => '/nonexistent/path.yaml',
		data        => { dummy => 'value' },
		config_dirs => [],
	);
	ok(defined($cfg), 'object created when file key provided');
};

subtest 'new() - defaults hash takes precedence over direct params' => sub {
	my $cfg = Config::Abstraction->new(
		defaults => {
			data        => \%NESTED_DATA,
			config_dirs => [],
			sep_char    => $SEP,
		},
		env_prefix => $ENV_PREFIX,	# top-level env_prefix still honoured
	);
	ok(defined($cfg), 'object created via defaults hash');
	is($cfg->{sep_char},   $SEP,        'sep_char taken from defaults');
	is($cfg->{env_prefix}, $ENV_PREFIX, 'top-level env_prefix overrides defaults');
};

subtest 'new() - returns undef when config is empty' => sub {
	# An empty data hash with no config files should produce undef
	my $guard = mock_scoped 'Config::Abstraction::_load_config' => sub {
		my $self = shift;
		$self->{config} = {};
	};
	my $cfg = Config::Abstraction->new(
		data        => {},
		config_dirs => [],
	);
	ok(!defined($cfg), 'returns undef when config hash is empty after load');
};

subtest 'new() - env_prefix defaults to APP_' => sub {
	my $cfg = _make_cfg();
	is($cfg->{env_prefix}, 'APP_', 'default env_prefix is APP_');
};

subtest 'new() - sep_char defaults to dot' => sub {
	my $cfg = _make_cfg();
	is($cfg->{sep_char}, $SEP, 'default sep_char is dot');
};

subtest 'new() - schema validation applied when schema provided' => sub {
	my $called = 0;
	my $guard = mock_scoped 'Params::Validate::Strict::validate_strict' => sub {
		$called++;
		my $args = ref($_[0]) eq 'HASH' ? $_[0] : {@_};
		return $args->{input};    # pass-through
	};
	my $cfg = Config::Abstraction->new(
		data        => \%NESTED_DATA,
		config_dirs => [],
		schema      => {
			retries => { type => 'integer' },
			database => { type => 'hashref' },
			log => { type => 'hashref' },
		},
	);
	is($called, 1, 'validate_strict called when schema provided');
};

# ===========================================================================
# get()
# ===========================================================================
subtest 'get() - top-level scalar key' => sub {
	my $cfg = _make_cfg();
	is($cfg->get('retries'), $EXPECTED_RETRIES, 'retrieves top-level scalar');
};

subtest 'get() - nested key via dotted notation' => sub {
	my $cfg = _make_cfg();
	is($cfg->get('database.user'), $EXPECTED_USER, 'retrieves nested key');
	is($cfg->get('database.port'), $EXPECTED_PORT, 'retrieves nested integer');
};

subtest 'get() - returns undef for missing key' => sub {
	my $cfg = _make_cfg();
	ok(!defined($cfg->get('no.such.key')), 'returns undef for absent key');
};

subtest 'get() - returns undef mid-path when ancestor not a hash' => sub {
	my $cfg = Config::Abstraction->new(
		data        => { flat => 'scalar' },
		config_dirs => [],
	);
	ok(!defined($cfg->get('flat.child')), 'undef when mid-path value is scalar');
};

subtest 'get() - returns hashref for partial path' => sub {
	my $cfg = _make_cfg();
	my $db = $cfg->get('database');
	ok(defined($db),             'partial path returns defined value');
	is(reftype($db), 'HASH',     'partial path returns hashref');
	is($db->{user}, $EXPECTED_USER, 'hashref contents correct');
};

subtest 'get() - coderef value preserved and callable' => sub {
	my $cb = sub { $EXPECTED_CB_RESULT };
	my $cfg = Config::Abstraction->new(
		data        => { callback => $cb },
		config_dirs => [],
	);
	my $got = $cfg->get('callback');
	is(reftype($got), 'CODE',          'coderef preserved through get()');
	is($got->(), $EXPECTED_CB_RESULT,  'coderef is callable');
};

subtest 'get() - blessed object value preserved' => sub {
	package _TestObj;
	sub new   { bless { v => $_[1] }, $_[0] }
	sub value { $_[0]->{v} }
	package main;

	my $obj = _TestObj->new($EXPECTED_PORT);
	my $cfg = Config::Abstraction->new(
		data        => { handler => $obj },
		config_dirs => [],
	);
	my $got = $cfg->get('handler');
	ok(blessed($got),               'blessed object preserved through get()');
	is(blessed($got), '_TestObj',   'class unchanged');
	is($got->value(), $EXPECTED_PORT, 'object is functional');
};

subtest 'get() - flat mode uses direct key lookup' => sub {
	my $cfg = Config::Abstraction->new(
		data        => \%NESTED_DATA,
		config_dirs => [],
		flatten     => $FLATTEN_ON,
	);
	is($cfg->get('database.user'), $EXPECTED_USER, 'flat mode direct key lookup');
};

subtest 'get() - custom sep_char respected' => sub {
	my $cfg = Config::Abstraction->new(
		data => {
			database => { user => $EXPECTED_USER },
		},
		config_dirs => [],
		sep_char    => '/',
	);
	is($cfg->get('database/user'), $EXPECTED_USER, 'custom sep_char used in get()');
};

subtest 'get() - repeated calls on hashref value do not crash' => sub {
	my $cfg = _make_cfg();
	my $first  = $cfg->get('database');
	my $second = $cfg->get('database');
	ok(defined($second),          'second get() on hashref key succeeds');
	is($second->{user}, $EXPECTED_USER, 'value correct on second get()');
};

# ===========================================================================
# exists()
# ===========================================================================
subtest 'exists() - returns 1 for present key' => sub {
	my $cfg = _make_cfg();
	is($cfg->exists('database.user'), 1, 'exists() returns 1 for present key');
};

subtest 'exists() - returns 0 for absent key' => sub {
	my $cfg = _make_cfg();
	is($cfg->exists('no.such.key'), 0, 'exists() returns 0 for absent key');
};

subtest 'exists() - returns 0 when mid-path not a hash' => sub {
	my $cfg = Config::Abstraction->new(
		data        => { flat => 'scalar' },
		config_dirs => [],
	);
	is($cfg->exists('flat.child'), 0, 'exists() returns 0 mid-path scalar');
};

subtest 'exists() - top-level key' => sub {
	my $cfg = _make_cfg();
	is($cfg->exists('retries'), 1, 'exists() finds top-level key');
};

subtest 'exists() - flat mode' => sub {
	my $cfg = Config::Abstraction->new(
		data        => \%NESTED_DATA,
		config_dirs => [],
		flatten     => $FLATTEN_ON,
	);
	is($cfg->exists('database.user'), 1, 'exists() flat mode finds key');
	is($cfg->exists('no.key'),        0, 'exists() flat mode returns 0 for absent key');
};

# ===========================================================================
# all()
# ===========================================================================
subtest 'all() - returns entire config hashref' => sub {
	my $cfg = _make_cfg();
	my $all = $cfg->all();
	ok(defined($all),         'all() returns defined value');
	is(reftype($all), 'HASH', 'all() returns hashref');
	ok(exists $all->{database}, 'top-level key present in all()');
};

subtest 'all() - returns undef when config empty' => sub {
	my $cfg = _make_cfg();
	$cfg->{config} = {};
	ok(!defined($cfg->all()), 'all() returns undef when config is empty');
};

# ===========================================================================
# merge_defaults()
# ===========================================================================
subtest 'merge_defaults() - merges config over defaults' => sub {
	my $cfg = _make_cfg();
	my $merged = $cfg->merge_defaults(
		defaults => { retries => 99, extra => 'kept' },
	);
	ok(defined($merged),          'merge_defaults returns defined value');
	is($merged->{retries}, $EXPECTED_RETRIES, 'config value overrides default');
	is($merged->{extra},  'kept', 'default-only key preserved');
};

subtest 'merge_defaults() - merge option combines both hashes' => sub {
	my $cfg = _make_cfg();
	my $merged = $cfg->merge_defaults(
		defaults => { extra => 'from_default' },
		merge    => 1,
	);
	ok(exists $merged->{extra},    'default-only key present when merge=>1');
	ok(exists $merged->{database}, 'config key present when merge=>1');
};

subtest 'merge_defaults() - section option scopes to named section' => sub {
	my $cfg = _make_cfg();
	my $merged = $cfg->merge_defaults(
		defaults => {},
		section  => 'database',
	);
	is($merged->{user}, $EXPECTED_USER, 'section scoping returns section hash');
	ok(!exists $merged->{retries},      'keys outside section not included');
};

subtest 'merge_defaults() - global section merged into defaults' => sub {
	my $cfg = Config::Abstraction->new(
		data => {
			global  => { timeout => 30 },
			retries => $EXPECTED_RETRIES,
		},
		config_dirs => [],
	);
	my $merged = $cfg->merge_defaults(defaults => { timeout => 99 });
	is($merged->{timeout}, 30, 'global section overrides defaults');
};

subtest 'merge_defaults() - no args returns full config' => sub {
	my $cfg = _make_cfg();
	my $result = $cfg->merge_defaults();
	ok(defined($result),         'no-arg merge_defaults returns config');
	is(reftype($result), 'HASH', 'returns hashref');
};

# ===========================================================================
# AUTOLOAD
# ===========================================================================
subtest 'AUTOLOAD - resolves top-level key' => sub {
	my $cfg = Config::Abstraction->new(
		data        => { retries => $EXPECTED_RETRIES },
		config_dirs => [],
		sep_char    => '_',
	);
	is($cfg->retries(), $EXPECTED_RETRIES, 'AUTOLOAD resolves top-level key');
};

subtest 'AUTOLOAD - resolves nested key via sep_char' => sub {
	my $cfg = Config::Abstraction->new(
		data        => { database => { user => $EXPECTED_USER } },
		config_dirs => [],
		sep_char    => '_',
	);
	is($cfg->database_user(), $EXPECTED_USER, 'AUTOLOAD resolves nested key');
};

subtest 'AUTOLOAD - croaks on nonexistent key' => sub {
	my $cfg = Config::Abstraction->new(
		data        => { known => 'value' },
		config_dirs => [],
		sep_char    => '_',
	);
	eval { $cfg->nonexistent_key() };
	like($@, qr/No such config key/, 'AUTOLOAD croaks on missing key');
};

# ===========================================================================
# _is_plain_scalar() - internal helper
# ===========================================================================
subtest '_is_plain_scalar() - returns 1 for plain defined string' => sub {
	ok(Config::Abstraction::_is_plain_scalar('hello'), 'plain string returns 1');
};

subtest '_is_plain_scalar() - returns 1 for plain number' => sub {
	ok(Config::Abstraction::_is_plain_scalar(42), 'plain number returns 1');
};

subtest '_is_plain_scalar() - returns 0 for undef' => sub {
	is(Config::Abstraction::_is_plain_scalar(undef), 0, 'undef returns 0');
};

subtest '_is_plain_scalar() - returns 0 for coderef' => sub {
	ok(!Config::Abstraction::_is_plain_scalar(sub {}), 'coderef returns 0');
};

subtest '_is_plain_scalar() - returns 0 for hashref' => sub {
	ok(!Config::Abstraction::_is_plain_scalar({}), 'hashref returns 0');
};

subtest '_is_plain_scalar() - returns 0 for arrayref' => sub {
	ok(!Config::Abstraction::_is_plain_scalar([]), 'arrayref returns 0');
};

subtest '_is_plain_scalar() - returns 0 for blessed object' => sub {
	my $obj = bless {}, 'Some::Class';
	ok(!Config::Abstraction::_is_plain_scalar($obj), 'blessed object returns 0');
};

# ===========================================================================
# _load_driver() - internal helper
# ===========================================================================
subtest '_load_driver() - returns 1 on successful load' => sub {
	my $cfg = _make_cfg();
	# Scalar::Util is already loaded in this process
	my $result = $cfg->_load_driver('Scalar::Util');
	is($result, 1, '_load_driver returns 1 for loadable module');
};

subtest '_load_driver() - caches successful load' => sub {
	my $cfg = _make_cfg();
	$cfg->_load_driver('Scalar::Util');
	ok($cfg->{loaded}{'Scalar::Util'}, 'successful load cached in {loaded}');
};

subtest '_load_driver() - returns false for nonexistent module' => sub {
	my $cfg = _make_cfg();
	my $result = $cfg->_load_driver('No::Such::Module::XYZ');
	ok(!$result, '_load_driver returns false for missing module');
};

subtest '_load_driver() - caches failed load' => sub {
	my $cfg = _make_cfg();
	$cfg->_load_driver('No::Such::Module::XYZ');
	ok($cfg->{failed}{'No::Such::Module::XYZ'}, 'failed load cached in {failed}');
};

subtest '_load_driver() - skips reload of already-loaded module' => sub {
	my $cfg = _make_cfg();
	$cfg->{loaded}{'Scalar::Util'} = 1;
	my $result = $cfg->_load_driver('Scalar::Util');
	is($result, 1, 'returns 1 from cache without re-requiring');
};

subtest '_load_driver() - skips retry of already-failed module' => sub {
	my $cfg = _make_cfg();
	$cfg->{failed}{'No::Such::Module::XYZ'} = 1;
	my $result = $cfg->_load_driver('No::Such::Module::XYZ');
	ok(!$result, 'returns false from cache without re-attempting');
};

# ===========================================================================
# Environment variable merging (via _load_config internals)
# ===========================================================================
subtest 'ENV vars with prefix override data values' => sub {
	local %ENV = %ENV;
	$ENV{'TESTAPP_RETRIES'} = '99';

	my $cfg = Config::Abstraction->new(
		data        => { TESTAPP => { retries => $EXPECTED_RETRIES } },
		config_dirs => [],
		env_prefix  => $ENV_PREFIX,
	);
	is($cfg->get('TESTAPP.retries'), '99', 'ENV var stored under prefix namespace');
};

subtest 'ENV vars with double-underscore create nested keys' => sub {
	local %ENV = %ENV;
	$ENV{'TESTAPP_DATABASE__USER'} = 'env_user';

	my $cfg = Config::Abstraction->new(
		data => {
			database => { user => $EXPECTED_USER, pass => $EXPECTED_PASS },
			retries  => $EXPECTED_RETRIES,
		},
		config_dirs => [],
		env_prefix  => $ENV_PREFIX,
	);
	is($cfg->get('database.user'), 'env_user', 'double-underscore ENV creates nested key');
};

# ===========================================================================
# Command-line argument merging (via _load_config internals)
# ===========================================================================
subtest 'CLI args override data values' => sub {
	local @ARGV = ("--TESTAPP_RETRIES=77");

	my $cfg = Config::Abstraction->new(
		data        => { retries => $EXPECTED_RETRIES },
		config_dirs => [],
		env_prefix  => $ENV_PREFIX,
	);
	is($cfg->get('retries'), '77', 'CLI arg overrides data value');
};

subtest 'CLI args with double-underscore create nested keys' => sub {
	# \%NESTED_DATA must not be used here - the CLI merge path modifies nested
	# hashrefs in-place via shared references from the shallow copy of 'data',
	# which would attempt to modify the Readonly nested hashrefs and die.
	# Use a fresh anonymous hash instead so the merge can write freely.
	local @ARGV = ('--TESTAPP_DATABASE__USER=cli_user');

	my $cfg = Config::Abstraction->new(
		data => {
			database => { user => $EXPECTED_USER, pass => $EXPECTED_PASS },
			retries  => $EXPECTED_RETRIES,
		},
		config_dirs => [],
		env_prefix  => $ENV_PREFIX,
	);
	is($cfg->get('database.user'), 'cli_user', 'CLI double-underscore creates nested key');
};

# ===========================================================================
# Coderef / blessed-object protection (regression for corruption bug)
# ===========================================================================
subtest 'coderef in data not corrupted by _load_config' => sub {
	my $cb = sub { $EXPECTED_CB_RESULT };
	my $cfg = Config::Abstraction->new(
		data        => { callback => $cb, tags => 'alpha,beta' },
		config_dirs => [],
	);
	my $got = $cfg->get('callback');
	is(reftype($got), 'CODE',         'coderef type intact after load');
	is($got->(), $EXPECTED_CB_RESULT, 'coderef callable after load');
};

subtest 'blessed object in data not corrupted by _load_config' => sub {
	my $obj = bless { v => $EXPECTED_PORT }, '_BlessedVal';
	my $cfg = Config::Abstraction->new(
		data        => { handler => $obj },
		config_dirs => [],
	);
	my $got = $cfg->get('handler');
	ok(blessed($got),                'blessed object intact after load');
	is(blessed($got), '_BlessedVal', 'class name unchanged after load');
};

# ===========================================================================
# TestProxy -- minimal subclass that satisfies the UNIVERSAL::isa guard on
# _load_remote_dir and _parse_config_string.  Calling those methods directly
# from 'main' would croak; routing through a genuine subclass keeps the guard
# happy without altering the behaviour under test.
# ===========================================================================
package Config::Abstraction::TestProxy;
use parent -norequire, 'Config::Abstraction';
sub test_load_remote_dir     { my $self = shift; return $self->_load_remote_dir(@_)     }
sub test_parse_config_string { my $self = shift; return $self->_parse_config_string(@_) }
package main;

# Provide a minimal stub so remote-path tests run whether or not
# File::Slurp::Remote is installed.  Individual subtests mock the body.
unless(eval { require File::Slurp::Remote; 1 }) {
	no warnings 'once';
	*File::Slurp::Remote::read_file = sub {};
	$INC{'File/Slurp/Remote.pm'} = 1;
}

Readonly::Scalar my $REMOTE_HOST  => 'cfg.example.com';
Readonly::Scalar my $REMOTE_DIR   => '/etc/myapp';
Readonly::Scalar my $REMOTE_USER  => 'deploy';
Readonly::Scalar my $YAML_CONTENT => "---\nfoo: bar\nbaz: 42\n";
Readonly::Scalar my $JSON_CONTENT => '{"foo":"bar","baz":42}';
Readonly::Scalar my $INI_CONTENT  => "[section]\nkey=value\nother=123\n";

# ===========================================================================
# _parse_remote_dir()
# ===========================================================================
subtest '_parse_remote_dir() - returns empty list for a plain absolute path' => sub {
	my $cfg    = _make_cfg();
	my @result = $cfg->_parse_remote_dir('/etc/myapp');
	is(scalar(@result), 0, 'plain absolute path returns empty list');
};

subtest '_parse_remote_dir() - returns empty list for a relative path' => sub {
	my $cfg    = _make_cfg();
	my @result = $cfg->_parse_remote_dir('conf/local');
	is(scalar(@result), 0, 'relative path returns empty list');
};

subtest '_parse_remote_dir() - returns empty list for undef without error' => sub {
	my $cfg    = _make_cfg();
	my @result = $cfg->_parse_remote_dir(undef);
	is(scalar(@result), 0, 'undef returns empty list without dying');
};

subtest '_parse_remote_dir() - returns empty list for empty string' => sub {
	my $cfg    = _make_cfg();
	my @result = $cfg->_parse_remote_dir('');
	is(scalar(@result), 0, 'empty string returns empty list');
};

subtest '_parse_remote_dir() - parses /../host/path into (host, path)' => sub {
	my $cfg          = _make_cfg();
	my ($host, $dir) = $cfg->_parse_remote_dir("/../$REMOTE_HOST$REMOTE_DIR");
	is($host, $REMOTE_HOST, 'hostname extracted correctly');
	is($dir,  $REMOTE_DIR,  'directory path extracted correctly');
};

subtest '_parse_remote_dir() - preserves user@host format verbatim' => sub {
	# user@ must be left intact so _is_local_host can strip and compare it
	my $cfg          = _make_cfg();
	my $spec         = "$REMOTE_USER\@$REMOTE_HOST";
	my ($host, $dir) = $cfg->_parse_remote_dir("/../$spec$REMOTE_DIR");
	is($host, $spec,       'user@host preserved verbatim in returned hostname');
	is($dir,  $REMOTE_DIR, 'path still extracted correctly with user@host');
};

subtest '_parse_remote_dir() - defaults path to / when no path component given' => sub {
	my $cfg          = _make_cfg();
	my ($host, $dir) = $cfg->_parse_remote_dir("/../$REMOTE_HOST");
	is($host, $REMOTE_HOST, 'hostname extracted when path omitted');
	is($dir,  '/',          'path defaults to / when omitted');
};

# ===========================================================================
# _is_local_host()
# ===========================================================================
subtest '_is_local_host() - returns 1 for "localhost"' => sub {
	ok(_make_cfg()->_is_local_host('localhost'), '"localhost" is local');
};

subtest '_is_local_host() - loopback name matching is case-insensitive' => sub {
	my $cfg = _make_cfg();
	ok($cfg->_is_local_host('LOCALHOST'),  '"LOCALHOST" is local');
	ok($cfg->_is_local_host('LocalHost'), '"LocalHost" is local');
};

subtest '_is_local_host() - returns 1 for IPv4 loopback address' => sub {
	ok(_make_cfg()->_is_local_host('127.0.0.1'), '"127.0.0.1" is local');
};

subtest '_is_local_host() - returns 1 for IPv6 loopback address' => sub {
	ok(_make_cfg()->_is_local_host('::1'), '"::1" is local');
};

subtest '_is_local_host() - returns 0 for an obviously remote hostname' => sub {
	# Pick a name unlikely to match the FQDN or short name of any real machine
	ok(!_make_cfg()->_is_local_host('definitely-not-local-xyzzy-42.test'),
		'remote hostname returns 0');
};

subtest '_is_local_host() - returns 0 for undef without error' => sub {
	ok(!_make_cfg()->_is_local_host(undef), 'undef returns 0 without dying');
};

subtest '_is_local_host() - returns 0 for empty string' => sub {
	ok(!_make_cfg()->_is_local_host(''), 'empty string returns 0');
};

subtest '_is_local_host() - strips user@ prefix before comparing' => sub {
	my $cfg = _make_cfg();
	ok($cfg->_is_local_host("$REMOTE_USER\@localhost"),
		'user@localhost treated as local after stripping prefix');
	ok($cfg->_is_local_host("$REMOTE_USER\@127.0.0.1"),
		'user@127.0.0.1 treated as local after stripping prefix');
};

subtest '_is_local_host() - matches FQDN and short name from Sys::Hostname' => sub {
	# Mock Sys::Hostname so the test is deterministic on any machine and
	# exercises both the full-FQDN and domain-stripped short-name code paths.
	my $guard = mock_scoped 'Sys::Hostname::hostname' => sub { 'myserver.example.com' };
	my $cfg   = _make_cfg();
	ok($cfg->_is_local_host('myserver.example.com'),     'FQDN matches');
	ok($cfg->_is_local_host('MYSERVER.EXAMPLE.COM'),     'FQDN matches case-insensitively');
	ok($cfg->_is_local_host('myserver'),                 'short hostname matches');
	ok(!$cfg->_is_local_host('otherserver.example.com'), 'different FQDN does not match');
	ok(!$cfg->_is_local_host('myserver.other.com'),      'same short name, different domain rejected');
};

# ===========================================================================
# _slurp_remote()
# ===========================================================================
subtest '_slurp_remote() - returns file content verbatim on success' => sub {
	my $cfg   = _make_cfg();
	my $guard = mock_scoped 'File::Slurp::Remote::read_file' => sub { $YAML_CONTENT };
	is($cfg->_slurp_remote($REMOTE_HOST, "$REMOTE_DIR/base.yaml"),
		$YAML_CONTENT, 'file content returned verbatim');
};

subtest '_slurp_remote() - returns undef and does not propagate exceptions' => sub {
	my $cfg   = _make_cfg();
	my $guard = mock_scoped 'File::Slurp::Remote::read_file' => sub {
		die "Connection refused\n";
	};
	my $result;
	lives_ok { $result = $cfg->_slurp_remote($REMOTE_HOST, "$REMOTE_DIR/base.yaml") }
		'exception from read_file is caught, not re-thrown';
	ok(!defined($result), 'undef returned when read fails');
};

subtest '_slurp_remote() - logs at debug level on failure when a logger is present' => sub {
	my @logged;
	# Must bless the logger so new() does not try to wrap it in Log::Abstraction
	my $logger = bless {}, '_SlurpTestLogger';
	{
		no warnings 'once';
		*_SlurpTestLogger::debug = sub { push @logged, join('', @_[1..$#_]) };
		# Stub other log levels so new() and _load_config() don't croak
		for my $m (qw(trace info warn error)) {
			no strict 'refs';
			*{"_SlurpTestLogger::$m"} = sub {};
		}
	}

	my $cfg   = Config::Abstraction->new(data => \%NESTED_DATA, config_dirs => [], logger => $logger);
	my $guard = mock_scoped 'File::Slurp::Remote::read_file' => sub { die "SSH timeout\n" };
	$cfg->_slurp_remote($REMOTE_HOST, "$REMOTE_DIR/base.yaml");

	ok(scalar(@logged) > 0,     'at least one debug message emitted on failure');
	like($logged[0], qr/Could not read/, 'message describes the failure');
	diag("logged: $logged[0]") if $ENV{TEST_VERBOSE};
};

# ===========================================================================
# _load_remote_dir() - access guard + functional behaviour via TestProxy
# ===========================================================================
subtest '_load_remote_dir() - croaks when called from outside the package hierarchy' => sub {
	my $cfg = _make_cfg();
	eval { $cfg->_load_remote_dir($REMOTE_HOST, $REMOTE_DIR, {}) };
	like($@, qr/Illegal Operation/, 'croaks with expected message for external caller');
};

subtest '_load_remote_dir() - warns and returns cleanly when driver is absent' => sub {
	my $cfg = Config::Abstraction::TestProxy->new(data => \%NESTED_DATA, config_dirs => []);
	# Inject the negative cache entry so _load_driver returns 0 without touching the FS
	$cfg->{failed}{'File::Slurp::Remote'} = 1;

	my %merged;
	my @warnings;
	my $guard = mock_scoped 'Carp::carp' => sub { push @warnings, $_[0] };
	lives_ok { $cfg->test_load_remote_dir($REMOTE_HOST, $REMOTE_DIR, \%merged) }
		'no crash when driver unavailable';
	ok(scalar(@warnings) > 0,   'warning emitted when File::Slurp::Remote is absent');
	is(scalar(keys %merged), 0, 'merged hash unchanged when driver is absent');
};

subtest '_load_remote_dir() - merges YAML data fetched from a remote file' => sub {
	my $cfg = Config::Abstraction::TestProxy->new(data => \%NESTED_DATA, config_dirs => []);
	$cfg->{loaded}{'File::Slurp::Remote'} = 1;	# skip driver require

	my %merged;
	my $guard = mock_scoped 'Config::Abstraction::_slurp_remote' => sub {
		my ($self, $host, $path) = @_;
		return $YAML_CONTENT if $path =~ /base\.yaml$/;
		return undef;	# all other standard files absent on remote
	};

	$cfg->test_load_remote_dir($REMOTE_HOST, $REMOTE_DIR, \%merged);

	is($merged{foo},    'bar', 'string value from remote YAML merged correctly');
	is($merged{baz},    42,    'integer value from remote YAML merged correctly');
	ok(scalar(@{$merged{config_path} // []}) > 0,      'config_path populated');
	like($merged{config_path}[0], qr/\Q$REMOTE_HOST\E/, 'config_path entry names the host');
	diag("config_path: $merged{config_path}[0]") if $ENV{TEST_VERBOSE};
};

subtest '_load_remote_dir() - leaves merged hash untouched when all fetches return undef' => sub {
	my $cfg = Config::Abstraction::TestProxy->new(data => \%NESTED_DATA, config_dirs => []);
	$cfg->{loaded}{'File::Slurp::Remote'} = 1;

	my %merged  = (pre_existing => 'value');
	my $guard   = mock_scoped 'Config::Abstraction::_slurp_remote' => sub { undef };
	$cfg->test_load_remote_dir($REMOTE_HOST, $REMOTE_DIR, \%merged);

	is($merged{pre_existing}, 'value', 'pre-existing key untouched when no files fetched');
	ok(!exists $merged{config_path},   'config_path not added when nothing loaded');
};

subtest '_load_remote_dir() - skips and warns when parsed data is not a hashref' => sub {
	# A YAML list parses fine but is not a valid config root -- must warn and skip
	my $cfg = Config::Abstraction::TestProxy->new(data => \%NESTED_DATA, config_dirs => []);
	$cfg->{loaded}{'File::Slurp::Remote'} = 1;

	my %merged;
	my @warnings;
	my $slurp_guard = mock_scoped 'Config::Abstraction::_slurp_remote' => sub {
		my ($self, $host, $path) = @_;
		return "- item1\n- item2\n" if $path =~ /base\.yaml$/;
		return undef;
	};
	my $carp_guard = mock_scoped 'Carp::carp' => sub { push @warnings, $_[0] };

	lives_ok { $cfg->test_load_remote_dir($REMOTE_HOST, $REMOTE_DIR, \%merged) }
		'non-hash remote result does not crash';
	ok(!exists $merged{foo},      'non-hash result not merged into config');
	ok(scalar(@warnings) > 0,    'warning emitted for non-hash result');
	like($warnings[0], qr/hash/i, 'warning message mentions hash');
};

# ===========================================================================
# _parse_config_string() - access guard + one subtest per supported format
# ===========================================================================
subtest '_parse_config_string() - croaks when called from outside the package hierarchy' => sub {
	my $cfg = _make_cfg();
	eval { $cfg->_parse_config_string($YAML_CONTENT, 'base.yaml', 'test') };
	like($@, qr/Illegal Operation/, 'croaks with expected message for external caller');
};

subtest '_parse_config_string() - parses YAML content correctly' => sub {
	my $cfg    = Config::Abstraction::TestProxy->new(data => \%NESTED_DATA, config_dirs => []);
	my $result = $cfg->test_parse_config_string($YAML_CONTENT, 'base.yaml', 'test');
	ok(defined($result),      'YAML returns defined value');
	is(ref($result), 'HASH',  'YAML returns a hashref');
	is($result->{foo}, 'bar', 'YAML string value correct');
	is($result->{baz}, 42,    'YAML integer value correct');
};

subtest '_parse_config_string() - parses JSON content correctly' => sub {
	my $cfg    = Config::Abstraction::TestProxy->new(data => \%NESTED_DATA, config_dirs => []);
	my $result = $cfg->test_parse_config_string($JSON_CONTENT, 'local.json', 'test');
	ok(defined($result),      'JSON returns defined value');
	is(ref($result), 'HASH',  'JSON returns a hashref');
	is($result->{foo}, 'bar', 'JSON string value correct');
	is($result->{baz}, 42,    'JSON integer value correct');
};

subtest '_parse_config_string() - parses INI content via a temp file' => sub {
	# Config::IniFiles requires a real path; the implementation writes to
	# File::Temp and removes it immediately after parsing
	my $cfg    = Config::Abstraction::TestProxy->new(data => \%NESTED_DATA, config_dirs => []);
	my $result = $cfg->test_parse_config_string($INI_CONTENT, 'base.ini', 'test');
	ok(defined($result),                  'INI returns defined value');
	is(ref($result), 'HASH',              'INI returns a hashref');
	is($result->{section}{key},   'value', 'INI key correct');
	is($result->{section}{other}, '123',   'INI second key correct');
};

subtest '_parse_config_string() - catches parser exceptions and returns undef' => sub {
	my $cfg = Config::Abstraction::TestProxy->new(data => \%NESTED_DATA, config_dirs => []);
	# Pre-populate cache so _load_driver short-circuits; then the mock on
	# YAML::XS::Load takes clean effect without an import side-effect.
	$cfg->{loaded}{'YAML::XS'} = 1;
	my $guard = mock_scoped 'YAML::XS::Load' => sub { die "synthetic parse failure\n" };

	my $result;
	lives_ok { $result = $cfg->test_parse_config_string('bad', 'base.yaml', 'test-label') }
		'parser exception caught, not re-thrown';
	ok(!defined($result), 'returns undef when parser dies');
};

subtest '_parse_config_string() - returns undef for an unrecognised file extension' => sub {
	# No format handler is registered for .toml; the inner eval exits without
	# setting $data and the method returns undef without logging anything
	my $cfg    = Config::Abstraction::TestProxy->new(data => \%NESTED_DATA, config_dirs => []);
	my $result = $cfg->test_parse_config_string('key = value', 'config.toml', 'test');
	ok(!defined($result), 'unrecognised extension returns undef');
};

subtest '_parse_config_string() - parses XML content via XML::Simple or XML::PP' => sub {
	# This exercises the elsif($filename =~ /\.xml$/i) branch which had 0 coverage hits
	my $cfg = Config::Abstraction::TestProxy->new(data => \%NESTED_DATA, config_dirs => []);
	my $xml = "<?xml version=\"1.0\" encoding=\"UTF-8\"?><config><key>xmlval</key><count>7</count></config>";
	my $result = $cfg->test_parse_config_string($xml, 'base.xml', 'test-xml-label');
	ok(defined($result),        'XML content returns defined value');
	is(ref($result), 'HASH',    'XML content returns a hashref');
	is($result->{key}, 'xmlval', 'XML string value parsed correctly');
	diag('XML result: ' . join(', ', map { "$_=$result->{$_}" } sort keys %{$result})) if $ENV{TEST_VERBOSE};
};

subtest '_parse_config_string() - returns undef for malformed INI (no valid sections)' => sub {
	# Config::IniFiles->new returns undef for content it cannot parse; the
	# method must return undef without crashing when the INI temp-file parse fails
	my $cfg = Config::Abstraction::TestProxy->new(data => \%NESTED_DATA, config_dirs => []);
	# An INI-extension file whose content has broken section syntax
	my $bad_ini = "[broken section\nkey=val\n";
	my $result;
	lives_ok { $result = $cfg->test_parse_config_string($bad_ini, 'config.ini', 'bad-ini') }
		'malformed INI does not crash _parse_config_string';
	ok(!defined($result), 'malformed INI returns undef');
};

# ===========================================================================
# _load_data_reuse() - caching layer around the optional Data::Reuse module
# ===========================================================================
subtest '_load_data_reuse() - returns 0 immediately when no_fixate is set' => sub {
	# no_fixate lets callers opt out of Data::Reuse entirely; the early
	# return must fire before any require is attempted
	my $cfg = _make_cfg(no_fixate => 1);
	is($cfg->_load_data_reuse(), 0, 'returns 0 when no_fixate flag is set');
};

subtest '_load_data_reuse() - returns 1 from positive cache without re-loading' => sub {
	my $cfg = _make_cfg();
	$cfg->{reuse_loaded} = 1;
	is($cfg->_load_data_reuse(), 1, 'returns 1 from reuse_loaded cache immediately');
};

subtest '_load_data_reuse() - returns 0 from negative cache without re-attempting' => sub {
	my $cfg = _make_cfg();
	$cfg->{reuse_failed} = 1;
	is($cfg->_load_data_reuse(), 0, 'returns 0 from reuse_failed cache immediately');
};

done_testing();
