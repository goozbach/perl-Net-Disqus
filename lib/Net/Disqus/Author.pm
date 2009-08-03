package Net::Disqus::Author;

use warnings;
use strict;

=head1 NAME

Net::Disqus::Author - The great new Net::Disqus::Author!

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';


=head1 SYNOPSIS

Quick summary of what the module does.

Perhaps a little code snippet.

    use Net::Disqus::Author;

    my $foo = Net::Disqus::Author->new();
    ...

=head1 FUNCTIONS

=head2 new
Create a new Net::Disqus::Author object

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

Author ID

=cut
sub id {
        my $self = shift;
        if (@_) {
        $self->{'id'}= shift;
        }
        return $self->{'id'};
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
