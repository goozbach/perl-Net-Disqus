package Net::Disqus::Forum;

use warnings;
use strict;

=head1 NAME

Net::Disqus::Forum - The OOP object for Net::Disqus Forum objects.

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';


=head1 SYNOPSIS

    use Net::Disqus::Forum;

    my $foo = Net::Disqus::Forum->new(
        id        => 12121,
        shortname => 'dood-forum',
        name      => 'Dood\'s Forum',
       );



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

  A unique alphanumeric string identifying this Forum object.

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

  The unique string used in disqus.com URLs relating to this forum. For example, if the shortname is "bmb", the forum's community page is at http://bmb.disqus.com/.

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

  A string for displaying the forum's full title, like "The Eyeball Kid's Blog". 

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

=item * the GNU General Public License as published by the Free Software Foundation; either version 1, or (at your option) any later version, or

=item * the Artistic License version 2.0.

=back

=cut

1; # End of Net::Disqus::Forum
