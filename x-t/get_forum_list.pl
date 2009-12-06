#!/usr/bin/perl 
#===============================================================================
#
#         FILE:  get_forum_list.pl
#
#        USAGE:  ./get_forum_list.pl  user_key forum_key forum_id thread_id
#
#  DESCRIPTION:  A test script to get the forum list from disqus
#
#      OPTIONS:  ---
# REQUIREMENTS:  ---
#         BUGS:  ---
#        NOTES:  ---
#       AUTHOR:  Derek Carter(), 
#      COMPANY:  
#      VERSION:  0.1
#      CREATED:  08/31/2009 09:16:57 PM
#     REVISION:  001
#===============================================================================

use strict;
use warnings;
use lib qw( ../lib/ lib/ );
use Net::Disqus;

use Data::Dumper;

my $user_key = $ARGV[0];
my $forum_key = $ARGV[1];
my $forum_id = $ARGV[2];
my $thread_id = $ARGV[3];


my $main_obj = Net::Disqus->new( 
  config_file => 'sample.config',
);

print Dumper $main_obj;

print "this is the forum list:\n";

my @forum_list = $main_obj->get_forum_list();

#print $$forum_list{'message'};
my $forum_count = scalar @forum_list;
print "$forum_count\n";

my $forum_api_key = $main_obj->get_forum_api_key($forum_id);

print "$forum_api_key \n";


my @thread_list = $main_obj->get_thread_list($forum_key);

print Dumper @thread_list;

my $num_posts = $main_obj->get_num_posts($thread_id);
