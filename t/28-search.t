use strict;
use warnings;
use Test::RequiresInternet 'test.wikipedia.org' => 80;
use Test::More tests => 3;

use MediaWiki::Bot;
my $t = __FILE__;

my $bot = MediaWiki::Bot->new({
    agent   => "MediaWiki::Bot tests (https://metacpan.org/MediaWiki::Bot; $t)",
    host    => 'test.wikipedia.org',
});

my @pages = $bot->search('Main Page');
isa_ok(\@pages, 'ARRAY', 'Right return type');
is($pages[0], 'Main Page', 'Found [[Main Page]]');

@pages = $bot->search('62c77d65adf258464e0f0820696b871251c21eb4');
is scalar @pages, 0, 'No results found for a nonsensical search'
    or diag explain \@pages;
