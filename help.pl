#!/usr/bin/perl -w 
#===============================================================================
#
#         FILE:  help.pl
#
#        USAGE:  firefox http://ircd.zoelife4u.org/teknap/help.pl
#
#  DESCRIPTION:  Reads an Online-Help file.
#
#      OPTIONS:  ---
# REQUIREMENTS:  ---
#         BUGS:  ---
#        NOTES:  ---
#       AUTHOR:   (jnbek), <jnbek@zoelife4u.org>
#      COMPANY:
#      VERSION:  1.0
#      CREATED:  12/02/2007 08:15:21 PM MST
#     REVISION:  ---
#===============================================================================

use strict;
use warnings;
use lib qw(/usr/local/www/perl_modules/);
use HTML::Tidy;
use TekNap::Main;
use CGI;
use CGI::Pretty;

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

my $file     = $q->param('file');
my $path     = qq(/usr/local/www/irc/teknap/help);
my $fullpath = join( '/', $path, $file );

print $q->header;
if ( $file =~ m/^\./ or !$file ) {
    print $t->clean(&gen_no);
}
else {
    print $t->clean( &gen($fullpath) );
}


chdir $path;

sub gen_no {
    my $gen;
    $gen .= &header;
    $gen .= &menu;
    $gen .= &noParam;
    $gen .= &sidebar;

    $gen .= &footer;
    return $gen;
}

sub gen {
    my $fpath = shift;
    my $gen;
    $gen .= &header;

    $gen .= &menu;
    $gen .= &doit($fpath);
    $gen .= &sidebar;

    $gen .= &footer;
    return $gen;
}

