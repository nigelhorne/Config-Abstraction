#!/usr/bin/env perl
# Auto-generated mutant test stubs
# Generated: 2026-07-29 01:28:03
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

# --- SURVIVOR: COND_INV_355_4 (MEDIUM) line 355 in new() ---
# Source:  if($^O ne 'MSWin32') {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_355_4 line 355 in new()';
    # NOTE: new is a class method — call directly.
    my $result = Config::Abstraction->new(...);
    # ok($result, 'COND_INV_355_4: add assertion here');
    # TODO: exercise line 355 in new() to detect the mutant
    fail('COND_INV_355_4: replace with real assertion');
}

# --- SURVIVOR: COND_INV_386_2 (MEDIUM) line 386 in new() ---
# Source:  if(my $logger = $self->{'logger'}) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_386_2 line 386 in new()';
    # NOTE: new is a class method — call directly.
    my $result = Config::Abstraction->new(...);
    # ok($result, 'COND_INV_386_2: add assertion here');
    # TODO: exercise line 386 in new() to detect the mutant
    fail('COND_INV_386_2: replace with real assertion');
}

# --- SURVIVOR: COND_INV_387_3 (MEDIUM) line 387 in new() ---
# Source:  if(!Scalar::Util::blessed($logger)) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_387_3 line 387 in new()';
    # NOTE: new is a class method — call directly.
    my $result = Config::Abstraction->new(...);
    # ok($result, 'COND_INV_387_3: add assertion here');
    # TODO: exercise line 387 in new() to detect the mutant
    fail('COND_INV_387_3: replace with real assertion');
}

# --- SURVIVOR: COND_INV_390_4 (MEDIUM) line 390 in new() ---
# Source:  if($@) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_390_4 line 390 in new()';
    # NOTE: new is a class method — call directly.
    my $result = Config::Abstraction->new(...);
    # ok($result, 'COND_INV_390_4: add assertion here');
    # TODO: exercise line 390 in new() to detect the mutant
    fail('COND_INV_390_4: replace with real assertion');
}

# --- SURVIVOR: COND_INV_395_5 (MEDIUM) line 395 in new() ---
# Source:  if($params->{'level'} && $self->{'logger'}->can('level')) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_395_5 line 395 in new()';
    # NOTE: new is a class method — call directly.
    my $result = Config::Abstraction->new(...);
    # ok($result, 'COND_INV_395_5: add assertion here');
    # TODO: exercise line 395 in new() to detect the mutant
    fail('COND_INV_395_5: replace with real assertion');
}

# --- SURVIVOR: COND_INV_466_4 (MEDIUM) line 466 in _load_config() ---
# Source:  if($self->_is_local_host($host)) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_466_4 line 466 in _load_config()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 466 in _load_config() to detect the mutant
    fail('COND_INV_466_4: replace with real assertion');
}

# --- SURVIVOR: COND_INV_515_5 (MEDIUM) line 515 in _load_config() ---
# Source:  if($self->_load_driver('XML::Simple', ['XMLin'])) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_515_5 line 515 in _load_config()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 515 in _load_config() to detect the mutant
    fail('COND_INV_515_5: replace with real assertion');
}

# --- SURVIVOR: COND_INV_517_6 (MEDIUM) line 517 in _load_config() ---
# Source:  if($@) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_517_6 line 517 in _load_config()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 517 in _load_config() to detect the mutant
    fail('COND_INV_517_6: replace with real assertion');
}

# --- SURVIVOR: COND_INV_518_7 (MEDIUM) line 518 in _load_config() ---
# Source:  if($logger) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_518_7 line 518 in _load_config()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 518 in _load_config() to detect the mutant
    fail('COND_INV_518_7: replace with real assertion');
}

# --- SURVIVOR: COND_INV_548_6 (MEDIUM) line 548 in _load_config() ---
# Source:  if($logger) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_548_6 line 548 in _load_config()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 548 in _load_config() to detect the mutant
    fail('COND_INV_548_6: replace with real assertion');
}

# --- SURVIVOR: COND_INV_557_6 (MEDIUM) line 557 in _load_config() ---
# Source:  if($logger) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_557_6 line 557 in _load_config()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 557 in _load_config() to detect the mutant
    fail('COND_INV_557_6: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_589_71_!= (HIGH) line 589 in _load_config() ---
# Source:  next if(($config_file eq $script_name) && ((length($effective_dir) == 0) || ($effective_dir eq File::Spec->curdir())));
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (1 variant):
#   Numeric boundary flip == to !=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_589_71_!= line 589 in _load_config()';
    # Suggested boundary values to test: 0, 1
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 589 in _load_config() to detect the mutant
    fail('NUM_BOUNDARY_589_71_!=: replace with real assertion');
}

# --- SURVIVOR: COND_INV_602_8 (MEDIUM) line 602 in _load_config() ---
# Source:  if($data = XMLin($path, ForceArray => 0, KeyAttr => [])) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_602_8 line 602 in _load_config()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 602 in _load_config() to detect the mutant
    fail('COND_INV_602_8: replace with real assertion');
}

# --- SURVIVOR: COND_INV_621_7 (MEDIUM) line 621 in _load_config() ---
# Source:  if($is_json) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_621_7 line 621 in _load_config()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 621 in _load_config() to detect the mutant
    fail('COND_INV_621_7: replace with real assertion');
}

# --- SURVIVOR: COND_INV_623_8 (MEDIUM) line 623 in _load_config() ---
# Source:  if($@) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_623_8 line 623 in _load_config()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 623 in _load_config() to detect the mutant
    fail('COND_INV_623_8: replace with real assertion');
}

# --- SURVIVOR: COND_INV_629_7 (MEDIUM) line 629 in _load_config() ---
# Source:  if($data) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_629_7 line 629 in _load_config()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 629 in _load_config() to detect the mutant
    fail('COND_INV_629_7: replace with real assertion');
}

# --- SURVIVOR: COND_INV_665_8 (MEDIUM) line 665 in _load_config() ---
# Source:  if($data) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_665_8 line 665 in _load_config()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 665 in _load_config() to detect the mutant
    fail('COND_INV_665_8: replace with real assertion');
}

# --- SURVIVOR: COND_INV_676_9 (MEDIUM) line 676 in _load_config() ---
# Source:  if($data) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_676_9 line 676 in _load_config()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 676 in _load_config() to detect the mutant
    fail('COND_INV_676_9: replace with real assertion');
}

# --- SURVIVOR: COND_INV_682_9 (MEDIUM) line 682 in _load_config() ---
# Source:  if($self->_load_driver('XML::Simple', ['XMLin'])) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_682_9 line 682 in _load_config()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 682 in _load_config() to detect the mutant
    fail('COND_INV_682_9: replace with real assertion');
}

# --- SURVIVOR: COND_INV_685_9 (MEDIUM) line 685 in _load_config() ---
# Source:  if((!$data) || (ref($data) ne 'HASH')) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_685_9 line 685 in _load_config()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 685 in _load_config() to detect the mutant
    fail('COND_INV_685_9: replace with real assertion');
}

# --- SURVIVOR: COND_INV_686_10 (MEDIUM) line 686 in _load_config() ---
# Source:  if($self->_load_driver('Config::Abstract')) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_686_10 line 686 in _load_config()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 686 in _load_config() to detect the mutant
    fail('COND_INV_686_10: replace with real assertion');
}

# --- SURVIVOR: COND_INV_693_11 (MEDIUM) line 693 in _load_config() ---
# Source:  if($err) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_693_11 line 693 in _load_config()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 693 in _load_config() to detect the mutant
    fail('COND_INV_693_11: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_697_37_!= (HIGH) line 697 in _load_config() ---
# Source:  if(scalar(keys %{$data}) == 0) {
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (2 variants — one test should kill all):
#   Numeric boundary flip == to !=
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_697_37_!= line 697 in _load_config()';
    # Suggested boundary values to test: 0, 1
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 697 in _load_config() to detect the mutant
    fail('NUM_BOUNDARY_697_37_!=: replace with real assertion');
}

# --- SURVIVOR: COND_INV_707_10 (MEDIUM) line 707 in _load_config() ---
# Source:  if($data = $ca->parse()) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_707_10 line 707 in _load_config()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 707 in _load_config() to detect the mutant
    fail('COND_INV_707_10: replace with real assertion');
}

# --- SURVIVOR: COND_INV_716_6 (MEDIUM) line 716 in _load_config() ---
# Source:  if($@) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_716_6 line 716 in _load_config()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 716 in _load_config() to detect the mutant
    fail('COND_INV_716_6: replace with real assertion');
}

# --- SURVIVOR: COND_INV_773_2 (MEDIUM) line 773 in _load_config() ---
# Source:  if($self->{'flatten'}) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_773_2 line 773 in _load_config()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 773 in _load_config() to detect the mutant
    fail('COND_INV_773_2: replace with real assertion');
}

# --- SURVIVOR: COND_INV_803_2 (MEDIUM) line 803 in get() ---
# Source:  if((defined($ref) && (ref($ref) eq 'HASH') && !$self->{'no_fixate'})) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_803_2 line 803 in get()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 803 in get() to detect the mutant
    fail('COND_INV_803_2: replace with real assertion');
}

# --- SURVIVOR: COND_INV_804_3 (MEDIUM) line 804 in get() ---
# Source:  if($self->_load_data_reuse()) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_804_3 line 804 in get()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 804 in get() to detect the mutant
    fail('COND_INV_804_3: replace with real assertion');
}

# --- SURVIVOR: COND_INV_805_4 (MEDIUM) line 805 in get() ---
# Source:  if(ref($ref) eq 'HASH') {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_805_4 line 805 in get()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 805 in get() to detect the mutant
    fail('COND_INV_805_4: replace with real assertion');
}

# --- SURVIVOR: COND_INV_806_5 (MEDIUM) line 806 in get() ---
# Source:  if(!tied %$ref) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_806_5 line 806 in get()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 806 in get() to detect the mutant
    fail('COND_INV_806_5: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_833_2 (MEDIUM) line 833 in _load_data_reuse() ---
# Source:  return 1 if($self->{reuse_loaded});
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_833_2 line 833 in _load_data_reuse()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 833 in _load_data_reuse() to detect the mutant
    fail('BOOL_NEGATE_833_2: replace with real assertion');
}

# --- SURVIVOR: COND_INV_840_2 (MEDIUM) line 840 in _load_data_reuse() ---
# Source:  if($@) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_840_2 line 840 in _load_data_reuse()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 840 in _load_data_reuse() to detect the mutant
    fail('COND_INV_840_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_846_2 (MEDIUM) line 846 in _load_data_reuse() ---
# Source:  return 1;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_846_2 line 846 in _load_data_reuse()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 846 in _load_data_reuse() to detect the mutant
    fail('BOOL_NEGATE_846_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1154_2 (MEDIUM) line 1154 in _is_local_host() ---
# Source:  return 0 unless defined($host) && length($host);
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1154_2 line 1154 in _is_local_host()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 1154 in _is_local_host() to detect the mutant
    fail('BOOL_NEGATE_1154_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1158_2 (MEDIUM) line 1158 in _is_local_host() ---
# Source:  return 1 if lc($bare) eq 'localhost';
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1158_2 line 1158 in _is_local_host()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 1158 in _is_local_host() to detect the mutant
    fail('BOOL_NEGATE_1158_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1159_2 (MEDIUM) line 1159 in _is_local_host() ---
# Source:  return 1 if $bare eq '127.0.0.1';
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1159_2 line 1159 in _is_local_host()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 1159 in _is_local_host() to detect the mutant
    fail('BOOL_NEGATE_1159_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1160_2 (MEDIUM) line 1160 in _is_local_host() ---
# Source:  return 1 if $bare eq '::1';
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1160_2 line 1160 in _is_local_host()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 1160 in _is_local_host() to detect the mutant
    fail('BOOL_NEGATE_1160_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1164_2 (MEDIUM) line 1164 in _is_local_host() ---
# Source:  return 1 if lc($bare) eq $fqdn;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1164_2 line 1164 in _is_local_host()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 1164 in _is_local_host() to detect the mutant
    fail('BOOL_NEGATE_1164_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1167_2 (MEDIUM) line 1167 in _is_local_host() ---
# Source:  return 1 if lc($bare) eq $short;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1167_2 line 1167 in _is_local_host()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 1167 in _is_local_host() to detect the mutant
    fail('BOOL_NEGATE_1167_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1169_2 (MEDIUM) line 1169 in _is_local_host() ---
# Source:  return 0;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1169_2 line 1169 in _is_local_host()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 1169 in _is_local_host() to detect the mutant
    fail('BOOL_NEGATE_1169_2: replace with real assertion');
}

# --- SURVIVOR: COND_INV_1182_2 (MEDIUM) line 1182 in _load_remote_dir() ---
# Source:  if(!UNIVERSAL::isa((caller)[0], __PACKAGE__)) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_1182_2 line 1182 in _load_remote_dir()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 1182 in _load_remote_dir() to detect the mutant
    fail('COND_INV_1182_2: replace with real assertion');
}

# --- SURVIVOR: COND_INV_1189_2 (MEDIUM) line 1189 in _load_remote_dir() ---
# Source:  unless($self->_load_driver('File::Slurp::Remote')) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition unless to if
TODO: {
    local $TODO = 'Complete: COND_INV_1189_2 line 1189 in _load_remote_dir()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 1189 in _load_remote_dir() to detect the mutant
    fail('COND_INV_1189_2: replace with real assertion');
}

# --- SURVIVOR: COND_INV_1198_3 (MEDIUM) line 1198 in _load_remote_dir() ---
# Source:  if($logger) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_1198_3 line 1198 in _load_remote_dir()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 1198 in _load_remote_dir() to detect the mutant
    fail('COND_INV_1198_3: replace with real assertion');
}

# --- SURVIVOR: COND_INV_1205_3 (MEDIUM) line 1205 in _load_remote_dir() ---
# Source:  if($logger) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_1205_3 line 1205 in _load_remote_dir()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 1205 in _load_remote_dir() to detect the mutant
    fail('COND_INV_1205_3: replace with real assertion');
}

# --- SURVIVOR: COND_INV_1212_3 (MEDIUM) line 1212 in _load_remote_dir() ---
# Source:  if(ref($data) ne 'HASH') {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_1212_3 line 1212 in _load_remote_dir()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 1212 in _load_remote_dir() to detect the mutant
    fail('COND_INV_1212_3: replace with real assertion');
}

# --- SURVIVOR: COND_INV_1239_2 (MEDIUM) line 1239 in _slurp_remote() ---
# Source:  if($@) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_1239_2 line 1239 in _slurp_remote()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 1239 in _slurp_remote() to detect the mutant
    fail('COND_INV_1239_2: replace with real assertion');
}

# --- SURVIVOR: COND_INV_1240_3 (MEDIUM) line 1240 in _slurp_remote() ---
# Source:  if($logger) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_1240_3 line 1240 in _slurp_remote()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 1240 in _slurp_remote() to detect the mutant
    fail('COND_INV_1240_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1243_3 (MEDIUM) line 1243 in _slurp_remote() ---
# Source:  return undef;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1243_3 line 1243 in _slurp_remote()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 1243 in _slurp_remote() to detect the mutant
    fail('BOOL_NEGATE_1243_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1245_2 (MEDIUM) line 1245 in _slurp_remote() ---
# Source:  return $content;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1245_2 line 1245 in _slurp_remote()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 1245 in _slurp_remote() to detect the mutant
    fail('BOOL_NEGATE_1245_2: replace with real assertion');
}

# --- SURVIVOR: COND_INV_1259_2 (MEDIUM) line 1259 in _parse_config_string() ---
# Source:  if(!UNIVERSAL::isa((caller)[0], __PACKAGE__)) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_1259_2 line 1259 in _parse_config_string()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 1259 in _parse_config_string() to detect the mutant
    fail('COND_INV_1259_2: replace with real assertion');
}

# --- SURVIVOR: COND_INV_1268_3 (MEDIUM) line 1268 in _parse_config_string() ---
# Source:  if($filename =~ /\.ya?ml$/i) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_1268_3 line 1268 in _parse_config_string()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 1268 in _parse_config_string() to detect the mutant
    fail('COND_INV_1268_3: replace with real assertion');
}

# --- SURVIVOR: COND_INV_1276_4 (MEDIUM) line 1276 in _parse_config_string() ---
# Source:  if($self->_load_driver('XML::Simple', ['XMLin'])) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_1276_4 line 1276 in _parse_config_string()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 1276 in _parse_config_string() to detect the mutant
    fail('COND_INV_1276_4: replace with real assertion');
}

# --- SURVIVOR: COND_INV_1280_5 (MEDIUM) line 1280 in _parse_config_string() ---
# Source:  if(my $tree = $pp->parse(\$raw)) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_1280_5 line 1280 in _parse_config_string()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 1280 in _parse_config_string() to detect the mutant
    fail('COND_INV_1280_5: replace with real assertion');
}

# --- SURVIVOR: COND_INV_1292_4 (MEDIUM) line 1292 in _parse_config_string() ---
# Source:  if(my $ini = Config::IniFiles->new(-file => $tmp->filename())) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_1292_4 line 1292 in _parse_config_string()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 1292 in _parse_config_string() to detect the mutant
    fail('COND_INV_1292_4: replace with real assertion');
}

# --- SURVIVOR: COND_INV_1301_2 (MEDIUM) line 1301 in _parse_config_string() ---
# Source:  if($@) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_1301_2 line 1301 in _parse_config_string()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 1301 in _parse_config_string() to detect the mutant
    fail('COND_INV_1301_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1305_3 (MEDIUM) line 1305 in _parse_config_string() ---
# Source:  return undef;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1305_3 line 1305 in _parse_config_string()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 1305 in _parse_config_string() to detect the mutant
    fail('BOOL_NEGATE_1305_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1308_2 (MEDIUM) line 1308 in _parse_config_string() ---
# Source:  return $data;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1308_2 line 1308 in _parse_config_string()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 1308 in _parse_config_string() to detect the mutant
    fail('BOOL_NEGATE_1308_2: replace with real assertion');
}

# --- SURVIVOR: COND_INV_1327_2 (MEDIUM) line 1327 in AUTOLOAD() ---
# Source:  if ($self->{flatten}) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_1327_2 line 1327 in AUTOLOAD()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 1327 in AUTOLOAD() to detect the mutant
    fail('COND_INV_1327_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1328_3 (MEDIUM) line 1328 in AUTOLOAD() ---
# Source:  return $data->{$key} if(exists $data->{$key});
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1328_3 line 1328 in AUTOLOAD()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 1328 in AUTOLOAD() to detect the mutant
    fail('BOOL_NEGATE_1328_3: replace with real assertion');
}

# --- LOW DIFFICULTY HINTS (comment stubs) ---

# --- LOW HINT: RETURN_UNDEF_833_2 line 833 in _load_data_reuse() ---
# Source:  return 1 if($self->{reuse_loaded});
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Config::Abstraction requires constructor arguments, add them here.
# my $obj = new_ok('Config::Abstraction');
# ok($obj->..., 'RETURN_UNDEF_833_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_846_2 line 846 in _load_data_reuse() ---
# Source:  return 1;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Config::Abstraction requires constructor arguments, add them here.
# my $obj = new_ok('Config::Abstraction');
# ok($obj->..., 'RETURN_UNDEF_846_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1154_2 line 1154 in _is_local_host() ---
# Source:  return 0 unless defined($host) && length($host);
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Config::Abstraction requires constructor arguments, add them here.
# my $obj = new_ok('Config::Abstraction');
# ok($obj->..., 'RETURN_UNDEF_1154_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1158_2 line 1158 in _is_local_host() ---
# Source:  return 1 if lc($bare) eq 'localhost';
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Config::Abstraction requires constructor arguments, add them here.
# my $obj = new_ok('Config::Abstraction');
# ok($obj->..., 'RETURN_UNDEF_1158_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1159_2 line 1159 in _is_local_host() ---
# Source:  return 1 if $bare eq '127.0.0.1';
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Config::Abstraction requires constructor arguments, add them here.
# my $obj = new_ok('Config::Abstraction');
# ok($obj->..., 'RETURN_UNDEF_1159_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1160_2 line 1160 in _is_local_host() ---
# Source:  return 1 if $bare eq '::1';
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Config::Abstraction requires constructor arguments, add them here.
# my $obj = new_ok('Config::Abstraction');
# ok($obj->..., 'RETURN_UNDEF_1160_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1164_2 line 1164 in _is_local_host() ---
# Source:  return 1 if lc($bare) eq $fqdn;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Config::Abstraction requires constructor arguments, add them here.
# my $obj = new_ok('Config::Abstraction');
# ok($obj->..., 'RETURN_UNDEF_1164_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1167_2 line 1167 in _is_local_host() ---
# Source:  return 1 if lc($bare) eq $short;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Config::Abstraction requires constructor arguments, add them here.
# my $obj = new_ok('Config::Abstraction');
# ok($obj->..., 'RETURN_UNDEF_1167_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1169_2 line 1169 in _is_local_host() ---
# Source:  return 0;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Config::Abstraction requires constructor arguments, add them here.
# my $obj = new_ok('Config::Abstraction');
# ok($obj->..., 'RETURN_UNDEF_1169_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1243_3 line 1243 in _slurp_remote() ---
# Source:  return undef;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Config::Abstraction requires constructor arguments, add them here.
# my $obj = new_ok('Config::Abstraction');
# ok($obj->..., 'RETURN_UNDEF_1243_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1245_2 line 1245 in _slurp_remote() ---
# Source:  return $content;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Config::Abstraction requires constructor arguments, add them here.
# my $obj = new_ok('Config::Abstraction');
# ok($obj->..., 'RETURN_UNDEF_1245_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1305_3 line 1305 in _parse_config_string() ---
# Source:  return undef;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Config::Abstraction requires constructor arguments, add them here.
# my $obj = new_ok('Config::Abstraction');
# ok($obj->..., 'RETURN_UNDEF_1305_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1308_2 line 1308 in _parse_config_string() ---
# Source:  return $data;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Config::Abstraction requires constructor arguments, add them here.
# my $obj = new_ok('Config::Abstraction');
# ok($obj->..., 'RETURN_UNDEF_1308_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1328_3 line 1328 in AUTOLOAD() ---
# Source:  return $data->{$key} if(exists $data->{$key});
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Config::Abstraction requires constructor arguments, add them here.
# my $obj = new_ok('Config::Abstraction');
# ok($obj->..., 'RETURN_UNDEF_1328_3: add assertion here');

done_testing();
