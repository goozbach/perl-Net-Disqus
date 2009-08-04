package Net::Disqus::Author;

use warnings;
use strict;

=head1 NAME

Net::Disqus::Author - The OOP object for Net::Disqus Author objects.

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';


=head1 SYNOPSIS


    use Net::Disqus::Author;

    my $foo = Net::Disqus::Author->new(
        id              => 11011,
        username        => 'joeuser',
        display_name    => 'Joe User',
        url             => 'http://example.com',
        email_hash      => 'sdfsklj2341234lk1',
        has_avatar      => 0,
       );

=head1 FUNCTIONS

=head2 new
Create a new Net::Disqus::Author object

=cut

sub new {
  my $invoker = shift;
  my $class = ref($invoker) || $invoker;
  my $self = {
        # attributes go here
        id              => 11011,
        username        => 'joeuser',
        display_name    => 'Joe User',
        url             => 'http://example.com',
        email_hash      => 'sdfsklj2341234lk1',
        has_avatar      => 0,
        @_, # override attributes
  };
  bless $self, $class;
  return $self;
}

=head1 ATTRIBUTES

Base attributes

=head2 id

  the unique id of the commenter's Disqus account

=cut
sub id {
        my $self = shift;
        if (@_) {
        $self->{'id'}= shift;
        }
        return $self->{'id'};
}

=head2 username

  the author's username

=cut
sub id {
        my $self = shift;
        if (@_) {
        $self->{'username'}= shift;
        }
        return $self->{'username'};
}

=head2 display_name

  the author's full name, if provided

=cut
sub id {
        my $self = shift;
        if (@_) {
        $self->{'display_name'}= shift;
        }
        return $self->{'display_name'};
}

=head2 url

  their optionally provided homepage

=cut
sub id {
        my $self = shift;
        if (@_) {
        $self->{'url'}= shift;
        }
        return $self->{'url'};
}

=head2 email_hash

  md5 of the author's email address

=cut
sub id {
        my $self = shift;
        if (@_) {
        $self->{'email_hash'}= shift;
        }
        return $self->{'email_hash'};
}

=head2 has_avatar

  whether the user has an avatar on disqus.com 

=cut
sub id {
        my $self = shift;
        if (@_) {
        $self->{'has_avatar'}= shift;
        }
        return $self->{'has_avatar'};
}


=head1 AUTHOR

Derek Carter, C<< <goozbach at friocorte.com> >>

=head1 BUGS

Please report any bugs or feature requests through L<http://github.com/goozbach/perl-Net-Disqus/issues>
I will be notified, and then you'll automatically be notified of progress on your bug as I make changes.


=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Net::Disqus::Author

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

1; # End of Disqus::Author
