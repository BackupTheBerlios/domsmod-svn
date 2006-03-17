<?php

// ######################################################################
// # PHP-Nuke                                                           #
// #====================================================================#
// #  Copyright (c) 2003 - Francisco Burzi                              #
// #  http://phpnuke.org/                                               #
// #====================================================================#
// # Paladin's Downloads Modules                                        #
// #====================================================================#
// #  Copyright (c) 2003 - Darren Poulton (paladin@intaleather.com.au)  #
// #  http://paladin.intaleather.com.au/                                #
// #                                                                    #
// #  Developed from the PHP-Nuke 6.5 Standard Downloads Module         #
// #  Copyright (c) 2003 - Francisco Burzi                              #
// #  http://phpnuke.org/                                               #
// #====================================================================#
// #  Use of this program is goverened by the terms of the GNU General  #
// #     Public License (GPL - version 1 or 2) as published by the      #
// #           Free Software Foundation (http://www.gnu.org/)           #
// ######################################################################

if (!eregi("modules.php", $_SERVER['PHP_SELF'])) {
    die ("You can't access this file directly...");
}

// ######################################################################
// FUNCTIONS :: START
// ######################################################################

// ######################################################################
// FUNCTION : viewdownloadcomments($lid, $ttitle)
// ######################################################################
function viewdownloadcomments($lid, $ttitle) {
    global $prefix, $dbi, $admin, $bgcolor2, $module_name;
    include("header.php");
    include("modules/$module_name/d_config.php");
    menu(1);
    echo "<br>";
    $result=sql_query("SELECT ratinguser, rating, ratingcomments, ratingtimestamp FROM ".$prefix."_downloads_votedata WHERE ratinglid = $lid AND ratingcomments != '' ORDER BY ratingtimestamp DESC", $dbi);
    $totalcomments = sql_num_rows($result, $dbi);
    $transfertitle = ereg_replace ("_", " ", $ttitle);
    $transfertitle = stripslashes($transfertitle);
    $displaytitle = $transfertitle;
    OpenTable();
    echo "<center><font class=\"option\"><b>"._DOWNLOADPROFILE.": $displaytitle</b></font><br><br>";
    downloadinfomenu($lid, $ttitle);
    echo "<br><br><br>"._TOTALOF." $totalcomments "._COMMENTS."</font></center><br>"
	."<table align=\"center\" border=\"0\" cellspacing=\"0\" cellpadding=\"2\" width=\"450\">";
    $x=0;
    while(list($ratinguser, $rating, $ratingcomments, $ratingtimestamp)=sql_fetch_row($result, $dbi)) {
    	$ratingcomments = stripslashes($ratingcomments);
    	ereg ("([0-9]{4})-([0-9]{1,2})-([0-9]{1,2}) ([0-9]{1,2}):([0-9]{1,2}):([0-9]{1,2})", $ratingtimestamp, $ratingtime);
	$ratingtime = strftime("%F",mktime($ratingtime[4],$ratingtime[5],$ratingtime[6],$ratingtime[2],$ratingtime[3],$ratingtime[1]));
	$date_array = explode("-", $ratingtime);
	$timestamp = mktime(0, 0, 0, $date_array["1"], $date_array["2"], $date_array["0"]);
        $formatted_date = date("F j, Y", $timestamp);
	/* Individual user information */
	$result2=sql_query("SELECT rating FROM ".$prefix."_downloads_votedata WHERE ratinguser = '$ratinguser'", $dbi);
        $usertotalcomments = sql_num_rows($result2, $dbi);
        $useravgrating = 0;
        while(list($rating2)=sql_fetch_row($result2, $dbi))	$useravgrating = $useravgrating + $rating2;
        $useravgrating = $useravgrating / $usertotalcomments;
        $useravgrating = number_format($useravgrating, 1);
    	echo "<tr><td bgcolor=\"$bgcolor2\">"
    	    ."<font class=\"content\"><b> "._USER.": </b><a href=\"$nukeurl/modules.php?name=Your_Account&amp;op=userinfo&amp;username=$ratinguser\">$ratinguser</a></font>"
	    ."</td>"
	    ."<td bgcolor=\"$bgcolor2\">"
	    ."<font class=\"content\"><b>"._RATING.": </b>$rating</font>"
	    ."</td>"
	    ."<td bgcolor=\"$bgcolor2\" align=\"right\">"
    	    ."<font class=\"content\">$formatted_date</font>"
	    ."</td>"
	    ."</tr>"
	    ."<tr>"
	    ."<td valign=\"top\">"
	    ."<font class=\"tiny\">"._USERAVGRATING.": $useravgrating</font>"
	    ."</td>"
	    ."<td valign=\"top\" colspan=\"2\">"
	    ."<font class=\"tiny\">"._NUMRATINGS.": $usertotalcomments</font>"
	    ."</td>"
	    ."</tr>"
    	    ."<tr>"
	    ."<td colspan=\"3\">"
	    ."<font class=\"content\">";
	    if (is_admin($admin)) {
		echo "<a href=\"admin.php?op=DownloadsModDownload&amp;lid=$lid\"><img src=\"modules/$module_name/images/editicon.gif\" border=\"0\" alt=\""._EDITTHISDOWNLOAD."\"></a>";
	    }
	echo " $ratingcomments</font>"
	    ."<br><br><br></td></tr>";
	$x++;
    }
    echo "</table><br><br><center>";
    downloadfooter($lid,$ttitle);
    echo "</center>";
    CloseTable();
    include("footer.php");
}

?>