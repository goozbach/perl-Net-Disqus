use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'Net::Disqus',
    AUTHOR              => 'Derek Carter <goozbach@friocorte.com>',
    VERSION_FROM        => 'lib/Net/Disqus.pm',
    ABSTRACT_FROM       => 'lib/Net/Disqus.pm',
    ($ExtUtils::MakeMaker::VERSION >= 6.3002
      ? ('LICENSE'=> 'perl')
      : ()),
    PL_FILES            => {},
    PREREQ_PM => {
        'Test::More' => 0,
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'Net-Disqus-*' },
);
