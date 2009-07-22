#!perl -T

use Test::More tests => 1;

BEGIN {
	use_ok( 'Net::Disqus' );
}

diag( "Testing Net::Disqus $Net::Disqus::VERSION, Perl $], $^X" );
