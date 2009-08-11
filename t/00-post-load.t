#!perl -T

use Test::More tests => 21;

BEGIN {
	use_ok( 'Net::Disqus::Post' );
	use_ok( 'Net::Disqus::Author' );
}

diag( "Testing Net::Disqus::Post $Net::Disqus::Post, Perl $], $^X" );

my $user = Net::Disqus::Author -> new ( id => 10110,
                                    username => 'myusername',
                                    display_name => 'My Username',
                                    url => 'http://www.example.com/~user/',
                                    email_hash => 'NzMwNmEyMWQ4ZTliZGFlNjQyYWE1NzYwNmQ4MzkzZjQgIC0K',
                                    has_avatar => 0,
                                  );

my $obj = Net::Disqus::Post -> new ( id                => 10110,
                                     forum             => 1213125,
                                     thread            => 123213234,
                                     created_at        => '1990-01-01T14:31',
                                     message           => 'first post',
                                     parent_post       => 10100,
                                     shown             => 1,
                                     is_anonymous      => 0,
                                     anonymous_author  => $user,
                                     author            => $user,
                                  );

# test obj type
isa_ok ( $obj, 'Net::Disqus::Post' );

# test each attribute is fetchable from a built object.
is ( $obj->id(), 10110, 'id method returns value properly');
is ( $obj->forum(), 1213125, 'forum method returns value properly');
is ( $obj->thread(), 123213234, ' thread  method returns value properly');
is ( $obj->created_at(), '1990-01-01T14:31', 'created_at method returns value properly');
is ( $obj->message(), 'first post', 'message method returns value properly');
is ( $obj->parent_post(), 10100, 'parent_post method returns value properly');
is ( $obj->shown(), 1, 'shown method returns value properly');
is ( $obj->is_anonymous(), 0, 'is_anonymous method returns value properly');
isa_ok ( $obj->anonymous_author(), 'Net::Disqus::Author');
isa_ok ( $obj->author(), 'Net::Disqus::Author');

# reset each attribute and check again.
$obj->id(2222);
$obj->forum(22342);
$obj->thread(23413214);
$obj->created_at('1970-01-01T14:31');
$obj->message('second post');
$obj->parent_post(12345);
$obj->shown(0);
$obj->is_anonymous(1);

is ( $obj->id(), 2222, 'id method sets value properly');
is ( $obj->forum(), 22342, 'forum method sets value properly');
is ( $obj->thread(), 23413214, ' thread  method sets value properly');
is ( $obj->created_at(), '1970-01-01T14:31', 'created_at method sets value properly');
is ( $obj->message(), 'second post', 'message method sets value properly');
is ( $obj->parent_post(), 12345, 'parent_post method sets value properly');
is ( $obj->shown(), 0, 'shown method sets value properly');
is ( $obj->is_anonymous(), 1, 'is_anonymous method sets value properly');
