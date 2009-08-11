#!perl -T

use Test::More tests => 8;

BEGIN {
	use_ok( 'Net::Disqus::Forum' );
}

diag( "Testing Net::Disqus::Forum $Net::Disqus::Forum::VERSION, Perl $], $^X" );

my $obj = Net::Disqus::Forum -> new (
                          id => 10110,
                          shortname => 'myshortname',
                          name => 'myname'
                         );

# test obj type
isa_ok ( $obj, 'Net::Disqus::Forum' );

# test each attribute is fetchable from a built object.
is ( $obj->id(), 10110, 'ID method returns value properly');
is ( $obj->shortname(), 'myshortname', 'Shortname method returns value properly');
is ( $obj->name(), 'myname', 'Name method returns value properly');

# reset each attribute and check again.
$obj->id(12345);
$obj->shortname('newshortname');
$obj->name('newname');
is ( $obj->id(), 12345, 'ID method sets and reads properly');
is ( $obj->shortname(), 'newshortname', 'Shortname method sets and reads properly');
is ( $obj->name(), 'newname', 'Name method sets and reads properly');
