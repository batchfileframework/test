#!/usr/bin/perl
use strict;
use warnings;

print "Hello, world!\n";

if (@ARGV) {
    my $arg = $ARGV[0];

    if (lc($arg) eq 'true') {
        print "The argument was true.\n";
    } elsif (lc($arg) eq 'false') {
        print "The argument was false.\n";
    } else {
        print "The argument was not a recognizable boolean value.\n";
    }
} else {
    print "No argument was provided.\n";
}
