#!perl -T

use Test::More tests => 1;

BEGIN {
	use_ok( 'Net::Disqus::Post' );
}

diag( "Testing Net::Disqus::Post $Net::Disqus::Post::VERSION, Perl $], $^X" );
