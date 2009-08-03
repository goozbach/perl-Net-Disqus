#!perl -T

use Test::More tests => 8;

BEGIN {
	use_ok( 'Net::Disqus::Forum' );
}

diag( "Testing Net::Disqus::Forum $Net::Disqus::Forum::VERSION, Perl $], $^X" );

my $forum = Net::Disqus::Forum -> new ( id => 10110, shortname => 'myshortname', name => 'myname');

# test obj type
isa_ok ( $forum, 'Net::Disqus::Forum' );
# test obj methods (read)
is ( $forum->id(), 10110, 'ID method returns value properly');
is ( $forum->shortname(), 'myshortname', 'Shortname method returns value properly');
is ( $forum->name(), 'myname', 'Name method returns value properly');

# test object methods (write)
$forum->id(12345);
$forum->shortname('newshortname');
$forum->name('newname');
is ( $forum->id(), 12345, 'ID method sets and reads properly');
is ( $forum->shortname(), 'newshortname', 'Shortname method sets and reads properly');
is ( $forum->name(), 'newname', 'Name method sets and reads properly');
