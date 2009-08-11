#!perl -T

use Test::More tests => 14;

BEGIN {
	use_ok( 'Net::Disqus::Author' );
}

diag( "Testing Net::Disqus::Author $Net::Disqus::Author::VERSION, Perl $], $^X" );

my $obj = Net::Disqus::Author -> new ( id => 10110,
                                    username => 'myusername',
                                    display_name => 'My Username',
                                    url => 'http://www.example.com/~user/',
                                    email_hash => 'NzMwNmEyMWQ4ZTliZGFlNjQyYWE1NzYwNmQ4MzkzZjQgIC0K',
                                    has_avatar => 0,
                                  );

# test obj type
isa_ok ( $obj, 'Net::Disqus::Author' );

# test each attribute is fetchable from a built object.
is ( $obj->id(), 10110, 'id method returns value properly');
is ( $obj->username(), 'myusername', 'username method returns value properly');
is ( $obj->display_name(), 'My Username', 'display_name method returns value properly');
is ( $obj->url(), 'http://www.example.com/~user/', 'url method returns value properly');
is ( $obj->email_hash(), 'NzMwNmEyMWQ4ZTliZGFlNjQyYWE1NzYwNmQ4MzkzZjQgIC0K', 'email_hash  method returns value properly');
is ( $obj->has_avatar(), 0, 'has_avatar method returns value properly');

# reset each attribute and check again.
$obj->id(1111);
$obj->username('newname');
$obj->display_name('New Name');
$obj->url('http://www.example.com/~newuser/');
$obj->email_hash('4ZTliZGFlNjQyYWE1NzYwN');
$obj->has_avatar(1);

is ( $obj->id(), 1111, 'id method sets value properly');
is ( $obj->username(), 'newname', 'username method sets value properly');
is ( $obj->display_name(), 'New Name', 'display_name method sets value properly');
is ( $obj->url(), 'http://www.example.com/~newuser/', 'url method sets value properly');
is ( $obj->email_hash(), '4ZTliZGFlNjQyYWE1NzYwN', 'email_hash  method sets value properly');
is ( $obj->has_avatar(), 1, 'has_avatar method sets value properly');
