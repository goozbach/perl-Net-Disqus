package Net::Disqus::Forum;

use warnings;
use strict;

=head1 NAME

Net::Disqus::Forum - The great new Net::Disqus::Forum!

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';


=head1 SYNOPSIS

Quick summary of what the module does.

Perhaps a little code snippet.

    use Net::Disqus::Forum;

    my $foo = Net::Disqus::Forum->new();
    ...

=head1 Data Model

There are four types of Disqus objects that the API provides access to:
They map to the following Perl objects.

posts -- Net::Disqus::Post
threads -- Net::Disqus::Thread
forums -- Net::Disqus::Forum
author -- Net::Disqus::Autor

A post is any comment written by a Disqus user.

Each post belongs to a thread, which represents a particular
topic of conversation.

Each thread belongs to a forum.
A forum represents a website that is using Disqus. For example, your
blog might constitute a single forum, and each blog post would have its
own thread.


=head1 FUNCTIONS

=head2 new
Create a new Net::Disqus::Forum object

=cut

sub new {
  my $invoker = shift;
  my $class = ref($invoker) || $invoker;
  my $self = {
        # attributes go here
        id            => 0,
        shortname     => 'shortname',
        name          => 'name',
        @_, # override attributes
  };
  bless $self, $class;
  return $self;
}

=head1 ATTRIBUTES

Basic attrubutes. Each has a corresponding update function.

=head2 id

Forum ID

=cut
sub id {
        my $self = shift;
        if (@_) {
          # TODO -- create ID validation logic
          $self->{'id'}= shift;
        }
        return $self->{'id'};
}

=head2 shortname

Forum shortname

=cut
sub shortname {
        my $self = shift;
        if (@_) {
          # TODO -- create shortname validation logic
          $self->{'shortname'}= shift;
        }
        return $self->{'shortname'};
}

=head2 name

Forum name

=cut
sub name {
        my $self = shift;
        if (@_) {
          #TODO -- Create Name valication logic.
          $self->{'name'}= shift;
        }
        return $self->{'name'};
}

=head1 AUTHOR

Derek Carter, C<< <goozbach at friocorte.com> >>

=head1 BUGS

Please report any bugs or feature requests through L<http://github.com/goozbach/perl-Net-Disqus/issues>
I will be notified, and then you'll automatically be notified of progress on your bug as I make changes.



=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Net::Disqus::Forum

You can also look for information at:

=over 4

=item * The GIThub page for this module

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

1; # End of Net::Disqus::Forum
