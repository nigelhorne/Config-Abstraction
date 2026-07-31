#!/usr/bin/env perl
# Auto-generated mutant test stubs
# Generated: 2026-07-31 14:05:56
# Generator: scripts/test-generator-index
#
# DO NOT COMMIT without completing the TODO sections.
#
# HIGH/MEDIUM difficulty survivors have TODO stubs — these need real tests.
# LOW difficulty survivors appear as comment hints — worth improving.
#
# Stubs call new() for modules with a constructor, or show a class method
# placeholder for modules without one. Add arguments as needed.

use strict;
use warnings;
use Test::More;

use_ok('Config::Abstraction');

################################################################
# FILE: lib/Config/Abstraction.pm
################################################################
# --- SURVIVORS (TODO stubs) ---

# --- SURVIVOR: COND_INV_366_4 (MEDIUM) line 366 in new() ---
# Source:  if($^O ne 'MSWin32') {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_366_4 line 366 in new()';
    # NOTE: new is a class method — call directly.
    my $result = Config::Abstraction->new(...);
    # ok($result, 'COND_INV_366_4: add assertion here');
    # TODO: exercise line 366 in new() to detect the mutant
    fail('COND_INV_366_4: replace with real assertion');
}

# --- SURVIVOR: COND_INV_410_5 (MEDIUM) line 410 in new() ---
# Source:  if($params->{'level'} && $self->{'logger'}->can('level')) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_410_5 line 410 in new()';
    # NOTE: new is a class method — call directly.
    my $result = Config::Abstraction->new(...);
    # ok($result, 'COND_INV_410_5: add assertion here');
    # TODO: exercise line 410 in new() to detect the mutant
    fail('COND_INV_410_5: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_452_2 (MEDIUM) line 452 in _flatten_keys() ---
# Source:  return %flat unless ref($hash) eq 'HASH';
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_452_2 line 452 in _flatten_keys()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 452 in _flatten_keys() to detect the mutant
    fail('BOOL_NEGATE_452_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_454_2 (MEDIUM) line 454 in _flatten_keys() ---
# Source:  return %flat if $seen->{$addr}++;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_454_2 line 454 in _flatten_keys()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 454 in _flatten_keys() to detect the mutant
    fail('BOOL_NEGATE_454_2: replace with real assertion');
}

# --- SURVIVOR: COND_INV_458_3 (MEDIUM) line 458 in _flatten_keys() ---
# Source:  if(ref($hash->{$k}) eq 'HASH') {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_458_3 line 458 in _flatten_keys()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 458 in _flatten_keys() to detect the mutant
    fail('COND_INV_458_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_464_2 (MEDIUM) line 464 in _flatten_keys() ---
# Source:  return %flat;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_464_2 line 464 in _flatten_keys()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 464 in _flatten_keys() to detect the mutant
    fail('BOOL_NEGATE_464_2: replace with real assertion');
}

# --- SURVIVOR: COND_INV_572_5 (MEDIUM) line 572 in _load_config() ---
# Source:  if($self->_load_driver('XML::Simple', ['XMLin'])) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_572_5 line 572 in _load_config()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 572 in _load_config() to detect the mutant
    fail('COND_INV_572_5: replace with real assertion');
}

# --- SURVIVOR: COND_INV_574_6 (MEDIUM) line 574 in _load_config() ---
# Source:  if($@) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_574_6 line 574 in _load_config()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 574 in _load_config() to detect the mutant
    fail('COND_INV_574_6: replace with real assertion');
}

# --- SURVIVOR: COND_INV_575_7 (MEDIUM) line 575 in _load_config() ---
# Source:  if($logger) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_575_7 line 575 in _load_config()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 575 in _load_config() to detect the mutant
    fail('COND_INV_575_7: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_651_71_!= (HIGH) line 651 in _load_config() ---
# Source:  next if(($config_file eq $script_name) && ((length($effective_dir) == 0) || ($effective_dir eq File::Spec->curdir())));
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (1 variant):
#   Numeric boundary flip == to !=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_651_71_!= line 651 in _load_config()';
    # Suggested boundary values to test: 0, 1
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 651 in _load_config() to detect the mutant
    fail('NUM_BOUNDARY_651_71_!=: replace with real assertion');
}

# --- SURVIVOR: COND_INV_664_8 (MEDIUM) line 664 in _load_config() ---
# Source:  if($data = XMLin($path, ForceArray => 0, KeyAttr => [])) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_664_8 line 664 in _load_config()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 664 in _load_config() to detect the mutant
    fail('COND_INV_664_8: replace with real assertion');
}

# --- SURVIVOR: COND_INV_683_7 (MEDIUM) line 683 in _load_config() ---
# Source:  if($is_json) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_683_7 line 683 in _load_config()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 683 in _load_config() to detect the mutant
    fail('COND_INV_683_7: replace with real assertion');
}

# --- SURVIVOR: COND_INV_691_7 (MEDIUM) line 691 in _load_config() ---
# Source:  if($data) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_691_7 line 691 in _load_config()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 691 in _load_config() to detect the mutant
    fail('COND_INV_691_7: replace with real assertion');
}

# --- SURVIVOR: COND_INV_727_8 (MEDIUM) line 727 in _load_config() ---
# Source:  if($data) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_727_8 line 727 in _load_config()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 727 in _load_config() to detect the mutant
    fail('COND_INV_727_8: replace with real assertion');
}

# --- SURVIVOR: COND_INV_738_9 (MEDIUM) line 738 in _load_config() ---
# Source:  if($data) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_738_9 line 738 in _load_config()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 738 in _load_config() to detect the mutant
    fail('COND_INV_738_9: replace with real assertion');
}

# --- SURVIVOR: COND_INV_744_9 (MEDIUM) line 744 in _load_config() ---
# Source:  if($self->_load_driver('XML::Simple', ['XMLin'])) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_744_9 line 744 in _load_config()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 744 in _load_config() to detect the mutant
    fail('COND_INV_744_9: replace with real assertion');
}

# --- SURVIVOR: COND_INV_747_9 (MEDIUM) line 747 in _load_config() ---
# Source:  if((!$data) || (ref($data) ne 'HASH')) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_747_9 line 747 in _load_config()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 747 in _load_config() to detect the mutant
    fail('COND_INV_747_9: replace with real assertion');
}

# --- SURVIVOR: COND_INV_748_10 (MEDIUM) line 748 in _load_config() ---
# Source:  if($self->_load_driver('Config::Abstract')) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_748_10 line 748 in _load_config()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 748 in _load_config() to detect the mutant
    fail('COND_INV_748_10: replace with real assertion');
}

# --- SURVIVOR: COND_INV_755_11 (MEDIUM) line 755 in _load_config() ---
# Source:  if($err) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_755_11 line 755 in _load_config()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 755 in _load_config() to detect the mutant
    fail('COND_INV_755_11: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_759_37_!= (HIGH) line 759 in _load_config() ---
# Source:  if(scalar(keys %{$data}) == 0) {
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (2 variants — one test should kill all):
#   Numeric boundary flip == to !=
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_759_37_!= line 759 in _load_config()';
    # Suggested boundary values to test: 0, 1
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 759 in _load_config() to detect the mutant
    fail('NUM_BOUNDARY_759_37_!=: replace with real assertion');
}

# --- SURVIVOR: COND_INV_769_10 (MEDIUM) line 769 in _load_config() ---
# Source:  if($data = $ca->parse()) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_769_10 line 769 in _load_config()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 769 in _load_config() to detect the mutant
    fail('COND_INV_769_10: replace with real assertion');
}

# --- SURVIVOR: COND_INV_778_6 (MEDIUM) line 778 in _load_config() ---
# Source:  if($@) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_778_6 line 778 in _load_config()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 778 in _load_config() to detect the mutant
    fail('COND_INV_778_6: replace with real assertion');
}

# --- SURVIVOR: COND_INV_785_5 (MEDIUM) line 785 in _load_config() ---
# Source:  if($data && ref($data) eq 'HASH') {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_785_5 line 785 in _load_config()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 785 in _load_config() to detect the mutant
    fail('COND_INV_785_5: replace with real assertion');
}

# --- SURVIVOR: COND_INV_857_2 (MEDIUM) line 857 in _load_config() ---
# Source:  if($self->{'flatten'}) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_857_2 line 857 in _load_config()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 857 in _load_config() to detect the mutant
    fail('COND_INV_857_2: replace with real assertion');
}

# --- SURVIVOR: COND_INV_890_3 (MEDIUM) line 890 in get() ---
# Source:  if($self->_load_data_reuse()) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_890_3 line 890 in get()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 890 in get() to detect the mutant
    fail('COND_INV_890_3: replace with real assertion');
}

# --- SURVIVOR: COND_INV_891_4 (MEDIUM) line 891 in get() ---
# Source:  if(ref($ref) eq 'HASH') {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_891_4 line 891 in get()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 891 in get() to detect the mutant
    fail('COND_INV_891_4: replace with real assertion');
}

# --- SURVIVOR: COND_INV_892_5 (MEDIUM) line 892 in get() ---
# Source:  if(!tied %$ref) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_892_5 line 892 in get()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 892 in get() to detect the mutant
    fail('COND_INV_892_5: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_932_2 (MEDIUM) line 932 in _load_data_reuse() ---
# Source:  return 1;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_932_2 line 932 in _load_data_reuse()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 932 in _load_data_reuse() to detect the mutant
    fail('BOOL_NEGATE_932_2: replace with real assertion');
}

# --- SURVIVOR: COND_INV_1082_4 (MEDIUM) line 1082 in explain_sources() ---
# Source:  if(exists $layer->{'flat_data'}{$key}) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_1082_4 line 1082 in explain_sources()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 1082 in explain_sources() to detect the mutant
    fail('COND_INV_1082_4: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1095_2 (MEDIUM) line 1095 in explain_sources() ---
# Source:  return \%result;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1095_2 line 1095 in explain_sources()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 1095 in explain_sources() to detect the mutant
    fail('BOOL_NEGATE_1095_2: replace with real assertion');
}

# --- SURVIVOR: COND_INV_1117_3 (MEDIUM) line 1117 in _value_from_type() ---
# Source:  if(exists $layer->{'flat_data'}{$flat_key}) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_1117_3 line 1117 in _value_from_type()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 1117 in _value_from_type() to detect the mutant
    fail('COND_INV_1117_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1142_2 (MEDIUM) line 1142 in prefer_env() ---
# Source:  return $found ? $val : $self->get($key);
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1142_2 line 1142 in prefer_env()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 1142 in prefer_env() to detect the mutant
    fail('BOOL_NEGATE_1142_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1161_2 (MEDIUM) line 1161 in prefer_file() ---
# Source:  return $found ? $val : $self->get($key);
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1161_2 line 1161 in prefer_file()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 1161 in prefer_file() to detect the mutant
    fail('BOOL_NEGATE_1161_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1184_2 (MEDIUM) line 1184 in prefer_data() ---
# Source:  return $found ? $val : $self->get($key);
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1184_2 line 1184 in prefer_data()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 1184 in prefer_data() to detect the mutant
    fail('BOOL_NEGATE_1184_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1207_2 (MEDIUM) line 1207 in prefer_argv() ---
# Source:  return $found ? $val : $self->get($key);
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1207_2 line 1207 in prefer_argv()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 1207 in prefer_argv() to detect the mutant
    fail('BOOL_NEGATE_1207_2: replace with real assertion');
}

# --- SURVIVOR: COND_INV_1661_2 (MEDIUM) line 1661 in AUTOLOAD() ---
# Source:  if ($self->{flatten}) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_1661_2 line 1661 in AUTOLOAD()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 1661 in AUTOLOAD() to detect the mutant
    fail('COND_INV_1661_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1662_3 (MEDIUM) line 1662 in AUTOLOAD() ---
# Source:  return $data->{$key} if(exists $data->{$key});
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1662_3 line 1662 in AUTOLOAD()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 1662 in AUTOLOAD() to detect the mutant
    fail('BOOL_NEGATE_1662_3: replace with real assertion');
}

# --- LOW DIFFICULTY HINTS (comment stubs) ---

# --- LOW HINT: RETURN_UNDEF_452_2 line 452 in _flatten_keys() ---
# Source:  return %flat unless ref($hash) eq 'HASH';
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Config::Abstraction requires constructor arguments, add them here.
# my $obj = new_ok('Config::Abstraction');
# ok($obj->..., 'RETURN_UNDEF_452_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_454_2 line 454 in _flatten_keys() ---
# Source:  return %flat if $seen->{$addr}++;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Config::Abstraction requires constructor arguments, add them here.
# my $obj = new_ok('Config::Abstraction');
# ok($obj->..., 'RETURN_UNDEF_454_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_464_2 line 464 in _flatten_keys() ---
# Source:  return %flat;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Config::Abstraction requires constructor arguments, add them here.
# my $obj = new_ok('Config::Abstraction');
# ok($obj->..., 'RETURN_UNDEF_464_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_932_2 line 932 in _load_data_reuse() ---
# Source:  return 1;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Config::Abstraction requires constructor arguments, add them here.
# my $obj = new_ok('Config::Abstraction');
# ok($obj->..., 'RETURN_UNDEF_932_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1095_2 line 1095 in explain_sources() ---
# Source:  return \%result;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Config::Abstraction requires constructor arguments, add them here.
# my $obj = new_ok('Config::Abstraction');
# ok($obj->..., 'RETURN_UNDEF_1095_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1142_2 line 1142 in prefer_env() ---
# Source:  return $found ? $val : $self->get($key);
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Config::Abstraction requires constructor arguments, add them here.
# my $obj = new_ok('Config::Abstraction');
# ok($obj->..., 'RETURN_UNDEF_1142_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1161_2 line 1161 in prefer_file() ---
# Source:  return $found ? $val : $self->get($key);
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Config::Abstraction requires constructor arguments, add them here.
# my $obj = new_ok('Config::Abstraction');
# ok($obj->..., 'RETURN_UNDEF_1161_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1184_2 line 1184 in prefer_data() ---
# Source:  return $found ? $val : $self->get($key);
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Config::Abstraction requires constructor arguments, add them here.
# my $obj = new_ok('Config::Abstraction');
# ok($obj->..., 'RETURN_UNDEF_1184_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1207_2 line 1207 in prefer_argv() ---
# Source:  return $found ? $val : $self->get($key);
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Config::Abstraction requires constructor arguments, add them here.
# my $obj = new_ok('Config::Abstraction');
# ok($obj->..., 'RETURN_UNDEF_1207_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1662_3 line 1662 in AUTOLOAD() ---
# Source:  return $data->{$key} if(exists $data->{$key});
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Config::Abstraction requires constructor arguments, add them here.
# my $obj = new_ok('Config::Abstraction');
# ok($obj->..., 'RETURN_UNDEF_1662_3: add assertion here');

done_testing();
