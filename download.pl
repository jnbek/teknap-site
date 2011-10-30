#!/usr/bin/perl -w
#===============================================================================
#
#         FILE:  download.pl
#
#        USAGE:  firefox http://ircd.zoelife4u.org/teknap/index.pl
#
#  DESCRIPTION:  Downloads Teknap.
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

use CGI ':standard';
use vars qw( $dir $id $file @container $q $f $teknap $cfile $num $fullname );
$q   = CGI->new;
$dir = "/usr/local/www/irc/teknap/";
$id  = $q->param('id');

sub err {
    my $error = shift;
    print $q->header;
    print $q->h1("An Error has occured: $error");
    die;
}

sub count {
    $cfile = shift;
    open $f, "<", "/usr/local/www/irc/teknap/files/$cfile.count";
    $num = <$f>;
    close $f;
    open $f, ">", "/usr/local/www/irc/teknap/files/$cfile.count";
    $num = $num + 1;
    print $f $num;
    close $f;
}
if ( $id eq '' or $id =~ m/^\./  ) {
    print $q->header;
    &err("No File Selected");
}
if ( $id eq '13' ) {
    $teknap = 'downloads/TekNap-1.3g.Win32.zip';
}
elsif ( $id eq '14' ) {
    $teknap = 'downloads/TekNap-1.4u-src.tar.gz';
}
elsif ( $id eq '15' ) {
    $teknap = 'downloads/tekscripts.zip';
}
else {
    $teknap = 'tekscripts/' . $id;
}
open $f, "<", "$dir/$teknap" or &err("$!");
@container = <$f>;
close $f;
my @filename = split('/', $teknap);
&count($filename[1]);    # Add to the Download count
print "Content-Type: application/x-download\n";
print "Content-Disposition: attachment; filename=$filename[1]\n\n";
print @container;
