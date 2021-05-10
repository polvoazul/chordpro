#!/usr/bin/perl

use strict;
use warnings;
use utf8;

use App::Music::ChordPro::Testing;
use App::Packager qw( :name App::Music::ChordPro );
use App::Music::ChordPro::Config;
use App::Music::ChordPro::Songbook;

plan tests => 3;

our $config = App::Music::ChordPro::Config::configurator;
my $s = App::Music::ChordPro::Songbook->new;

my $data = <<EOD;
{title: Swing Low Sweet Chariot}
{key: D}
I [D]looked over Jordan, and [G/B]what did I [D]see,
EOD

eval { $s->parse_file( \$data, { transpose => 3 } ) } or diag("$@");

ok( scalar( @{ $s->{songs} } ) == 1, "One song" );
isa_ok( $s->{songs}->[0], 'App::Music::ChordPro::Song', "It's a song" );

my $song = {
	    'settings' => {},
	    'meta' => {
		       'songindex' => 1,
		       'key'   => [ 'F' ],
		       'title' => [
				   'Swing Low Sweet Chariot'
				  ],
		      },
	    'title' => 'Swing Low Sweet Chariot',
	    'chords' => {
			 'origin' => 'song',
			 'type' => 'diagrams',
			 'show' => 'all',
			 'chords' => [
				      'F',
				      'A#/D'
				     ]
			},
	    'body' => [
                       {
			 'context' => '',
			 'phrases' => [
					'I ',
					'looked over Jordan, and ',
					'what did I ',
					'see,'
				      ],
			 'chords' => [
				       '',
				       'F',
				       'A#/D',
				       'F'
				     ],
			 'type' => 'songline'
		       }
		      ],
	    'source' => { file => "__STRING__", line => 1 },
	    'structure' => 'linear',
	    'system' => 'common',
	   };

is_deeply( { %{ $s->{songs}->[0] } }, $song, "Song contents" );
