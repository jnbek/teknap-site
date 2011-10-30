#!/usr/bin/perl 
#===============================================================================
#
#         FILE:  ajax.pl
#
#        USAGE:  ./ajax.pl
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
#      CREATED:  11/17/2007 09:01:38 PM MST
#     REVISION:  ---
#===============================================================================

use strict;
use warnings;

use CGI::Carp qw(fatalsToBrowser);

use CGI;    # or any other CGI:: form handler/decoder
use CGI::Pretty;
my $q = CGI->new;
print $q->header;
if ( $q->param('v') eq '1.4u' ) {
    print $q->p("TekNap 1.4-Unoffical");

    #More Crap Here
}
if ( $q->param('v') eq '1.3g' ) {
    print $q->p("TekNap 1.3g-Win32");

    #More Crap Here
}
if ($q->param('v') eq 'clear' ) {
    print q("<!- A Useless Comment -!>");
}
if ($q->param('i') eq '1.3g' ) {
    print $q->h5("Installation Help: TekNap 1.3g for the Windows Platform");
    print $q->hr;
    print $q->p("Installing TekNap on the Windows Platform is very easy. Below are the recommended instructions for getting TekNap running as quickly as possible:");
    print q(<ol class="lvl1">);
              print q(<li>Download TekNap-1.3g.Win32.zip from above</li>);
              print q(<li>Extract the zip file\'s contents to C:\ or D:\ inside the zip file is a folder named TekNap, inside this folder is where all the program files, etc are your goal is to extract the folder to either c:\ or D:\ to create a path: C:\TekNap</li>);
              print q(li>Open up the folder C:\TekNap</li>);
              print q(<li>Click on the Executable file named TekNap</li>);
              print q(<li>Once TekNap loads and gives you the error, could not connect to a dimension.com server, simply type /server <desired-server> where desired server is the name if the Napster based server you want to connect to</li>);
              print q(<li>Read the Scripts section to learn how to customize TekNap a bit</li>);
} # Tek 1.3g if(){}
if ($q->param('i') eq '1.4u' ) {
    print $q->h5("Installation Help: TekNap-1.4u for the UNIX platform");
    print $q->hr;
    print $q->p("Installing TekNap on the UNIX platform is not as hard as it seems but be sure to follow the instructions carefully otherwise the build may fail. The following steps have been tested on FreeBSD 6.2 RELEASE and Kubuntu Linux 7.10 with the generic kernel on a 633Mghz Celeron processor with 512MB of RAM: ");
    print q(<ol class="lvl1">);
    print q(<li> Verify you have the <a href="http://ftp.gnu.org/pub/gnu/ncurses" target="_BLANK">Ncurses</a> library installed and the dev packages if you're using Ubuntu or RPM based distros, you can get the latest ncurses source code from <a href="http://ftp.gnu.org/pub/gnu/ncurses" target="_BLANK">http://ftp.gnu.org/pub/gnu/ncurses</a> and build it yourself on the rare chace you don't have it, those with apt can simply type: <pre>apt-get install libncurses5 libncurses5-dev</pre> and those with yum can enter <pre>yum install libncurses5 libncurses-devel</pre>.);
    print q(<li> Next we run the configure script, i recommend installing TekNap in an off directory just in case you decide to remove TekNap, as there in no uninstall feature with TekNap, I choose <pre> /opt/TekNap </pre>. The configure script took a little over 1 minute to run on my system, and will probably run a whole lot faster on your system, anyways to run the configure script simply type: <pre>cd ./TekNap && ./configure --preifx=/opt/TekNap</pre></li>);
    print q(<li> Next we must compile the program, after the configure script is all done running simply type: <pre>make</pre> to compile TekNap, this takes up to 5 minutes on my system. Watch for any errors here, if no error occur then woopie !! :-D</li>);
    print q(<li> The nest and final step to building and installing TekNap is the easiest, you simply type: <pre> make install </pre> and it will install itself into the /opt/TekNap/ directory on your computer, note, you may need root access to run this command, if so, just log in as root before running this command. once it's through installing, at your terminal prompt, simply type: <pre> /opt/TekNap/bin/TekNap </pre> and then connect to your favorite napster based server by typing: <pre> /server some.servername.com </pre> where server name is the Fully Qualified Domain Name or IP of the server you want to connect to.</li>);

    print q(</ol>);
} # Tek 1.4u if(){}
