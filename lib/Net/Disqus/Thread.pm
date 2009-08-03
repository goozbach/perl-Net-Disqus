package Net::Disqus::Thread;

use warnings;
use strict;

=head1 NAME

Net::Disqus::Thread - The great new Net::Disqus::Thread!

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';


=head1 SYNOPSIS

Quick summary of what the module does.

Perhaps a little code snippet.

    use Net::Disqus::Thread;

    my $foo = Net::Disqus::Thread->new();
    ...

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

Thread ID

=cut
sub id {
        my $self = shift;
        if (@_) {
        $self->{'id'}= shift;
        }
        return $self->{'id'};
}

=head2 forum

Thread Forum

=cut
sub forum {
        my $self = shift;
        if (@_) {
        $self->{'forum'}= shift;
        }
        return $self->{'forum'};
}

=head2 slug

Thread Slug

=cut
sub slug {
        my $self = shift;
        if (@_) {
        $self->{'slug'}= shift;
        }
        return $self->{'slug'};
}

=head2 title

Thread Title

=cut
sub title {
        my $self = shift;
        if (@_) {
        $self->{'title'}= shift;
        }
        return $self->{'title'};
}

=head2 created_at

Thread Created at Timestamp

=cut
sub created_at {
        my $self = shift;
        if (@_) {
        $self->{'created_at'}= shift;
        }
        return $self->{'created_at'};
}

=head2 allow_comments

Does the Thread Allow Comments

=cut
sub allow_comments {
        my $self = shift;
        if (@_) {
        $self->{'allow_comments'}= shift;
        }
        return $self->{'allow_comments'};
}

=head2 url

Thread URL

=cut
sub url {
        my $self = shift;
        if (@_) {
        $self->{'url'}= shift;
        }
        return $self->{'url'};
}

=head2 identifier

Thread Identifier

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

=item * the GNU General Public License as published by the Free
Software Foundation; either version 1, or (at your option) any
later version, or

=item * the Artistic License version 2.0.

=back

=cut

1; # End of Net::Disqus::Thread
