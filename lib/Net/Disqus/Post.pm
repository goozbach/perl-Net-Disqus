package Net::Disqus::Post;

use warnings;
use strict;

=head1 NAME

Net::Disqus::Post - The OOP object for Net::Disqus Post objects.

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';


=head1 SYNOPSIS

    use Net::Disqus::Post;

    my $foo = Net::Disqus::Post->new(
        id                => 10110,
        forum             => 1213125,
        thread            => 123213234,
        created_at        => '1990-01-01T14:31',
        message           => 'first post',
        parent_post       => 10100,
        shown             => 1,
        is_anonymous      => false,
        anonymous_author  => Net::Disqus::Author object,
        author            => Net::Disqus::Author object,
       )


=head1 FUNCTIONS

=head2 new

Create a new Net::Disqus::Author object

=cut

sub new {
  my $invoker = shift;
  my $class = ref($invoker) || $invoker;
  my $self = {
        # attributes go here
        id                => 10110,
        forum             => 1213125,
        thread            => 123213234,
        created_at        => '1990-01-01T14:31',
        message           => 'first post',
        parent_post       => 10100,
        shown             => 1,
        is_anonymous      => false,
        anonymous_author  => '',
        author            => '',
        @_, # override attributes
  };
  bless $self, $class;
  return $self;
}

=head1 ATTRIBUTES

Base attributes

=head2 id

a unique alphanumeric string identifying this Post object.

=cut
sub id {
        my $self = shift;
        if (@_) {
        $self->{'id'}= shift;
        }
        return $self->{'id'};
}

=head2 forum

the id for the forum this post belongs to.

=cut
sub forum {
        my $self = shift;
        if (@_) {
        $self->{'forum'}= shift;
        }
        return $self->{'forum'};
}

=head2 thread

the id for the thread this post belongs to.

=cut
sub thread {
        my $self = shift;
        if (@_) {
        $self->{'thread'}= shift;
        }
        return $self->{'thread'};
}

=head2 created_at

the UTC date this post was created, in the format %Y-%m-%dT%H:%M.

=cut
sub created_at {
        my $self = shift;
        if (@_) {
        $self->{'created_at'}= shift;
        }
        return $self->{'created_at'};
}

=head2 message

the contents of the post, such as "First post".

=cut
sub message {
        my $self = shift;
        if (@_) {
        $self->{'message'}= shift;
        }
        return $self->{'message'};
}

=head2 parent_post

the id of the parent post, if any

=cut
sub parent_post {
        my $self = shift;
        if (@_) {
        $self->{'parent_post'}= shift;
        }
        return $self->{'parent_post'};
}

=head2 shown

whether the post is currently visible or not.

=cut
sub shown {
        my $self = shift;
        if (@_) {
        $self->{'shown'}= shift;
        }
        return $self->{'shown'};
}

=head2 is_anonymous

whether the comment was left anonymously, as opposed to a registered Disqus account. 

=cut
sub is_anonymous {
        my $self = shift;
        if (@_) {
        $self->{'is_anonymous'}= shift;
        }
        return $self->{'is_anonymous'};
}

=head2 anonymous_author

present only when is_anonymous is true. A L<Net::Disqus::Author> object.
 
=cut
sub anonymous_author {
        my $self = shift;
        if (@_) {
        $self->{'anonymous_author'}= shift;
        }
        return $self->{'anonymous_author'};
}

=head2 author

present only when is_anonymous is false. A L<Net::Disqus::Author> object.

=cut
sub author {
        my $self = shift;
        if (@_) {
        $self->{'author'}= shift;
        }
        return $self->{'author'};
}

=head1 AUTHOR

Derek Carter, C<< <goozbach at friocorte.com> >>

=head1 BUGS

Please report any bugs or feature requests through L<http://github.com/goozbach/perl-Net-Disqus/issues>.
I will be notified, and then you'll automatically be notified of progress on your bug as I make changes.


=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Net::Disqus::Post


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

1; # End of Net::Disqus::Post
