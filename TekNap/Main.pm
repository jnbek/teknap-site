package TekNap::Main;

#===============================================================================
#
#         FILE:  TekNap/Main.pm
#
#        USAGE:  use TekNap::Main ':all';
#
#  DESCRIPTION:  Creates all the methods used to generate the TekNap pages.
#
#      OPTIONS:  ---
# REQUIREMENTS:  TekNap/Header.pm, TekNap/Footer.pm, TekNap/Sidebar.pm, CGI.pm CGI::Pretty
#         BUGS:  ---
#        NOTES:  ---
#       AUTHOR:   (jnbek), <jnbek@zoelife4u.org>
#      COMPANY:
#      VERSION:  0.01
#      CREATED:  12/02/2007 08:15:21 PM MST
#     REVISION:  ---
#===============================================================================
use strict;
use warnings;

use CGI::Carp qw(fatalsToBrowser);
use CGI;

#use CGI::Pretty;

BEGIN {
    require Exporter;

    our @ISA = qw(Exporter);

    # Items to export into callers namespace by default. Note: do not export
    # names by default without a very good reason. Use EXPORT_OK instead.
    # Do not simply export all your public functions/methods/constants.

    # This allows declaration	use TekNap::Main ':all';
    # If you do not need this, moving things directly into @EXPORT or @EXPORT_OK
    # will save memory.
    our %EXPORT_TAGS = (
        'all' => [
            qw(

              )
        ]
    );

    our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

    our @EXPORT = qw(
      &main_content &header &footer &sidebar &doit &menu &noParam
    );
}
our $VERSION = '0.07';
my $q = CGI->new;

# Preloaded methods go here
use vars qw($output $file);

sub new {
    return 1;
}

sub header {
    $output .= $q->header;
    $output .= $q->start_html(
        -style  => 'files/style.css',
        -author => 'jnbek_NOSPAM_AT_zoelife4u.org',
        -title  => 'Jnbek\'s TekNap Website',
        -meta   => {
            'keywords' =>
'TekNap, opennap, slavanap, jnbek, p2p, peer, napster, irc, Linux, BSD, Windows, Cygwin',
            'description' =>
'TekNap, A Console Napster Client. Highly configurable and great for administering napster and napster based servers.',

            'generator' =>
'VIM - Vi IMproved 7.1 (2007 May 12, compiled Oct  5 2007 00:50:42)'
        },
        -script => [
            {
                -language => 'javascript',
                -src      => 'js/prototype.js'
            },
            {
                -language => 'javascript',
                -src      => 'js/scriptaculous.js'
            },

            {
                -language => 'javascript',
                -src      => 'js/effects.js'
            },
            {
                -language => 'javascript',
                -src      => 'files/hide.js'
            }

        ],
    );

    $output .= q(<div id="wrapper">);
    $output .= q(<a name="top"></a>);
    $output .= q(<div id="header">);
    $output .= $q->img(
        {
            src => 'files/logo.gif',
            alt => 'TekNap: The Programmable Napster Client'
        }
    );
    $output .= q(</div>);    #header
    return $output;
}

sub menu {
    my $self = shift;
    my $menu = '';
    $menu .= q(<div id="navbar">);
    $menu .=
      $q->a( { -href => '/teknap/', -title => 'Back to the Main Page' },
        " [ TekNap ] " );

    $menu .=
      $q->a( { -href => '/teknap/#download', -title => 'Download TekNap' },
        " [ Downloads ] " );
    $menu .= $q->a(
        {
            -href  => '/teknap/#install',
            -title => 'Installation Instructions TekNap'
        },
        " [ Installation ] "
    );

    $menu .= $q->a(
        {
            -href  => '/teknap/#scripts',
            -title => 'Resources for TekNap Scripts'
        },
        " [ Scripts ] "
    );
    $menu .= $q->a(
        {
            -href  => '/teknap/help.pl',
            -title => 'TekNap\'s Builtin Help System'
        },
        " [ Online Help ] "
    );

    $menu .= q(</div>);

    return $menu;
}

sub main_content {
    my $self = shift;
    my $content;
    $content .= q(<div id="leftcolumn">);
    $content .= $q->h1("Jnbek's Teknap Page");
    $content .= $q->h3("The Programmable Napster Client");
    $content .= $q->h5("For Win32 and UNIX Based Platforms");
    $content .= $q->hr;
    $content .= $q->h4("About TekNap");
    $content .=
      $q->p(
"TekNap is a Console based client for connecting to Napster, OpenNap and SlavaNap based servers. It was originally known as BWap and is based of the EPIC and BitchX IRC Clients and uses a scripting language based of of versions of EPIC IRC Client version 4. TekNap also has the ability to connect to IRC servers as well, and because if it's extensive scripting language is extremely customizable and configurable. It's a great choice for creating Admin bots for both Napster and IRC servers, automating alot of mundane tasks for the server owner, such as searching for clones and killing them on a timer, as well as running text baseed games via the server such as Hangman, Trivia and Scrabble. It's a well put together client and runs natively on Linux, the BSDs, and MacOSX and on Windows with Cygwin, version 1.3g has been compiled and packaged to run on Win32 platforms natively as well. With all this in mind, you can also use TekNap to browse users. search and download files from a server you're connected too also !!."
      );
    $content .= q(<a name="downloads"></a>);
    $content .= $q->h4("Downloads");
    $content .=
      $q->p(
"While there are many versions of TekNap floating around the internet there are two versions that are known to work real well and are the only versions available here."
      );
    $content .= q(<center><table>);
    $content .= q(<tr>);
    $content .= q(<th> Filename: </th>);
    $content .= q(<th> Platform: </th>);
    $content .= q(<th> Version: </th>);
    $content .= q(<th> More Info: </th>);
    $content .= q(<th> Download: </th>);
    $content .= q(<th> How to Install: </th>);
    $content .= q(</tr>);
    $content .= q(<tr>);
    $content .= q(<td>);
    $content .= $q->p("TekNap-1.4u-src.tar.gz");
    $content .= q(</td>);
    $content .= q(<td>);
    $content .= $q->p("Linux/BSD/HP-UX");
    $content .= q(</td>);
    $content .= q(<td>);
    $content .= $q->p("1.4-Unofficial");
    $content .= q(</td>);
    $content .= q(<td>);
    $content .=
      $q->p(
qq(<a title="More info on v1.4u" href="#download" onClick='Combo("info14", {duration: 3, scaleX: true, scaleContent: true})'>More Info</a>)
      );
    $content .= q(</td>);
    $content .= q(<td>);
    $content .= $q->p(
        $q->a(
            {
                -title => "Download TekNap-1.4u-src.tar.gz",
                -href  => 'download.pl?id=14'
            },
            "Download"
        )
    );
    $content .= q(</td>);
    $content .= q(<td>);
    $content .=
      $q->p(
qq(<a title="Installation Instructions for v1.4u" href="#download" onClick='Combo("install14", {duration: 3, scaleX: true, scaleContent: true})'>How to Install</a>)
      );
    $content .= q(</td>);
    $content .= q(</tr>);
    $content .= q(<tr>);
    $content .= q(<td>);
    $content .= $q->p("TekNap-1.3g.Win32.zip");
    $content .= q(</td>);
    $content .= q(<td>);
    $content .= $q->p("Windows 95/98/ME/2000/XP/2003");
    $content .= q(</td>);
    $content .= q(<td>);
    $content .= $q->p("1.3-Win32");
    $content .= q(</td>);
    $content .= q(<td>);
    $content .=
      $q->p(
qq(<a title="More Information about v1.3g" href="#download" onClick='Combo("info13", {duration: 3, scaleX: true, scaleContent: true})'>More Info</a>)
      );
    $content .= q(</td>);
    $content .= q(<td>);
    $content .= $q->p(
        $q->a(
            {
                -title => "Download TekNap-1.3g.Win32.zip",
                -href  => 'download.pl?id=13'
            },
            "Download"
        )
    );
    $content .= q(</td>);
    $content .= q(<td>);
    $content .=
      $q->p(
qq(<a title="Installation Instructions for v1.3g" href="#download" onClick='Combo("install13", {duration: 3, scaleX: true, scaleContent: true})'>How to Install</a>)
      );
    $content .= q(</td>);

    $content .= q(</tr>);
    $content .= q(</table></center>);

    #$content .= q(<div id="installation">);
    $content .= qq(<a name="install"></a>);
    $content .=
      qq(<script type="text/javascript"> showSpan('info14'); </script>);
    $content .= $q->h4('TekNap-1.4u:');    #More info on v1.4u
    $content .= $q->p(qq(This version was modified slightly from the original 1.4 source code to compile on the GCC 3.X series compilers. The modifications were made by one of the admins of one of the oldest surviving Opennap networks and contains some optimizations for their server software but still runs on legacy Opennap servers and SlavaNap servers just fine. Please be sure to check the README file for any specific information regarding your specific platform. Note GCC 4.X users, you may encounter a compile error that isn't very clear, it just reports an error occured then stops. If possible install GCC 3.X to compile TekNap 1.4u. It is safe to ignore all the Warnings that are produced while TekNap compiles, they don't affect the performance to the client once it's built. ));
    $content .= qq(<script type="text/javascript"> hideSpan(); </script>);
    $content .=
      qq(<script type="text/javascript"> showSpan('info13'); </script>);
    $content .= $q->h4('TekNap-1.3g:');    #More info on v1.3g
    $content .= $q->p(qq(This is the precompiled binary package for Windows users, it's stable, reliable and does everything the UNIX version does, except on Windows 95, 98, and ME the /exec command fails and may result in your computer locking up, but for NT based versions, this problem isn't applicable, it's due to the fact that the 9X series of Windows didn't support threads. One thing should be noted, TekNap is a console based client and will run from your command prompt window, which limits your ability to cut and paste, but other features such as teb completion are available so you should't have to worry about copy and pasting long nicknames. ));
    $content .= qq(<script type="text/javascript"> hideSpan(); </script>);
    $content .=
      qq(<script type="text/javascript"> showSpan('install14'); </script>);
    $content .= $q->h4("Installation Help: TekNap-1.4u for the UNIX platform");
    #$content .= $q->hr;
    $content .=
      $q->p(
"Installing TekNap on the UNIX platform is not as hard as it seems but be sure to follow the instructions carefully otherwise the build may fail. The following steps have been tested on FreeBSD 6.2 RELEASE and Kubuntu Linux 7.10 with the generic kernel on a 633Mghz Celeron processor with 512MB of RAM: "
      );
    $content .= q(<ol>);
    $content .=
q(<li> Verify you have the <a href="http://ftp.gnu.org/pub/gnu/ncurses" target="_BLANK">Ncurses </a>&nbsp;library installed and the dev packages if you're using Ubuntu or RPM based distros, you can get the latest ncurses source code from <a href="http://ftp.gnu.org/pub/gnu/ncurses" target="_BLANK">http://ftp.gnu.org/pub/gnu/ncurses </a>&nbsp;and build it yourself on the rare chace you don't have it, those with apt can simply type: <pre>apt-get install libncurses5 libncurses5-dev</pre> and those with yum can enter <pre>yum install libncurses5 libncurses5-devel</pre>.</li>);
    $content .=
q(<li> Next we run the configure script, i recommend installing TekNap in an off directory just in case you decide to remove TekNap, as there in no uninstall feature with TekNap, I choose <pre> /opt/TekNap </pre>. The configure script took a little over 1 minute to run on my system, and will probably run a whole lot faster on your system, anyways to run the configure script simply type: <pre>cd ./TekNap && ./configure --preifx=/opt/TekNap</pre></li>);
    $content .=
q(<li> Next we must compile the program, after the configure script is all done running simply type: <pre>make</pre> to compile TekNap, this takes up to 5 minutes on my system. Watch for any errors here, if no error occur then woopie !! :-D</li>);
    $content .=
q(<li> The next and final step to building and installing TekNap is the easiest, you simply type: <pre> make install </pre> and it will install itself into the /opt/TekNap/ directory on your computer, note, you may need root access to run this command, if so, just log in as root before running this command. once it's through installing, at your terminal prompt, simply type: <pre> /opt/TekNap/bin/TekNap </pre> and then connect to your favorite napster based server by typing: <pre> /server some.servername.com </pre> where server name is the Fully Qualified Domain Name or IP of the server you want to connect to.</li>);

    $content .= q(</ol>);
    $content .= qq(<script type="text/javascript"> hideSpan(); </script>);
    $content .=
      qq(<script type="text/javascript"> showSpan('install13'); </script>);
    $content .=
      $q->h4("Installation Help: TekNap 1.3g for the Windows Platform");
    #$content .= $q->hr;
    $content .=
      $q->p(
"Installing TekNap on the Windows Platform is very easy. Below are the recommended instructions for getting TekNap running as quickly as possible:"
      );
    $content .= q(<ol>);
    $content .= q(<li>Download TekNap-1.3g.Win32.zip from above</li>);
    $content .=
q(<li>Extract the zip file\'s contents to C:\ or D:\ inside the zip file is a folder named TekNap, inside this folder is where all the program files, etc are your goal is to extract the folder to either c:\ or D:\ to create a path: C:\TekNap</li>);
    $content .= q(<li>Open up the folder C:\TekNap</li>);
    $content .= q(<li>Click on the Executable file named TekNap</li>);
    $content .=
q(<li>Once TekNap loads and gives you the error, could not connect to a dimension.com server, simply type /server desired.server.com where desired.server.com is the name if the Napster based server you want to connect to.</li>);
    $content .=
q(<li>Read the Scripts section to learn how to customize TekNap a bit</li>);
    $content .= q(</ol>);
    $content .= q(<script type="text/javascript"> hideSpan(); </script>);
    $content .=
      $q->p(
        $q->a( { -href => "#top", -title => "Back to Top" }, "Back to Top" ) );

    $content .= &scripts;
    $content .= q(</div>);    # LeftColumn
    return $content;
}

sub sidebar {
    my $self = shift;
    my $content;
    $content .= q(<div id="rightcolumn">);
    $content .= &readDirs;
    $content .= q(</div>);
    return $content;
}

sub readDirs {    # Right Sidebar
    my $realpath = qq(/usr/local/www/irc/teknap/help);
    use vars qw($content @lvl1 @lvl2 @lvl3);

    chdir $realpath;

    #print &gcwd;
    opendir( my $level1, "$realpath" );
    $content .= $q->h3('TekNap Online Help');
    $content .= $q->p("<strong>Click a Section to Expand</strong>");
    $content .= qq(<div class="">);                                    #Level 1
    @lvl1 = readdir($level1);
    @lvl1 = sort(@lvl1);
    foreach my $lvl1 (@lvl1) {
        next if ( $lvl1 =~ m/^\./ );    # Ignore .dot files
        $content .= qq(<p class="lvl1">);
        my @javascript = split( "_", $lvl1 );
        $content .= qq(<a name="$lvl1"></a>);
        $content .=
qq(<a href ="#$lvl1" class="dummy" onclick='Combo("$javascript[1]", {duration: 3, scaleX: true, scaleContent: true})'><strong>$lvl1</strong></a>)
          ;                             # Top Level doesn't need Link
        $content .= qq(</p>);

        if ( -d "$lvl1" ) {             # /usr/local/www/irc/teknap/help/
            $content .=
qq(<script type="text/javascript"> showDiv("$javascript[1]"); </script>);
            chdir("$realpath/$lvl1")
              ;    # cd /usr/local/www/irc/teknap/help/5_Programming/
                   #print &gcwd;
            opendir( my $level2, "$realpath/$lvl1" );
            $content .= qq(<div class="">);
            @lvl2 = readdir($level2);
            @lvl2 = sort(@lvl2);
            foreach my $lvl2 (@lvl2) {
                next if ( $lvl2 =~ m/^\./ );
                $content .= qq(<p class="lvl2">);
                if ( -d "$lvl2" ) {
                    my $lvl2s = "$lvl2" . "s";
                    $content .= qq(<a name="$lvl2"></a>);
                    $content .=
qq(<a href="#$lvl2" class="dummy" onclick='Combo("$lvl2s", {duration: 3, scaleX: true, scaleContent: true})'><strong>$lvl2</strong></a>);
                }
                else {
                    $content .= $q->a(
                        {
                            -href  => "help.pl?file=$lvl1/$lvl2",
                            -title => "$lvl1/$lvl2"
                        },
                        $lvl2
                    );
                }
                $content .= qq(</p>);
                if ( -d "$lvl2" )
                {    # /usr/local/www/irc/teknap/help/5_Programming/
                    my $lvl2s = "$lvl2" . "s";
                    $content .=
qq(<script type="text/javascript"> showDiv("$lvl2s"); </script>);
                    chdir "$realpath/$lvl1/$lvl2"
                      ;    # cd /usr/local/www/irc/teknap/help/5_Programming/on/
                           #print &gcwd;
                    opendir( my $level3, "$realpath/$lvl1/$lvl2" );
                    $content .= qq(<div class="">);    # Level 3
                    @lvl3 = readdir($level3);
                    @lvl3 = sort(@lvl3);

                    foreach my $lvl3 (@lvl3) {
                        next if ( $lvl3 =~ m/^\./ );
                        $content .= qq(<p class="lvl3">);
                        $content .= $q->a(
                            {
                                -href  => "help.pl?file=$lvl1/$lvl2/$lvl3",
                                -title => "$lvl1/$lvl2/$lvl3"
                            },
                            $lvl3
                        );
                        $content .= qq(</p>);
                    }
                    $content .= qq(</div>);    #Level 3
                    closedir($level3);
                    chdir "..";
                    $content .=
                      qq(<script type="text/javascript"> hideDiv(); </script>)
                      ;    # Evd Div for the Level 2 Display.Hide JS Function
                }
                else {
                    next;
                }

                #chdir ".."; # cd /usr/local/www/irc/teknap/help/5_Programming/
            }
            $content .= qq(</div>);    #Level 2
            closedir($level2);
            chdir "..";                # cd /usr/local/www/irc/teknap/help/
            $content .= qq(<script type="text/javascript"> hideDiv(); </script>)
              ;    # Evd Div for the Level 1 Display.Hide JS Function
        }
        else {
            next;
        }
    }

    $content .= qq(</div>);    #Level 1
    closedir($level1);
    return $content;
}

sub scripts {
    my $scripts;
    $scripts .= q(<a name="scripts"></a>);
    $scripts .= $q->h4('TekNap Scripts');
    $scripts .= $q->p(qq(Here, you'll find a large collection of scripts of TekNap, wriiten by many different authors over time, these scripts have been mirrored from <a title="Spike's Net" href="http://www.spykes.net/?p=napfiles" target="_BLANK">http://www.spykes.net/?p=napfiles</a>. Some of these scripts are rather brutal, and neither Spike nor myself are responsible how they are used, so be nice, k? ));
    $scripts .= $q->p(qq(<a href="#scripts" class="dummy" onclick='Combo("allscripts", {duration: 3, scaleX: true, scaleContent: true})'><strong>Click here to browse all the scripts</strong></a> or <a title="Download the entire Script Archive" href="download.pl?id=15"><strong>Download the entire Script Archive here</strong></a>.));
    $scripts .= qq(<script type="text/javascript"> showDiv("allscripts"); </script>);
    $scripts .= $q->h4('TekNap Scripts Archive');
    chdir('/usr/local/www/irc/teknap/tekscripts');
    my @a = glob('*');
    foreach my $a (@a) {
        $scripts .= qq(<a title="$a" href="download.pl?id=$a"><strong> [ $a ] </strong></a>);
    }
    $scripts .= qq(<script type="text/javascript"> hideDiv(); </script>);
    $scripts .= $q->p(q(<a href="#top" title="Back to Top">Back to Top</a>));
    return $scripts;
}
sub footer {
    my $page;
    $page .= qq(<div id="footer">);

    #    $page .= qq(<small>);
    my $cp_year=((localtime(time))[5]);
    $cp_year = $cp_year+1900;
    $page .= $q->p("<small>Copyright (C) 2007-$cp_year</small>");
    $page .= $q->p('<small>Zoelife4U.Org and ZiRcD IRC Intl.</small>');
    $page .=
      $q->p('<small>Praise Be to our Lord and Savior, Jesus Christ</small>');

    #    $page .= qq(</small>);
    $page .= qq(</div>);
    $page .= q(</div>);      # Wrapper
    $page .= $q->end_html;
    return $page;
}
## Help.pl methods
sub doit {
    my $helpfile = shift;
    my $content;
    $content .= qq(<div id="leftcolumn">);
    open( my $f, "<", "$helpfile" ) or die "Could not open file: $!";
    if ( -s $helpfile == 0 ) {
        $file =~ s/(\d)_(.*)\/(.*)/$2 Section: $3 ($1)/;
        $content .= $q->h1($file);
        $content .= $q->h2('The Document Contains No Data');
    }
    else {
        $file =~ s/(\d)_(.*)\/(.*)/$2 Section: $3 ($1)/;
        $content .= $q->h1($file);
        my @a = <$f>;
        foreach my $a (@a) {
            $a =~ s/\002(.*)\002/<h2>$1<\/h2>/gi;
            $a =~ s/\037(.*)\037/<u>$1<\/u>/gi;
            $content .= $q->p($a);
        }
    }
    $content .= qq(</div>);
    close $f;
    return $content;
}

sub noParam {
    my $content;
    $content .=
      $q->h3("Please Select a Help file to view using the menu on the right");
    return $content;
}

sub err {
    my $oops    = shift;
    my $content = $q->h3("Error: $oops, $!");
    return $content;
}

sub gcwd {
    use Cwd;
    my $dir = cwd;
    my $p   = $q->p("Current Directory: $dir");
    return $p;
}

1;
__END__
# Below is stub documentation for your module. You'd better edit it!

=head1 NAME

TekNap::Main - Perl extension for creating the template for all client setup
pages for http://ircd.zoelife4u.org/clients/

=head1 SYNOPSIS

  use TekNap/Main.pm;
  use CGI;
  my $t = TekNap::Main->new;
  my $q = CGI->new;
  print $t->header;
  if ($q->param('file') eq 'help') {
  	print $t->helpbody;
  } else {
	print $t->mainbody;
  }


=head1 DESCRIPTION

This library sets up the methods and classes used to create the HTML pages to be used on http://ircd.zoelife4u.org/teknap/ since there are multiple pages that reply on approx. 1000 lines of code each, we'll break it down, and write modules to serve this purpose, then call them in the index.pl script

Blah blah blah.

=head2 EXPORT

All by default.


=head1 AUTHOR

John D Jones III, E<lt>jnbek@psalm69<gt>:wq

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2007 by John D Jones III




=cut
