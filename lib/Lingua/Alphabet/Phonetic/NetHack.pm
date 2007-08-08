
# $Id: NetHack.pm,v 1.3 2007/08/08 12:56:18 Daddy Exp $

=head1 NAME

Lingua::Alphabet::Phonetic::NetHack - map ASCII characters to names of NetHack items

=head1 SYNOPSIS

This is a specialization of Lingua::Alphabet::Phonetic.
You should not use this module directly;
all interaction should be done with an object of type Lingua::Alphabet::Phonetic.

  my $oSpeaker = new Lingua::Alphabet::Phonetic('NetHack');

=head1 NOTES

The only characters without NetHack names are comma and digits 1 through 9!

=head1 SEE ALSO

http://www.nethack.org

=head1 BUGS

Please tell the author if you find any!

=head1 AUTHOR

Martin Thurn (mthurn@cpan.org).

=cut

#####################################################################

package Lingua::Alphabet::Phonetic::NetHack;

use strict;

use base 'Lingua::Alphabet::Phonetic';
our
$VERSION = sprintf("%d.%02d", q$Revision: 1.3 $ =~ /(\d+)\.(\d+)/o);

# First, the punctuation:
my %hash = (
            ' ' => 'ghost',
            '!' => 'potion',
            '"' => 'amulet',
            '#' => 'corridor',
            '$' => 'gold',
            '%' => 'food',
            '&' => 'demon',
            "'" => 'golem',
            '(' => 'tool',
            ')' => 'weapon',
            '*' => 'gem',
            '+' => 'door',
            # ',' => 'unused',
            '-' => 'wall',
            '.' => 'floor',
            '/' => 'wand',
            '0' => 'iron ball',
            # 1-9 here
            ':' => 'lizard',
            ';' => 'eel',
            '<' => 'staircase up',
            '=' => 'ring',
            '>' => 'staircase down',
            '?' => 'scroll',
            '@' => 'human',
            # A-Z here
            '[' => 'armor',
            '\\' => 'throne',
            ']' => 'mimic',
            '^' => 'trap',
            '_' => 'altar',
            '`' => 'boulder',
            # a-z here
            '{' => 'fountain',
            '|' => 'grave',
            '}' => 'pool',
            '~' => 'tail',
           );

my @asLowercase = (
                   "ant",
                   "blob",
                   "cockatrice",
                   "dog",
                   "eye",
                   "cat",
                   "gremlin",
                   "humanoid",
                   "imp",
                   "jelly",
                   "kobold",
                   "leprechaun",
                   "mimic",
                   "nymph",
                   "orc",
                   "piercer",
                   "quadruped",
                   "rodent",
                   "spider",
                   "trapper",
                   "unicorn",
                   "vortex",
                   "worm",
                   "xan",
                   "light",
                   "zruty",
                  );
my @asUppercase = (
                   "angel",
                   "bat",
                   "centaur",
                   "dragon",
                   "elemental",
                   "fungus",
                   "gnome",
                   "giant",
                   "invisible monster",
                   "jabberwock",
                   "Kop",
                   "lich",
                   "mummy",
                   "naga",
                   "ogre",
                   "pudding",
                   "quantum mechanic",
                   "rust monster",
                   "snake",
                   "troll",
                   "umber hulk",
                   "vampire",
                   "wraith",
                   "xorn",
                   "ape",
                   "zombie",
                  );
map { $hash{$_} = shift @asLowercase } ('a'..'z');
map { $hash{$_} = shift @asUppercase } ('A'..'Z');
# Special cases / recover lost entries:

sub _name_of_letter
  {
  my $self = shift;
  my $s = shift;
  # print STDERR " + L::A::P::NetHack::_name_of_letter($s)\n";
  # If we get more than one character, ignore the rest:
  my $c = substr($s, 0, 1);
  if (exists($hash{$c}))
    {
    return $hash{$c};
    } # if
  return $self->SUPER::_name_of_letter($s);
  } # _name_of_letter

1;

__END__

