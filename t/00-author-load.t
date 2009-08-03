#!perl -T

use Test::More tests => 2;

BEGIN {
	use_ok( 'Net::Disqus::Author' );
}

diag( "Testing Net::Disqus::Author $Net::Disqus::Author::VERSION, Perl $], $^X" );

my $thread = Net::Disqus::Author -> new ( id => 10110,
                                    forum => 'myforum',
                                    slug => 'myslug',
                                    title => 'mytitle',
                                    created_at => 'DATETIME',
                                    allow_comments => 0,
                                    url => 'myurl',
                                    identifier => 'myidentifier'
                                  );

# test obj type
isa_ok ( $thread, 'Net::Disqus::Author' );
