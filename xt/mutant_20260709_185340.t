#!/usr/bin/env perl
# Auto-generated mutant test stubs
# Generated: 2026-07-09 18:53:40
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

# --- SURVIVOR: COND_INV_351_4 (MEDIUM) line 351 in new() ---
# Source:  if($^O ne 'MSWin32') {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_351_4 line 351 in new()';
    # NOTE: new is a class method — call directly.
    my $result = Config::Abstraction->new(...);
    # ok($result, 'COND_INV_351_4: add assertion here');
    # TODO: exercise line 351 in new() to detect the mutant
    fail('COND_INV_351_4: replace with real assertion');
}

# --- SURVIVOR: COND_INV_382_2 (MEDIUM) line 382 in new() ---
# Source:  if(my $logger = $self->{'logger'}) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_382_2 line 382 in new()';
    # NOTE: new is a class method — call directly.
    my $result = Config::Abstraction->new(...);
    # ok($result, 'COND_INV_382_2: add assertion here');
    # TODO: exercise line 382 in new() to detect the mutant
    fail('COND_INV_382_2: replace with real assertion');
}

# --- SURVIVOR: COND_INV_383_3 (MEDIUM) line 383 in new() ---
# Source:  if(!Scalar::Util::blessed($logger)) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_383_3 line 383 in new()';
    # NOTE: new is a class method — call directly.
    my $result = Config::Abstraction->new(...);
    # ok($result, 'COND_INV_383_3: add assertion here');
    # TODO: exercise line 383 in new() to detect the mutant
    fail('COND_INV_383_3: replace with real assertion');
}

# --- SURVIVOR: COND_INV_386_4 (MEDIUM) line 386 in new() ---
# Source:  if($@) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_386_4 line 386 in new()';
    # NOTE: new is a class method — call directly.
    my $result = Config::Abstraction->new(...);
    # ok($result, 'COND_INV_386_4: add assertion here');
    # TODO: exercise line 386 in new() to detect the mutant
    fail('COND_INV_386_4: replace with real assertion');
}

# --- SURVIVOR: COND_INV_391_5 (MEDIUM) line 391 in new() ---
# Source:  if($params->{'level'} && $self->{'logger'}->can('level')) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_391_5 line 391 in new()';
    # NOTE: new is a class method — call directly.
    my $result = Config::Abstraction->new(...);
    # ok($result, 'COND_INV_391_5: add assertion here');
    # TODO: exercise line 391 in new() to detect the mutant
    fail('COND_INV_391_5: replace with real assertion');
}

# --- SURVIVOR: COND_INV_476_6 (MEDIUM) line 476 in _load_config() ---
# Source:  if($logger) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_476_6 line 476 in _load_config()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 476 in _load_config() to detect the mutant
    fail('COND_INV_476_6: replace with real assertion');
}

# --- SURVIVOR: COND_INV_495_5 (MEDIUM) line 495 in _load_config() ---
# Source:  if($self->_load_driver('XML::Simple', ['XMLin'])) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_495_5 line 495 in _load_config()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 495 in _load_config() to detect the mutant
    fail('COND_INV_495_5: replace with real assertion');
}

# --- SURVIVOR: COND_INV_497_6 (MEDIUM) line 497 in _load_config() ---
# Source:  if($@) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_497_6 line 497 in _load_config()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 497 in _load_config() to detect the mutant
    fail('COND_INV_497_6: replace with real assertion');
}

# --- SURVIVOR: COND_INV_498_7 (MEDIUM) line 498 in _load_config() ---
# Source:  if($logger) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_498_7 line 498 in _load_config()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 498 in _load_config() to detect the mutant
    fail('COND_INV_498_7: replace with real assertion');
}

# --- SURVIVOR: COND_INV_528_6 (MEDIUM) line 528 in _load_config() ---
# Source:  if($logger) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_528_6 line 528 in _load_config()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 528 in _load_config() to detect the mutant
    fail('COND_INV_528_6: replace with real assertion');
}

# --- SURVIVOR: COND_INV_537_6 (MEDIUM) line 537 in _load_config() ---
# Source:  if($logger) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_537_6 line 537 in _load_config()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 537 in _load_config() to detect the mutant
    fail('COND_INV_537_6: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_569_61_!= (HIGH) line 569 in _load_config() ---
# Source:  next if(($config_file eq $script_name) && ((length($dir) == 0) || ($dir eq File::Spec->curdir())));
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (1 variant):
#   Numeric boundary flip == to !=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_569_61_!= line 569 in _load_config()';
    # Suggested boundary values to test: 0, 1
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 569 in _load_config() to detect the mutant
    fail('NUM_BOUNDARY_569_61_!=: replace with real assertion');
}

# --- SURVIVOR: COND_INV_582_8 (MEDIUM) line 582 in _load_config() ---
# Source:  if($data = XMLin($path, ForceArray => 0, KeyAttr => [])) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_582_8 line 582 in _load_config()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 582 in _load_config() to detect the mutant
    fail('COND_INV_582_8: replace with real assertion');
}

# --- SURVIVOR: COND_INV_601_7 (MEDIUM) line 601 in _load_config() ---
# Source:  if($is_json) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_601_7 line 601 in _load_config()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 601 in _load_config() to detect the mutant
    fail('COND_INV_601_7: replace with real assertion');
}

# --- SURVIVOR: COND_INV_603_8 (MEDIUM) line 603 in _load_config() ---
# Source:  if($@) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_603_8 line 603 in _load_config()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 603 in _load_config() to detect the mutant
    fail('COND_INV_603_8: replace with real assertion');
}

# --- SURVIVOR: COND_INV_609_7 (MEDIUM) line 609 in _load_config() ---
# Source:  if($data) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_609_7 line 609 in _load_config()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 609 in _load_config() to detect the mutant
    fail('COND_INV_609_7: replace with real assertion');
}

# --- SURVIVOR: COND_INV_645_8 (MEDIUM) line 645 in _load_config() ---
# Source:  if($data) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_645_8 line 645 in _load_config()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 645 in _load_config() to detect the mutant
    fail('COND_INV_645_8: replace with real assertion');
}

# --- SURVIVOR: COND_INV_656_9 (MEDIUM) line 656 in _load_config() ---
# Source:  if($data) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_656_9 line 656 in _load_config()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 656 in _load_config() to detect the mutant
    fail('COND_INV_656_9: replace with real assertion');
}

# --- SURVIVOR: COND_INV_662_9 (MEDIUM) line 662 in _load_config() ---
# Source:  if($self->_load_driver('XML::Simple', ['XMLin'])) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_662_9 line 662 in _load_config()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 662 in _load_config() to detect the mutant
    fail('COND_INV_662_9: replace with real assertion');
}

# --- SURVIVOR: COND_INV_665_9 (MEDIUM) line 665 in _load_config() ---
# Source:  if((!$data) || (ref($data) ne 'HASH')) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_665_9 line 665 in _load_config()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 665 in _load_config() to detect the mutant
    fail('COND_INV_665_9: replace with real assertion');
}

# --- SURVIVOR: COND_INV_666_10 (MEDIUM) line 666 in _load_config() ---
# Source:  if($self->_load_driver('Config::Abstract')) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_666_10 line 666 in _load_config()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 666 in _load_config() to detect the mutant
    fail('COND_INV_666_10: replace with real assertion');
}

# --- SURVIVOR: COND_INV_673_11 (MEDIUM) line 673 in _load_config() ---
# Source:  if($err) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_673_11 line 673 in _load_config()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 673 in _load_config() to detect the mutant
    fail('COND_INV_673_11: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_677_37_!= (HIGH) line 677 in _load_config() ---
# Source:  if(scalar(keys %{$data}) == 0) {
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (2 variants — one test should kill all):
#   Numeric boundary flip == to !=
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_677_37_!= line 677 in _load_config()';
    # Suggested boundary values to test: 0, 1
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 677 in _load_config() to detect the mutant
    fail('NUM_BOUNDARY_677_37_!=: replace with real assertion');
}

# --- SURVIVOR: COND_INV_687_10 (MEDIUM) line 687 in _load_config() ---
# Source:  if($data = $ca->parse()) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_687_10 line 687 in _load_config()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 687 in _load_config() to detect the mutant
    fail('COND_INV_687_10: replace with real assertion');
}

# --- SURVIVOR: COND_INV_696_6 (MEDIUM) line 696 in _load_config() ---
# Source:  if($@) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_696_6 line 696 in _load_config()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 696 in _load_config() to detect the mutant
    fail('COND_INV_696_6: replace with real assertion');
}

# --- SURVIVOR: COND_INV_753_2 (MEDIUM) line 753 in _load_config() ---
# Source:  if($self->{'flatten'}) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_753_2 line 753 in _load_config()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 753 in _load_config() to detect the mutant
    fail('COND_INV_753_2: replace with real assertion');
}

# --- SURVIVOR: COND_INV_783_2 (MEDIUM) line 783 in get() ---
# Source:  if((defined($ref) && (ref($ref) eq 'HASH') && !$self->{'no_fixate'})) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_783_2 line 783 in get()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 783 in get() to detect the mutant
    fail('COND_INV_783_2: replace with real assertion');
}

# --- SURVIVOR: COND_INV_784_3 (MEDIUM) line 784 in get() ---
# Source:  if($self->_load_data_reuse()) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_784_3 line 784 in get()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 784 in get() to detect the mutant
    fail('COND_INV_784_3: replace with real assertion');
}

# --- SURVIVOR: COND_INV_785_4 (MEDIUM) line 785 in get() ---
# Source:  if(ref($ref) eq 'HASH') {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_785_4 line 785 in get()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 785 in get() to detect the mutant
    fail('COND_INV_785_4: replace with real assertion');
}

# --- SURVIVOR: COND_INV_786_5 (MEDIUM) line 786 in get() ---
# Source:  if(!tied %$ref) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_786_5 line 786 in get()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 786 in get() to detect the mutant
    fail('COND_INV_786_5: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_813_2 (MEDIUM) line 813 in _load_data_reuse() ---
# Source:  return 1 if($self->{reuse_loaded});
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_813_2 line 813 in _load_data_reuse()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 813 in _load_data_reuse() to detect the mutant
    fail('BOOL_NEGATE_813_2: replace with real assertion');
}

# --- SURVIVOR: COND_INV_820_2 (MEDIUM) line 820 in _load_data_reuse() ---
# Source:  if($@) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_820_2 line 820 in _load_data_reuse()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 820 in _load_data_reuse() to detect the mutant
    fail('COND_INV_820_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_826_2 (MEDIUM) line 826 in _load_data_reuse() ---
# Source:  return 1;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_826_2 line 826 in _load_data_reuse()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 826 in _load_data_reuse() to detect the mutant
    fail('BOOL_NEGATE_826_2: replace with real assertion');
}

# --- SURVIVOR: COND_INV_1020_2 (MEDIUM) line 1020 in AUTOLOAD() ---
# Source:  if ($self->{flatten}) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_1020_2 line 1020 in AUTOLOAD()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 1020 in AUTOLOAD() to detect the mutant
    fail('COND_INV_1020_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1021_3 (MEDIUM) line 1021 in AUTOLOAD() ---
# Source:  return $data->{$key} if(exists $data->{$key});
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1021_3 line 1021 in AUTOLOAD()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 1021 in AUTOLOAD() to detect the mutant
    fail('BOOL_NEGATE_1021_3: replace with real assertion');
}

# --- LOW DIFFICULTY HINTS (comment stubs) ---

# --- LOW HINT: RETURN_UNDEF_813_2 line 813 in _load_data_reuse() ---
# Source:  return 1 if($self->{reuse_loaded});
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Config::Abstraction requires constructor arguments, add them here.
# my $obj = new_ok('Config::Abstraction');
# ok($obj->..., 'RETURN_UNDEF_813_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_826_2 line 826 in _load_data_reuse() ---
# Source:  return 1;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Config::Abstraction requires constructor arguments, add them here.
# my $obj = new_ok('Config::Abstraction');
# ok($obj->..., 'RETURN_UNDEF_826_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1021_3 line 1021 in AUTOLOAD() ---
# Source:  return $data->{$key} if(exists $data->{$key});
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Config::Abstraction requires constructor arguments, add them here.
# my $obj = new_ok('Config::Abstraction');
# ok($obj->..., 'RETURN_UNDEF_1021_3: add assertion here');

done_testing();
