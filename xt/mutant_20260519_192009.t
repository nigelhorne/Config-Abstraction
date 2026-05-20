#!/usr/bin/env perl
# Auto-generated mutant test stubs
# Generated: 2026-05-19 19:20:09
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

# --- SURVIVOR: COND_INV_349_3 (MEDIUM) line 349 in new() ---
# Source:  if($params->{'config_file'} && File::Spec->file_name_is_absolute($params->{'config_file'})) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_349_3 line 349 in new()';
    # NOTE: new is a class method — call directly.
    my $result = Config::Abstraction->new(...);
    # ok($result, 'COND_INV_349_3: add assertion here');
    # TODO: exercise line 349 in new() to detect the mutant
    fail('COND_INV_349_3: replace with real assertion');
}

# --- SURVIVOR: COND_INV_353_4 (MEDIUM) line 353 in new() ---
# Source:  if($^O ne 'MSWin32') {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_353_4 line 353 in new()';
    # NOTE: new is a class method — call directly.
    my $result = Config::Abstraction->new(...);
    # ok($result, 'COND_INV_353_4: add assertion here');
    # TODO: exercise line 353 in new() to detect the mutant
    fail('COND_INV_353_4: replace with real assertion');
}

# --- SURVIVOR: COND_INV_358_4 (MEDIUM) line 358 in new() ---
# Source:  if($ENV{'HOME'}) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_358_4 line 358 in new()';
    # Hint: may need $ENV{'HOME'} set to exercise this line
    # NOTE: new is a class method — call directly.
    my $result = Config::Abstraction->new(...);
    # ok($result, 'COND_INV_358_4: add assertion here');
    # TODO: exercise line 358 in new() to detect the mutant
    fail('COND_INV_358_4: replace with real assertion');
}

# --- SURVIVOR: COND_INV_369_4 (MEDIUM) line 369 in new() ---
# Source:  if(my $dir = $ENV{'CONFIG_DIR'}) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_369_4 line 369 in new()';
    # Hint: may need $ENV{'CONFIG_DIR'} set to exercise this line
    # NOTE: new is a class method — call directly.
    my $result = Config::Abstraction->new(...);
    # ok($result, 'COND_INV_369_4: add assertion here');
    # TODO: exercise line 369 in new() to detect the mutant
    fail('COND_INV_369_4: replace with real assertion');
}

# --- SURVIVOR: COND_INV_385_3 (MEDIUM) line 385 in new() ---
# Source:  if(!Scalar::Util::blessed($logger)) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_385_3 line 385 in new()';
    # NOTE: new is a class method — call directly.
    my $result = Config::Abstraction->new(...);
    # ok($result, 'COND_INV_385_3: add assertion here');
    # TODO: exercise line 385 in new() to detect the mutant
    fail('COND_INV_385_3: replace with real assertion');
}

# --- SURVIVOR: COND_INV_388_4 (MEDIUM) line 388 in new() ---
# Source:  if($params->{'level'} && $self->{'logger'}->can('level')) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_388_4 line 388 in new()';
    # NOTE: new is a class method — call directly.
    my $result = Config::Abstraction->new(...);
    # ok($result, 'COND_INV_388_4: add assertion here');
    # TODO: exercise line 388 in new() to detect the mutant
    fail('COND_INV_388_4: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_413_2 (MEDIUM) line 413 in _is_plain_scalar() ---
# Source:  return 0 if Scalar::Util::blessed($val);
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_413_2 line 413 in _is_plain_scalar()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 413 in _is_plain_scalar() to detect the mutant
    fail('BOOL_NEGATE_413_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_414_2 (MEDIUM) line 414 in _is_plain_scalar() ---
# Source:  return 0 if ref($val);
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_414_2 line 414 in _is_plain_scalar()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 414 in _is_plain_scalar() to detect the mutant
    fail('BOOL_NEGATE_414_2: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_438_46_< (HIGH) line 438 in _load_config() ---
# Source:  if($self->{'config_file'} && (scalar(@dirs) > 1)) {
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (4 variants — one test should kill all):
#   Numeric boundary flip > to <
#   Numeric boundary flip > to >=
#   Numeric boundary flip > to <=
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_438_46_< line 438 in _load_config()';
    # Suggested boundary values to test: 0, 1, 2
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 438 in _load_config() to detect the mutant
    fail('NUM_BOUNDARY_438_46_<: replace with real assertion');
}

# --- SURVIVOR: COND_INV_439_3 (MEDIUM) line 439 in _load_config() ---
# Source:  if(File::Spec->file_name_is_absolute($self->{'config_file'})) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_439_3 line 439 in _load_config()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 439 in _load_config() to detect the mutant
    fail('COND_INV_439_3: replace with real assertion');
}

# --- SURVIVOR: COND_INV_476_5 (MEDIUM) line 476 in _load_config() ---
# Source:  if($self->_load_driver('XML::Simple', ['XMLin'])) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_476_5 line 476 in _load_config()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 476 in _load_config() to detect the mutant
    fail('COND_INV_476_5: replace with real assertion');
}

# --- SURVIVOR: COND_INV_478_6 (MEDIUM) line 478 in _load_config() ---
# Source:  if($@) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_478_6 line 478 in _load_config()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 478 in _load_config() to detect the mutant
    fail('COND_INV_478_6: replace with real assertion');
}

# --- SURVIVOR: COND_INV_479_7 (MEDIUM) line 479 in _load_config() ---
# Source:  if($logger) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_479_7 line 479 in _load_config()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 479 in _load_config() to detect the mutant
    fail('COND_INV_479_7: replace with real assertion');
}

# --- SURVIVOR: COND_INV_509_6 (MEDIUM) line 509 in _load_config() ---
# Source:  if($logger) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_509_6 line 509 in _load_config()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 509 in _load_config() to detect the mutant
    fail('COND_INV_509_6: replace with real assertion');
}

# --- SURVIVOR: COND_INV_518_6 (MEDIUM) line 518 in _load_config() ---
# Source:  if($logger) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_518_6 line 518 in _load_config()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 518 in _load_config() to detect the mutant
    fail('COND_INV_518_6: replace with real assertion');
}

# --- SURVIVOR: COND_INV_524_6 (MEDIUM) line 524 in _load_config() ---
# Source:  if($logger) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_524_6 line 524 in _load_config()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 524 in _load_config() to detect the mutant
    fail('COND_INV_524_6: replace with real assertion');
}

# --- SURVIVOR: COND_INV_538_3 (MEDIUM) line 538 in _load_config() ---
# Source:  if(!$self->{'script_name'}) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_538_3 line 538 in _load_config()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 538 in _load_config() to detect the mutant
    fail('COND_INV_538_3: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_550_61_!= (HIGH) line 550 in _load_config() ---
# Source:  next if(($config_file eq $script_name) && ((length($dir) == 0) || ($dir eq File::Spec->curdir())));
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (1 variant):
#   Numeric boundary flip == to !=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_550_61_!= line 550 in _load_config()';
    # Suggested boundary values to test: 0, 1
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 550 in _load_config() to detect the mutant
    fail('NUM_BOUNDARY_550_61_!=: replace with real assertion');
}

# --- SURVIVOR: COND_INV_563_8 (MEDIUM) line 563 in _load_config() ---
# Source:  if($data = XMLin($path, ForceArray => 0, KeyAttr => [])) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_563_8 line 563 in _load_config()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 563 in _load_config() to detect the mutant
    fail('COND_INV_563_8: replace with real assertion');
}

# --- SURVIVOR: COND_INV_582_7 (MEDIUM) line 582 in _load_config() ---
# Source:  if($is_json) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_582_7 line 582 in _load_config()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 582 in _load_config() to detect the mutant
    fail('COND_INV_582_7: replace with real assertion');
}

# --- SURVIVOR: COND_INV_584_8 (MEDIUM) line 584 in _load_config() ---
# Source:  if($@) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_584_8 line 584 in _load_config()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 584 in _load_config() to detect the mutant
    fail('COND_INV_584_8: replace with real assertion');
}

# --- SURVIVOR: COND_INV_590_7 (MEDIUM) line 590 in _load_config() ---
# Source:  if($data) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_590_7 line 590 in _load_config()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 590 in _load_config() to detect the mutant
    fail('COND_INV_590_7: replace with real assertion');
}

# --- SURVIVOR: COND_INV_626_8 (MEDIUM) line 626 in _load_config() ---
# Source:  if($data) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_626_8 line 626 in _load_config()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 626 in _load_config() to detect the mutant
    fail('COND_INV_626_8: replace with real assertion');
}

# --- SURVIVOR: COND_INV_637_9 (MEDIUM) line 637 in _load_config() ---
# Source:  if($data) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_637_9 line 637 in _load_config()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 637 in _load_config() to detect the mutant
    fail('COND_INV_637_9: replace with real assertion');
}

# --- SURVIVOR: COND_INV_643_9 (MEDIUM) line 643 in _load_config() ---
# Source:  if($self->_load_driver('XML::Simple', ['XMLin'])) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_643_9 line 643 in _load_config()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 643 in _load_config() to detect the mutant
    fail('COND_INV_643_9: replace with real assertion');
}

# --- SURVIVOR: COND_INV_646_9 (MEDIUM) line 646 in _load_config() ---
# Source:  if((!$data) || (ref($data) ne 'HASH')) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_646_9 line 646 in _load_config()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 646 in _load_config() to detect the mutant
    fail('COND_INV_646_9: replace with real assertion');
}

# --- SURVIVOR: COND_INV_647_10 (MEDIUM) line 647 in _load_config() ---
# Source:  if($self->_load_driver('Config::Abstract')) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_647_10 line 647 in _load_config()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 647 in _load_config() to detect the mutant
    fail('COND_INV_647_10: replace with real assertion');
}

# --- SURVIVOR: COND_INV_654_11 (MEDIUM) line 654 in _load_config() ---
# Source:  if($err) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_654_11 line 654 in _load_config()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 654 in _load_config() to detect the mutant
    fail('COND_INV_654_11: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_658_37_!= (HIGH) line 658 in _load_config() ---
# Source:  if(scalar(keys %{$data}) == 0) {
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (2 variants — one test should kill all):
#   Numeric boundary flip == to !=
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_658_37_!= line 658 in _load_config()';
    # Suggested boundary values to test: 0, 1
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 658 in _load_config() to detect the mutant
    fail('NUM_BOUNDARY_658_37_!=: replace with real assertion');
}

# --- SURVIVOR: COND_INV_668_10 (MEDIUM) line 668 in _load_config() ---
# Source:  if($data = $ca->parse()) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_668_10 line 668 in _load_config()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 668 in _load_config() to detect the mutant
    fail('COND_INV_668_10: replace with real assertion');
}

# --- SURVIVOR: COND_INV_677_6 (MEDIUM) line 677 in _load_config() ---
# Source:  if($@) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_677_6 line 677 in _load_config()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 677 in _load_config() to detect the mutant
    fail('COND_INV_677_6: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_727_22_< (HIGH) line 727 in _load_config() ---
# Source:  if(scalar(@parts) > 1) {
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (4 variants — one test should kill all):
#   Numeric boundary flip > to <
#   Numeric boundary flip > to >=
#   Numeric boundary flip > to <=
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_727_22_< line 727 in _load_config()';
    # Suggested boundary values to test: 0, 1, 2
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 727 in _load_config() to detect the mutant
    fail('NUM_BOUNDARY_727_22_<: replace with real assertion');
}

# --- SURVIVOR: COND_INV_734_2 (MEDIUM) line 734 in _load_config() ---
# Source:  if($self->{'flatten'}) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_734_2 line 734 in _load_config()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 734 in _load_config() to detect the mutant
    fail('COND_INV_734_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_760_3 (MEDIUM) line 760 in get() ---
# Source:  return undef unless ref $ref eq 'HASH';
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_760_3 line 760 in get()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 760 in get() to detect the mutant
    fail('BOOL_NEGATE_760_3: replace with real assertion');
}

# --- SURVIVOR: COND_INV_764_2 (MEDIUM) line 764 in get() ---
# Source:  if((defined($ref) && (ref($ref) eq 'HASH') && !$self->{'no_fixate'})) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_764_2 line 764 in get()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 764 in get() to detect the mutant
    fail('COND_INV_764_2: replace with real assertion');
}

# --- SURVIVOR: COND_INV_766_4 (MEDIUM) line 766 in get() ---
# Source:  if(ref($ref) eq 'HASH') {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_766_4 line 766 in get()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 766 in get() to detect the mutant
    fail('COND_INV_766_4: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_783_2 (MEDIUM) line 783 in _load_data_reuse() ---
# Source:  return 0 if($self->{'no_fixate'});
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_783_2 line 783 in _load_data_reuse()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 783 in _load_data_reuse() to detect the mutant
    fail('BOOL_NEGATE_783_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_785_2 (MEDIUM) line 785 in _load_data_reuse() ---
# Source:  return 1 if($self->{reuse_loaded});
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_785_2 line 785 in _load_data_reuse()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 785 in _load_data_reuse() to detect the mutant
    fail('BOOL_NEGATE_785_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_793_3 (MEDIUM) line 793 in _load_data_reuse() ---
# Source:  return 1;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_793_3 line 793 in _load_data_reuse()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 793 in _load_data_reuse() to detect the mutant
    fail('BOOL_NEGATE_793_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_814_3 (MEDIUM) line 814 in exists() ---
# Source:  return 0 unless ref $ref eq 'HASH';
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_814_3 line 814 in exists()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 814 in exists() to detect the mutant
    fail('BOOL_NEGATE_814_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_815_3 (MEDIUM) line 815 in exists() ---
# Source:  return 0 if(!exists($ref->{$part}));
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_815_3 line 815 in exists()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 815 in exists() to detect the mutant
    fail('BOOL_NEGATE_815_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_893_2 (MEDIUM) line 893 in merge_defaults() ---
# Source:  return $config if(scalar(@_) == 0);
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_893_2 line 893 in merge_defaults()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 893 in merge_defaults() to detect the mutant
    fail('BOOL_NEGATE_893_2: replace with real assertion');
}

# --- SURVIVOR: COND_INV_903_3 (MEDIUM) line 903 in merge_defaults() ---
# Source:  if($params->{'deep'}) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_903_3 line 903 in merge_defaults()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 903 in merge_defaults() to detect the mutant
    fail('COND_INV_903_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_925_2 (MEDIUM) line 925 in _load_driver() ---
# Source:  return 0 if($self->{'failed'}{$driver});
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_925_2 line 925 in _load_driver()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 925 in _load_driver() to detect the mutant
    fail('BOOL_NEGATE_925_2: replace with real assertion');
}

# --- SURVIVOR: COND_INV_985_2 (MEDIUM) line 985 in AUTOLOAD() ---
# Source:  if ($self->{flatten}) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_985_2 line 985 in AUTOLOAD()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 985 in AUTOLOAD() to detect the mutant
    fail('COND_INV_985_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_986_3 (MEDIUM) line 986 in AUTOLOAD() ---
# Source:  return $data->{$key} if(exists $data->{$key});
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_986_3 line 986 in AUTOLOAD()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 986 in AUTOLOAD() to detect the mutant
    fail('BOOL_NEGATE_986_3: replace with real assertion');
}

# --- LOW DIFFICULTY HINTS (comment stubs) ---

# --- LOW HINT: RETURN_UNDEF_413_2 line 413 in _is_plain_scalar() ---
# Source:  return 0 if Scalar::Util::blessed($val);
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Config::Abstraction requires constructor arguments, add them here.
# my $obj = new_ok('Config::Abstraction');
# ok($obj->..., 'RETURN_UNDEF_413_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_414_2 line 414 in _is_plain_scalar() ---
# Source:  return 0 if ref($val);
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Config::Abstraction requires constructor arguments, add them here.
# my $obj = new_ok('Config::Abstraction');
# ok($obj->..., 'RETURN_UNDEF_414_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_760_3 line 760 in get() ---
# Source:  return undef unless ref $ref eq 'HASH';
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Config::Abstraction requires constructor arguments, add them here.
# my $obj = new_ok('Config::Abstraction');
# ok($obj->..., 'RETURN_UNDEF_760_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_783_2 line 783 in _load_data_reuse() ---
# Source:  return 0 if($self->{'no_fixate'});
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Config::Abstraction requires constructor arguments, add them here.
# my $obj = new_ok('Config::Abstraction');
# ok($obj->..., 'RETURN_UNDEF_783_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_785_2 line 785 in _load_data_reuse() ---
# Source:  return 1 if($self->{reuse_loaded});
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Config::Abstraction requires constructor arguments, add them here.
# my $obj = new_ok('Config::Abstraction');
# ok($obj->..., 'RETURN_UNDEF_785_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_793_3 line 793 in _load_data_reuse() ---
# Source:  return 1;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Config::Abstraction requires constructor arguments, add them here.
# my $obj = new_ok('Config::Abstraction');
# ok($obj->..., 'RETURN_UNDEF_793_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_814_3 line 814 in exists() ---
# Source:  return 0 unless ref $ref eq 'HASH';
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Config::Abstraction requires constructor arguments, add them here.
# my $obj = new_ok('Config::Abstraction');
# ok($obj->..., 'RETURN_UNDEF_814_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_815_3 line 815 in exists() ---
# Source:  return 0 if(!exists($ref->{$part}));
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Config::Abstraction requires constructor arguments, add them here.
# my $obj = new_ok('Config::Abstraction');
# ok($obj->..., 'RETURN_UNDEF_815_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_893_2 line 893 in merge_defaults() ---
# Source:  return $config if(scalar(@_) == 0);
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Config::Abstraction requires constructor arguments, add them here.
# my $obj = new_ok('Config::Abstraction');
# ok($obj->..., 'RETURN_UNDEF_893_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_925_2 line 925 in _load_driver() ---
# Source:  return 0 if($self->{'failed'}{$driver});
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Config::Abstraction requires constructor arguments, add them here.
# my $obj = new_ok('Config::Abstraction');
# ok($obj->..., 'RETURN_UNDEF_925_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_986_3 line 986 in AUTOLOAD() ---
# Source:  return $data->{$key} if(exists $data->{$key});
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Config::Abstraction requires constructor arguments, add them here.
# my $obj = new_ok('Config::Abstraction');
# ok($obj->..., 'RETURN_UNDEF_986_3: add assertion here');

done_testing();
