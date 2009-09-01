package Net::Disqus;

use warnings;
use strict;

## imports
use HTTP::Request::Common;
use LWP::UserAgent;
use Carp;
use JSON::Any;
use Config::Simple;

## Disqus imports
use Net::Disqus::Author;
use Net::Disqus::Thread;
use Net::Disqus::Forum;
use Net::Disqus::Post;

## Debug imports
use Data::Dumper;

## globals
my $APIurl = 'http://disqus.com/api/';
my $ua = LWP::UserAgent->new;
my $user_api_key; #TODO get from config::simple?
my $forum_api_key; #TODO get from config::simple?


## private subs
sub _GET_request($) {
  # this code returns the json object after a GET request
  my $url = shift;
  my $response_object;
  my $status;
  my $success;
  my $code;
  my $message;
  my $response = $ua->request(GET $url);
  if ($response->is_success) {
    $response_object = JSON::Any->from_json($response->content());
    $message = $response_object->{'message'};
    return $message;
  } else {
    $status = $response->status_line();
    $response = JSON::Any->jsonToObj($response->content());
    $success = eval ($$response{'succeeded'});
    $code = $$response{'code'};
    $message = $$response{'message'};
    croak "request failed: status=$status, code=$code, message=$message\n";
  }
}

sub _POST_request($$) {
  # this code returns the json object after a POST request
  my $url = shift;
  my $response_object;
  my $status;
  my $success;
  my $code;
  my $message;
  my $response = $ua->request(GET $url);
  if ($response->is_success) {
    $response_object = JSON::Any->from_json($response->content());
    $message = $$response_object->{'message'};
    return $message;
  } else {
    $status = $response->status_line();
    $response_object = JSON::Any->jsonToObj($response->content());
    $success = eval ($$response{'succeeded'});
    $code = $$response{'code'};
    $message = $$response{'message'};
    croak "request failed: status=$status, code=$code, message=$message\n";
  }
}

=head1 NAME

Net::Disqus - A OOP interface to the public Disqus API

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';


=head1 SYNOPSIS

This module is the OOP interface to the public Disqus API. It allows for easy access to post/forums/threads
that have been posted to Disqus.  I wrote it for the purposes of including the comments from disqus directly
into my website instead of loading them via JavaScript

=head1 USAGE

    use Net::Disqus;

    my $foo = Net::Disqus->new();

=head1 FUNCTIONS

=head2 new

Create a new Net::Disqus object

=cut

sub new {
  my $invoker = shift;
  my $class = ref($invoker) || $invoker;
  my $self = {
        # attributes go here
        user_api_key    => '',
        forum_api_key    => '',
        @_, # override attributes
  };
  bless $self, $class;
  return $self;
}

=head1 ATTRIBUTES

=head2 user_api_key

The key used to access the API

=cut

sub user_api_key {
        my $self = shift;
        if (@_) {
        $self->{'user_api_key'}= shift;
        }
        return $self->{'user_api_key'};
}

=head2 forum_api_key

The forum key used to access the API

=cut

sub forum_api_key {
        my $self = shift;
        if (@_) {
        $self->{'forum_api_key'}= shift;
        }
        return $self->{'forum_api_key'};
}

=head1 API METHODS

=head2 create_post

=over 2

=item * Method -- POST

=item * Key -- Forum Key

=back 

=head3 Arguments

=over 2

=item * Required

=over 4

=item * C<thread_id> -- The ID of the thread to create the post on.

=item * C<message> -- The message of the post.

=item * C<author_name> -- The creator's name.

=item * C<author_email> -- The creator's email address.

=back

=item * Optional

=over 4

=item * C<parent_post> -- The ID of the parent post, for threaded comments.

=item * C<created_at> -- The time the post was created. in format: %Y-%m-%dT%H:%M. If ommited the current time will be used

=item * C<author_url> -- The author's homepage

=item * C<ip_address> -- The author's IP address

=back

=back

=head3 Returns

On success, the L<Net::Disqus::Post> object just created.

=cut 
sub create_post {

}

=head2 get_forum_list

=over 2

=item * Method -- GET

=item * Key -- The user's C<user_api_key>

=back

=head3 Arguments

None

=head3 Returns

A list of L<Net::Disqus::Forum objects> the user owns.

=cut
sub get_forum_list {
  my $self = shift;
  my @int_list; # list of Net::Disqus::Forum objects to return
  # GET the api url
  my $api_method = 'get_forum_list';
  my $request_url = $APIurl .  $api_method . '/?user_api_key=' . $self->user_api_key();

  my $forum_array = _GET_request($request_url);
  foreach my $forum_tmp ( @$forum_array ) {
    my $shortname = $forum_tmp->{'shortname'};
    my $id = $forum_tmp->{'id'};
    my $created_at = $forum_tmp->{'created_at'};
    my $name = $forum_tmp->{'name'};
    my $forum_obj = Net::Disqus::Forum->new( 
                    created_at => $created_at,
                    shortname => $shortname,
                    name => $name,
                    id => $id,
                    );
    push @int_list, $forum_obj;
  }
  return @int_list;
}

=head2 get_forum_api_key

=over 2

=item * Method -- GET

=item * Key -- The user's C<user_api_key>

=back

=head3 Arguments

=over 2

=item * Required

=over 4

=item * C<forum_id> -- The ID of the forum being requested.

=back

=back

=head3 Returns

a string containing the forum key.

=cut
sub get_forum_api_key {
  my $self = shift;
  my $id = shift;
  # GET the api url
  my $api_method = 'get_forum_api_key';
  my $request_url = $APIurl .  $api_method . '/?user_api_key=' . $self->user_api_key() . '&forum_id=' . $id;
  my $forum_api_key = _GET_request($request_url);
  return $forum_api_key;
}

=head2 get_thread_list

=over 2

=item * Method -- GET

=item * Key -- Forum Key

=item * Key -- The user's C<user_api_key>

=back

=head3 Arguments

None

=head3 Returns

A list of L<Net::Disqus::Thread> objects belonging to the given forum.

=cut 
sub get_thread_list {
  my $self = shift;
  my @int_list; # list of Net::Disqus::Thread objects to return
  # GET the api url
  my $api_method = 'get_thread_list';
  my $request_url = $APIurl .  $api_method . '/?user_api_key=' . $self->user_api_key() . '&forum_api_key=' . $self->forum_api_key;

  my $thread_array = _GET_request($request_url);
  foreach my $thread_tmp ( @$thread_array ) {
    my $forum = $thread_tmp->{'forum'};
    my $created_at = $thread_tmp->{'created_at'};
    my $identifier = $thread_tmp->{'identifier'};
    my $url = $thread_tmp->{'url'};
    my $slug = $thread_tmp->{'slug'};
    my $id = $thread_tmp->{'id'};
    my $title = $thread_tmp->{'title'};
    my $allow_comments = eval { $thread_tmp->{'allow_comments'} };
    my $hidden = eval { $thread_tmp->{'hidden'} };
    my $forum_obj = Net::Disqus::Thread->new( 
                    forum => $forum,
                    created_at => $created_at,
                    identifier => $identifier,
                    url => $url,
                    slug => $slug,
                    id => $id,
                    title => $title,
                    allow_comments => $allow_comments,
                    hidden => $hidden,
                    );
    push @int_list, $forum_obj;
  }
  return @int_list;
}

=head2 get_num_posts

=over 2

=item * Method -- GET

=item * Key -- Forum Key

=item * Key -- The user's C<user_api_key>

=back

=head3 Arguments

=over 2

=item * Required

=over 4

=item * C<thread_ids> -- A comma delimited list of thread IDs belonging to the forum.

=back 

=back

=head3 Returns

An pseudo object mapping each C<thread_id> to two numbers: visible comments, total comments.

=cut
sub get_num_posts {

}

=head2 get_thread_by_url

=over 2

=item * Method -- GET

=item * Key -- Forum Key

=item * Key -- The user's C<user_api_key>

=back

=head3 Arguments

=over 2

=item * Required

=over 4

=item * C<url> -- The url to check for a thread. --TODO discover if URI encoded or not.

=back

=back

=head3 Returns

=over 2

=item * On Success -- A L<Net::Disqus::Thread> object.

=item * On Failure -- NULL

=back

=cut 
sub get_thread_by_url {

}

=head2 get_thread_posts

=over 2

=item * Method -- GET

=item * Key -- Forum Key

=item * Key -- The user's C<user_api_key>

=back

=head3 Arguments

=over 2

=item * Required

=over 4

=item * C<thread_id> -- The ID of the thread for which you are requesting the posts.

=back

=back

=head3 Returns

A list of L<Net::Disqus::Post> objects for the given thread/forum.

=cut
sub get_thread_posts {

}

=head2 thread_by_identifier

=over 2

=item * Method -- POST

=item * Key -- Forum Key

=item * Key -- The user's C<user_api_key>

=back

=head3 Arguments

=over 2

=item * Required

=over 4

=item * C<title> -- The title of the thread to possibly be created

=item * C<identifier> -- A string of your choosing

=back

=back

=head3 Returns

An pseudo object with two keys: 

=over 2

=item * C<thread> -- The Net::Disqus::Thread object corresponding to the identifier

=item * C<created> -- A boolean which indicates whether the thread was created as a result of this method call. If created, it will have the specified title.

=back

=cut
sub thread_by_identifier {

}

=head2 update_thread

=over 2

=item * Method -- POST

=item * Key -- Forum Key

=item * Key -- The user's C<user_api_key>

=back

=head3 Arguments

=over 2

=item * Required

=over 4

=item * C<thread_id> -- The title of the thread to possibly be created

=back

=item * Optional -- Any of:

=over 4

=item * C<title> -- update the title attribute of the thread

=item * C<slug> -- update the slug attribute of the thread

=item * C<url> -- update the url attribute of the thread

=item * C<allow_comments> -- update the allow_comments attribute of the thread

=back

=back 

=head1 AUTHOR

Derek Carter, C<< <goozbach at friocorte.com> >>

=head1 BUGS

Please report any bugs or feature requests through the web interface at L<http://github.com/goozbach/perl-Net-Disqus/issues>.
I will be notified, and then you'll automatically be notified of progress on your bug as I make changes.

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Net::Disqus


You can also look for information at:

=over 4


=item * GitHub main branch

L<http://github.com/goozbach/perl-Net-Disqus/tree/master>

=item * GitHub Issue Tracker

L<http://github.com/goozbach/perl-Net-Disqus/issues>

=item * GitHub Wiki

L<http://wiki.github.com/goozbach/perl-Net-Disqus>

=back


=head1 ACKNOWLEDGEMENTS


=head1 COPYRIGHT & LICENSE

Copyright 2009 Derek Carter, all rights reserved.

This program is free software; you can redistribute it and/or
modify it under the terms of either:

=over 4

=item * the GNU General Public License as published by the Free Software Foundation; either version 1, or (at your option) any later version, or

=item * the Artistic License version 2.0.

=back

=cut

1; # End of Net::Disqus
