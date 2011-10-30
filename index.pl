#!/usr/bin/perl 
#===============================================================================
#
#         FILE:  test.pl
#
#        USAGE:  ./test.pl
#
#  DESCRIPTION:
#
#      OPTIONS:  ---
# REQUIREMENTS:  ---
#         BUGS:  ---
#        NOTES:  ---
#       AUTHOR:   (), <>
#      COMPANY:
#      VERSION:  1.0
#      CREATED:  12/08/2007 08:30:54 PM MST
#     REVISION:  ---
#===============================================================================

use strict;
use warnings;
use HTML::Tidy;
use CGI;
use TekNap::Main;

my $q = CGI->new;
my $t = HTML::Tidy->new(
    {
        output_xhtml => 1,
        input_xml    => 1,
        tidy_mark    => 0,
        doctype      => 'omit',
        indent       => 'yes',
        markup       => 1,

        #add_xml_decl => 1,
    }
);

#$t->ignore( type => TIDY_ERROR );
#$t->ignore( type => TIDY_WARNING );
#print &gen;
print $q->header;
print $t->clean(&gen);

sub gen {
    my $gen;
    $gen .= &header;
    $gen .= &menu;
    $gen .= &main_content;
    $gen .= &sidebar;
    $gen .= &footer;
    return $gen;
}
