# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl 1.t'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';

use Test;
BEGIN { plan tests => 2 };
use Template;

#########################

# Insert your test code below, the Test::More module is use()ed here so read
# its man page ( perldoc Test::More ) for help writing this test script.

my $t = <<END;
[%- USE song = AudioFile.Info(file) -%]
Title:  [% song.title %]
Artist: [% song.artist %]
Album:  [% song.album %] (track [% song.track %])
Year:   [% song.year %]
Genre:  [% song.genre %]
END

my $out = <<END;
Title:  test
Artist: davorg
Album:  none (track 0)
Year:   2003
Genre:  nonsense
END

my $tt = Template->new;

foreach (qw/mp3 ogg/) {
  my $result;
  $tt->process(\$t, { file => "t/test.$_" }, \$result)
    or die $tt->error;
  ok($result eq $out);
}
