#!perl -T

use Test::More tests => 18;

BEGIN {
	use_ok( 'Net::Disqus::Thread' );
}

diag( "Testing Net::Disqus::Thread $Net::Disqus::Thread::VERSION, Perl $], $^X" );

my $thread = Net::Disqus::Thread -> new ( id => 10110,
                                    forum => 'myforum',
                                    slug => 'myslug',
                                    title => 'mytitle',
                                    created_at => 'DATETIME',
                                    allow_comments => 0,
                                    url => 'myurl',
                                    identifier => 'myidentifier'
                                  );

# test obj type
isa_ok ( $thread, 'Net::Disqus::Thread' );
# test obj methods (read)
is ( $thread->id(), 10110, 'ID method returns value properly');
is ( $thread->forum(), 'myforum', 'Forum method returns value properly');
is ( $thread->slug(), 'myslug', 'Slug method returns value properly');
is ( $thread->title(), 'mytitle', 'Title method returns value properly');
is ( $thread->created_at(), 'DATETIME', 'Created At method returns value properly');
is ( $thread->allow_comments(), 0, 'Allow Comments method returns value properly');
is ( $thread->url(), 'myurl', 'URL method returns value properly');
is ( $thread->identifier(), 'myidentifier', 'Identifier method returns value properly');

# test object methods (write)
$thread->id(12345);
$thread->forum('newforum');
$thread->slug('newslug');
$thread->title('newtitle');
$thread->created_at('newtime');
$thread->allow_comments(1);
$thread->url('newurl');
$thread->identifier('newidentifier');
is ( $thread->id(), 12345, 'ID method sets and reads properly');
is ( $thread->forum(), 'newforum', 'Forum method sets and reads properly');
is ( $thread->slug(), 'newslug', 'Slug method sets and reads properly');
is ( $thread->title(), 'newtitle', 'Title method sets and reads properly');
is ( $thread->created_at(), 'newtime', 'Created At method sets and reads properly');
is ( $thread->allow_comments(), 1, 'Allow Comments method sets and reads properly');
is ( $thread->url(), 'newurl', 'URL method sets and reads properly');
is ( $thread->identifier(), 'newidentifier', 'Identifier method sets and reads properly');
