#!perl -T

use Test::More tests => 1;

BEGIN {
	use_ok( 'Disqus::Post' );
}

diag( "Testing Disqus::Post $Disqus::Post::VERSION, Perl $], $^X" );
