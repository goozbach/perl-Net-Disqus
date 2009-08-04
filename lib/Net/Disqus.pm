package Net::Disqus;

use warnings;
use strict;

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


=head1 API method Functions

=head2 C<create_post>

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

=head2 C<get_forum_list>

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

}

=head2 C<get_forum_api_key>

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

}

=head2 C<get_thread_list>

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

}

=head2 C<get_num_posts>

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

=head2 C<get_thread_by_url>

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

=head2 C<get_thread_posts>

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

=head2 C<thread_by_identifier>

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

=head2 C<update_thread>

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

=item * the GNU General Public License as published by the Free
Software Foundation; either version 1, or (at your option) any
later version, or

=item * the Artistic License version 2.0.

=back

=cut

1; # End of Net::Disqus
