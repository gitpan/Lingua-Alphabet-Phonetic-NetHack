
# $Id: Makefile.PL,v 1.4 2008/03/06 04:02:43 Daddy Exp $

use inc::Module::Install;

name('Lingua-Alphabet-Phonetic-NetHack');
version_from('lib/Lingua/Alphabet/Phonetic/NetHack.pm');
author('Martin Thurn <mthurn@cpan.org>');
license('perl');
requires( perl => '5.004' );

requires('Lingua::Alphabet::Phonetic');
# Test::More is only needed for `make test`:
test_requires('Test::More');
test_requires('Test::Pod');
test_requires('Test::Pod::Coverage');
# I think there's a bug in Module::CoreList or something, because this
# comes up missing on some platforms:
test_requires('Test::Simple');

WriteAll;

__END__