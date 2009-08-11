package Net::Disqus::Thread;

use warnings;
use strict;

=head1 NAME

Net::Disqus::Thread - The OOP object for Net::Disqus Thread Objects

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';


=head1 SYNOPSIS

    use Net::Disqus::Thread;

    my $foo = Net::Disqus::Thread->new(
        id              => 101001,
        forum           => 2342443,
        slug            => 'this is a thread slug',
        title           => 'The Thread!',
        created_at      => '1990-01-01T14:31',
        allow_comments  => 1,
        url             => 'http://www.example.com/the_thread',
        identifier      => 'my_the-thread_id',
    );


=head1 FUNCTIONS

=head2 new

Create a new Net::Disqus::Thread object

=cut

sub new {
  my $invoker = shift;
  my $class = ref($invoker) || $invoker;
  my $self = {
        # attributes go here
        id              => 0,
        forum           => 0,
        slug            => 'forum_slug',
        title           => 'forum_title',
        created_at      => 'DATESTAMP',
        allow_comments  => 1,
        url             => 'http://example.com',
        identifier      => 'forum_identifier',
        @_, # override attributes
  };
  bless $self, $class;
  return $self;
}

=head1 ATTRIBUTES

Base attrubutes, can be extended

=head2 id

  a unique alphanumeric string identifying this Thread object.

=cut
sub id {
        my $self = shift;
        if (@_) {
        $self->{'id'}= shift;
        }
        return $self->{'id'};
}

=head2 forum

  The id for the forum this thread belongs to.

=cut
sub forum {
        my $self = shift;
        if (@_) {
        $self->{'forum'}= shift;
        }
        return $self->{'forum'};
}

=head2 slug

  The per-forum-unique string used for identifying this thread in disqus.com URLs relating to this thread. Composed of underscore-separated alphanumeric strings.

=cut
sub slug {
        my $self = shift;
        if (@_) {
        $self->{'slug'}= shift;
        }
        return $self->{'slug'};
}

=head2 title

  The title of the thread.

=cut
sub title {
        my $self = shift;
        if (@_) {
        $self->{'title'}= shift;
        }
        return $self->{'title'};
}

=head2 created_at

  The UTC date this thread was created, in the format %Y-%m-%dT%H:%M.

=cut
sub created_at {
        my $self = shift;
        if (@_) {
        $self->{'created_at'}= shift;
        }
        return $self->{'created_at'};
}

=head2 allow_comments

  Whether this thread is open to new comments.

=cut
sub allow_comments {
        my $self = shift;
        if (@_) {
        $self->{'allow_comments'}= shift;
        }
        return $self->{'allow_comments'};
}

=head2 url

  The URL this thread is on, if known.

=cut
sub url {
        my $self = shift;
        if (@_) {
        $self->{'url'}= shift;
        }
        return $self->{'url'};
}

=head2 identifier

  The user-provided identifier for this thread, as in thread_by_identifier above (if available) 

=cut
sub identifier {
        my $self = shift;
        if (@_) {
        $self->{'identifier'}= shift;
        }
        return $self->{'identifier'};
}

=head1 AUTHOR

Derek Carter, C<< <goozbach at friocorte.com> >>

=head1 BUGS

Please report any bugs or feature requests through L<http://github.com/goozbach/perl-Net-Disqus/issues>.
I will be notified, and then you'll automatically be notified of progress on your bug as I make changes.


=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Net::Disqus::Thread


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

1; # End of Net::Disqus::Thread
