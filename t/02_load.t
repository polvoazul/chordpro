#! perl

use strict;
use warnings;
use App::Music::ChordPro::Testing;

if ( -d "t" ) {
    chdir "t";
    $0 =~ s;(^|/)t/;$1;;
}

use lib "../script";

$::__EMBEDDED__ = 1;

my $test;

++$test; use_ok("App::Music::ChordPro");
++$test; use_ok("App::Music::ChordPro::Config");
++$test; use_ok("App::Music::ChordPro::Songbook");
++$test; use_ok("App::Music::ChordPro::Output::Debug");
++$test; use_ok("App::Music::ChordPro::Output::Text");
++$test; use_ok("App::Music::ChordPro::Output::ChordPro");
++$test; use_ok("App::Music::ChordPro::Output::HTML");
++$test; use_ok("App::Music::ChordPro::Output::PDF");

diag( "Testing App::Music::ChordPro $App::Music::ChordPro::VERSION, Perl $], $^X" );

done_testing($test);
