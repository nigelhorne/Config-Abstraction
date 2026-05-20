#!/usr/bin/env perl
# Auto-generated mutant test stubs
# Generated: 2026-05-20 20:22:52
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
# Source:  } else {
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
# Source:  } else {
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
# Source:  File::Spec->catdir($ENV{'HOME'}, '.conf'),
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
# Source:  } else {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_369_4 line 369 in new()';
    # NOTE: new is a class method — call directly.
    my $result = Config::Abstraction->new(...);
    # ok($result, 'COND_INV_369_4: add assertion here');
    # TODO: exercise line 369 in new() to detect the mutant
    fail('COND_INV_369_4: replace with real assertion');
}

# --- SURVIVOR: COND_INV_384_2 (MEDIUM) line 384 in new() ---
# Source:  # Don't call $self->_load_driver('Log::Abstraction') as it can make a call to logger, which is yet to be set up
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_384_2 line 384 in new()';
    # NOTE: new is a class method — call directly.
    my $result = Config::Abstraction->new(...);
    # ok($result, 'COND_INV_384_2: add assertion here');
    # TODO: exercise line 384 in new() to detect the mutant
    fail('COND_INV_384_2: replace with real assertion');
}

# --- SURVIVOR: COND_INV_385_3 (MEDIUM) line 385 in new() ---
# Source:  eval "require Log::Abstraction";
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
# Source:  } else {
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

# --- SURVIVOR: COND_INV_393_5 (MEDIUM) line 393 in new() ---
# Source:  }
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_393_5 line 393 in new()';
    # NOTE: new is a class method — call directly.
    my $result = Config::Abstraction->new(...);
    # ok($result, 'COND_INV_393_5: add assertion here');
    # TODO: exercise line 393 in new() to detect the mutant
    fail('COND_INV_393_5: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_445_46_< (HIGH) line 445 in _load_config() ---
# Source:  # Handle absolute paths
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (4 variants — one test should kill all):
#   Numeric boundary flip > to <
#   Numeric boundary flip > to >=
#   Numeric boundary flip > to <=
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_445_46_< line 445 in _load_config()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 445 in _load_config() to detect the mutant
    fail('NUM_BOUNDARY_445_46_<: replace with real assertion');
}

# --- SURVIVOR: COND_INV_446_3 (MEDIUM) line 446 in _load_config() ---
# Source:  @dirs = ('');
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_446_3 line 446 in _load_config()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 446 in _load_config() to detect the mutant
    fail('COND_INV_446_3: replace with real assertion');
}

# --- SURVIVOR: COND_INV_483_5 (MEDIUM) line 483 in _load_config() ---
# Source:  } elsif ($file =~ /\.json$/) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_483_5 line 483 in _load_config()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 483 in _load_config() to detect the mutant
    fail('COND_INV_483_5: replace with real assertion');
}

# --- SURVIVOR: COND_INV_485_6 (MEDIUM) line 485 in _load_config() ---
# Source:  if($@) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_485_6 line 485 in _load_config()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 485 in _load_config() to detect the mutant
    fail('COND_INV_485_6: replace with real assertion');
}

# --- SURVIVOR: COND_INV_486_7 (MEDIUM) line 486 in _load_config() ---
# Source:  if($logger) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_486_7 line 486 in _load_config()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 486 in _load_config() to detect the mutant
    fail('COND_INV_486_7: replace with real assertion');
}

# --- SURVIVOR: COND_INV_516_6 (MEDIUM) line 516 in _load_config() ---
# Source:  }
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_516_6 line 516 in _load_config()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 516 in _load_config() to detect the mutant
    fail('COND_INV_516_6: replace with real assertion');
}

# --- SURVIVOR: COND_INV_525_6 (MEDIUM) line 525 in _load_config() ---
# Source:  $section => { map { $_ => $ini->val($section, $_) } $ini->Parameters($section) }
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_525_6 line 525 in _load_config()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 525 in _load_config() to detect the mutant
    fail('COND_INV_525_6: replace with real assertion');
}

# --- SURVIVOR: COND_INV_531_6 (MEDIUM) line 531 in _load_config() ---
# Source:  Carp::carp("Failed to load INI from $path: $@");
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_531_6 line 531 in _load_config()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 531 in _load_config() to detect the mutant
    fail('COND_INV_531_6: replace with real assertion');
}

# --- SURVIVOR: COND_INV_545_3 (MEDIUM) line 545 in _load_config() ---
# Source:  }
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_545_3 line 545 in _load_config()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 545 in _load_config() to detect the mutant
    fail('COND_INV_545_3: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_557_61_!= (HIGH) line 557 in _load_config() ---
# Source:  if(!$self->{'script_name'}) {
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (1 variant):
#   Numeric boundary flip == to !=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_557_61_!= line 557 in _load_config()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 557 in _load_config() to detect the mutant
    fail('NUM_BOUNDARY_557_61_!=: replace with real assertion');
}

# --- SURVIVOR: COND_INV_570_8 (MEDIUM) line 570 in _load_config() ---
# Source:  my $path = length($dir) ? File::Spec->catfile($dir, $config_file) : $config_file;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_570_8 line 570 in _load_config()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 570 in _load_config() to detect the mutant
    fail('COND_INV_570_8: replace with real assertion');
}

# --- SURVIVOR: COND_INV_589_7 (MEDIUM) line 589 in _load_config() ---
# Source:  $self->{'type'} = 'XML';
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_589_7 line 589 in _load_config()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 589 in _load_config() to detect the mutant
    fail('COND_INV_589_7: replace with real assertion');
}

# --- SURVIVOR: COND_INV_591_8 (MEDIUM) line 591 in _load_config() ---
# Source:  $data = $data->{'config'};
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_591_8 line 591 in _load_config()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 591 in _load_config() to detect the mutant
    fail('COND_INV_591_8: replace with real assertion');
}

# --- SURVIVOR: COND_INV_597_7 (MEDIUM) line 597 in _load_config() ---
# Source:  $self->_load_driver('JSON::Parse');
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_597_7 line 597 in _load_config()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 597 in _load_config() to detect the mutant
    fail('COND_INV_597_7: replace with real assertion');
}

# --- SURVIVOR: COND_INV_633_8 (MEDIUM) line 633 in _load_config() ---
# Source:  if($v =~ /,/) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_633_8 line 633 in _load_config()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 633 in _load_config() to detect the mutant
    fail('COND_INV_633_8: replace with real assertion');
}

# --- SURVIVOR: COND_INV_644_9 (MEDIUM) line 644 in _load_config() ---
# Source:  }
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_644_9 line 644 in _load_config()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 644 in _load_config() to detect the mutant
    fail('COND_INV_644_9: replace with real assertion');
}

# --- SURVIVOR: COND_INV_650_9 (MEDIUM) line 650 in _load_config() ---
# Source:  $self->_load_driver('Config::IniFiles');
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_650_9 line 650 in _load_config()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 650 in _load_config() to detect the mutant
    fail('COND_INV_650_9: replace with real assertion');
}

# --- SURVIVOR: COND_INV_653_9 (MEDIUM) line 653 in _load_config() ---
# Source:  my $section = $_;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_653_9 line 653 in _load_config()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 653 in _load_config() to detect the mutant
    fail('COND_INV_653_9: replace with real assertion');
}

# --- SURVIVOR: COND_INV_654_10 (MEDIUM) line 654 in _load_config() ---
# Source:  $section => { map { $_ => $ini->val($section, $_) } $ini->Parameters($section) }
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_654_10 line 654 in _load_config()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 654 in _load_config() to detect the mutant
    fail('COND_INV_654_10: replace with real assertion');
}

# --- SURVIVOR: COND_INV_661_11 (MEDIUM) line 661 in _load_config() ---
# Source:  # Maybe XML without the leading XML header
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_661_11 line 661 in _load_config()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 661 in _load_config() to detect the mutant
    fail('COND_INV_661_11: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_665_37_!= (HIGH) line 665 in _load_config() ---
# Source:  if((!$data) || (ref($data) ne 'HASH')) {
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (2 variants — one test should kill all):
#   Numeric boundary flip == to !=
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_665_37_!= line 665 in _load_config()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 665 in _load_config() to detect the mutant
    fail('NUM_BOUNDARY_665_37_!=: replace with real assertion');
}

# --- SURVIVOR: COND_INV_675_10 (MEDIUM) line 675 in _load_config() ---
# Source:  } elsif($data) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_675_10 line 675 in _load_config()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 675 in _load_config() to detect the mutant
    fail('COND_INV_675_10: replace with real assertion');
}

# --- SURVIVOR: COND_INV_684_6 (MEDIUM) line 684 in _load_config() ---
# Source:  if((!$data) || (ref($data) ne 'HASH')) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_684_6 line 684 in _load_config()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 684 in _load_config() to detect the mutant
    fail('COND_INV_684_6: replace with real assertion');
}

# --- SURVIVOR: COND_INV_741_2 (MEDIUM) line 741 in _load_config() ---
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_741_2 line 741 in _load_config()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 741 in _load_config() to detect the mutant
    fail('COND_INV_741_2: replace with real assertion');
}

# --- SURVIVOR: COND_INV_771_2 (MEDIUM) line 771 in get() ---
# Source:  {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_771_2 line 771 in get()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 771 in get() to detect the mutant
    fail('COND_INV_771_2: replace with real assertion');
}

# --- SURVIVOR: COND_INV_773_4 (MEDIUM) line 773 in get() ---
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_773_4 line 773 in get()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 773 in get() to detect the mutant
    fail('COND_INV_773_4: replace with real assertion');
}

# --- SURVIVOR: COND_INV_774_5 (MEDIUM) line 774 in get() ---
# Source:  if($self->{flatten}) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_774_5 line 774 in get()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 774 in get() to detect the mutant
    fail('COND_INV_774_5: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_792_2 (MEDIUM) line 792 in get() ---
# Source:  # RT#171980
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_792_2 line 792 in get()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 792 in get() to detect the mutant
    fail('BOOL_NEGATE_792_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_794_2 (MEDIUM) line 794 in get() ---
# Source:  }
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_794_2 line 794 in get()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 794 in get() to detect the mutant
    fail('BOOL_NEGATE_794_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_802_3 (MEDIUM) line 802 in _load_data_reuse() ---
# Source:  my $self = $_[0];
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_802_3 line 802 in _load_data_reuse()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 802 in _load_data_reuse() to detect the mutant
    fail('BOOL_NEGATE_802_3: replace with real assertion');
}

# --- SURVIVOR: COND_INV_994_2 (MEDIUM) line 994 in _load_driver() ---
# Source:  # Attempting to call a nonexistent key
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_994_2 line 994 in _load_driver()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 994 in _load_driver() to detect the mutant
    fail('COND_INV_994_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_995_3 (MEDIUM) line 995 in _load_driver() ---
# Source:  my $foo = $config->nonexistent_key();	# dies with error
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_995_3 line 995 in _load_driver()';
    # NOTE: new() called with no arguments as a starting point.
    # If Config::Abstraction requires constructor arguments, add them here.
    my $obj = new_ok('Config::Abstraction');
    # TODO: exercise line 995 in _load_driver() to detect the mutant
    fail('BOOL_NEGATE_995_3: replace with real assertion');
}

# --- LOW DIFFICULTY HINTS (comment stubs) ---

# --- LOW HINT: RETURN_UNDEF_792_2 line 792 in get() ---
# Source:  # RT#171980
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Config::Abstraction requires constructor arguments, add them here.
# my $obj = new_ok('Config::Abstraction');
# ok($obj->..., 'RETURN_UNDEF_792_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_794_2 line 794 in get() ---
# Source:  }
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Config::Abstraction requires constructor arguments, add them here.
# my $obj = new_ok('Config::Abstraction');
# ok($obj->..., 'RETURN_UNDEF_794_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_802_3 line 802 in _load_data_reuse() ---
# Source:  my $self = $_[0];
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Config::Abstraction requires constructor arguments, add them here.
# my $obj = new_ok('Config::Abstraction');
# ok($obj->..., 'RETURN_UNDEF_802_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_995_3 line 995 in _load_driver() ---
# Source:  my $foo = $config->nonexistent_key();	# dies with error
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Config::Abstraction requires constructor arguments, add them here.
# my $obj = new_ok('Config::Abstraction');
# ok($obj->..., 'RETURN_UNDEF_995_3: add assertion here');

done_testing();
