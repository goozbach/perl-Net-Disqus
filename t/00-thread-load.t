#!perl -T

use Test::More tests => 18;

BEGIN {
	use_ok( 'Net::Disqus::Thread' );
}

diag( "Testing Net::Disqus::Thread $Net::Disqus::Thread::VERSION, Perl $], $^X" );

my $obj = Net::Disqus::Thread -> new ( id => 10110,
                                    forum => 'myforum',
                                    slug => 'myslug',
                                    title => 'mytitle',
                                    created_at => 'DATETIME',
                                    allow_comments => 0,
                                    url => 'myurl',
                                    identifier => 'myidentifier'
                                  );

# test obj type
isa_ok ( $obj, 'Net::Disqus::Thread' );
# test obj methods (read)
is ( $obj->id(), 10110, 'ID method returns value properly');
is ( $obj->forum(), 'myforum', 'Forum method returns value properly');
is ( $obj->slug(), 'myslug', 'Slug method returns value properly');
is ( $obj->title(), 'mytitle', 'Title method returns value properly');
is ( $obj->created_at(), 'DATETIME', 'Created At method returns value properly');
is ( $obj->allow_comments(), 0, 'Allow Comments method returns value properly');
is ( $obj->url(), 'myurl', 'URL method returns value properly');
is ( $obj->identifier(), 'myidentifier', 'Identifier method returns value properly');

# test object methods (write)
$obj->id(12345);
$obj->forum('newforum');
$obj->slug('newslug');
$obj->title('newtitle');
$obj->created_at('newtime');
$obj->allow_comments(1);
$obj->url('newurl');
$obj->identifier('newidentifier');
is ( $obj->id(), 12345, 'ID method sets and reads properly');
is ( $obj->forum(), 'newforum', 'Forum method sets and reads properly');
is ( $obj->slug(), 'newslug', 'Slug method sets and reads properly');
is ( $obj->title(), 'newtitle', 'Title method sets and reads properly');
is ( $obj->created_at(), 'newtime', 'Created At method sets and reads properly');
is ( $obj->allow_comments(), 1, 'Allow Comments method sets and reads properly');
is ( $obj->url(), 'newurl', 'URL method sets and reads properly');
is ( $obj->identifier(), 'newidentifier', 'Identifier method sets and reads properly');
