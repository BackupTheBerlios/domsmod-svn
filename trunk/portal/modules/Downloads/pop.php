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
// FUNCTION : MostPopular($ratenum, $ratetype)
// ######################################################################
function MostPopular($ratenum, $ratetype) {
    global $prefix, $dbi, $admin, $module_name, $user;
    include("header.php");
    include("modules/$module_name/d_config.php");
    menu(1);
    echo "<br>";
    OpenTable();
    echo "<table border=\"0\" width=\"100%\"><tr><td align=\"center\">";
    if ($ratenum != "" && $ratetype != "") {
    	$mostpopdownloads = $ratenum;
    	if ($ratetype == "percent") $mostpopdownloadspercentrigger = 1;
    }
    if ($mostpopdownloadspercentrigger == 1) {
    	$topdownloadspercent = $mostpopdownloads;
    	$result = sql_query("SELECT * FROM ".$prefix."_downloads_downloads", $dbi);
    	$totalmostpopdownloads = sql_num_rows($result, $dbi);
    	$mostpopdownloads = $mostpopdownloads / 100;
    	$mostpopdownloads = $totalmostpopdownloads * $mostpopdownloads;
    	$mostpopdownloads = round($mostpopdownloads);
    }
    if ($mostpopdownloadspercentrigger == 1) {
	echo "<center><font class=\"option\"><b>"._MOSTPOPULAR." $topdownloadspercent% ("._OFALL." $totalmostpopdownloads "._DOWNLOADS.")</b></font></center>";
    } else {
	echo "<center><font class=\"option\"><b>"._MOSTPOPULAR." $mostpopdownloads</b></font></center>";
    }
    echo "<tr><td><center>"._SHOWTOP.": [ <a href=\"modules.php?name=$module_name&d_op=MostPopular&amp;ratenum=10&amp;ratetype=num\">10</a> - "
	."<a href=\"modules.php?name=$module_name&d_op=MostPopular&amp;ratenum=25&amp;ratetype=num\">25</a> - "
    	."<a href=\"modules.php?name=$module_name&d_op=MostPopular&amp;ratenum=50&amp;ratetype=num\">50</a> | "
    	."<a href=\"modules.php?name=$module_name&d_op=MostPopular&amp;ratenum=1&amp;ratetype=percent\">1%</a> - "
    	."<a href=\"modules.php?name=$module_name&d_op=MostPopular&amp;ratenum=5&amp;ratetype=percent\">5%</a> - "
    	."<a href=\"modules.php?name=$module_name&d_op=MostPopular&amp;ratenum=10&amp;ratetype=percent\">10%</a> ]</center><br><br></td></tr>";
    $result = sql_query("SELECT lid, cid, title, description, date, hits, url, downloadratingsummary, totalvotes, totalcomments, filesize, version, homepage FROM ".$prefix."_downloads_downloads order by hits DESC limit 0,$mostpopdownloads ", $dbi);
    echo "<tr><td>";
    while(list($lid, $cid, $title, $description, $time, $hits, $url, $downloadratingsummary, $totalvotes, $totalcomments, $filesize, $version, $homepage) = sql_fetch_row($result, $dbi)) {
		$downloadratingsummary = number_format($downloadratingsummary, $mainvotedecimal);
		$title = stripslashes($title);
		$description = stripslashes($description);
        global $prefix, $dbi, $admin;
		if (is_admin($admin)) {
			if (eregi("http", $url)) { echo "<a href=\"admin.php?op=DownloadsModDownload&amp;lid=$lid\"><img src=\"modules/$module_name/images/icon30.gif\" border=\"0\" alt=\""._EDIT."\"></a>"; }
			else { echo "<a href=\"admin.php?op=DownloadsModDownload&amp;lid=$lid\"><img src=\"modules/$module_name/images/download.gif\" border=\"0\" alt=\""._EDIT."\"></a>"; }
		} else {
			if (eregi("http", $url)) { echo "<img src=\"modules/$module_name/images/icon30.gif\" border=\"0\" alt=\"\">"; }
			else { echo "<img src=\"modules/$module_name/images/download.gif\" border=\"0\" alt=\"\">"; }
		}
    	echo "&nbsp;<font class=\"content\"><a href=\"modules.php?name=$module_name&d_op=getit&amp;lid=$lid\" CLASS=\"title\" TARGET=\"_blank\">$title</a>";
		newdownloadgraphic($datetime, $time);
		popgraphic($hits);
		detecteditorial($lid, $transfertitle, 1);
		echo "<br>";
		echo "<b>"._DESCRIPTION.":</b> $description<br>";
		setlocale (LC_TIME, $locale);
		ereg ("([0-9]{4})-([0-9]{1,2})-([0-9]{1,2}) ([0-9]{1,2}):([0-9]{1,2}):([0-9]{1,2})", $time, $datetime);
		$datetime = strftime(""._LINKSDATESTRING."", mktime($datetime[4],$datetime[5],$datetime[6],$datetime[2],$datetime[3],$datetime[1]));
		$datetime = ucfirst($datetime);
		echo "<b>"._VERSION.":</b> $version <b>"._FILESIZE.":</b> ".CoolSize($filesize)."<br>";
		echo "<b>"._ADDEDON.":</b> $datetime <b>"._UDOWNLOADS.":</b> <b>$hits</b>";
		$transfertitle = str_replace (" ", "_", $title);
		/* voting & comments stats */
        if ($totalvotes == 1) {
	    	$votestring = _VOTE;
        } else {
	    	$votestring = _VOTES;
		}
		if ($downloadratingsummary!="0" || $downloadratingsummary!="0.0") {
	    	echo " <b>"._RATING.":</b> $downloadratingsummary ($totalvotes $votestring)";
		}
		echo "<br>";
		$result2 = sql_query("SELECT title FROM ".$prefix."_downloads_categories WHERE cid=$cid", $dbi);
		list($ctitle) = sql_fetch_row($result2, $dbi);
		$ctitle = getparent($cid,$ctitle);
		echo "<B>"._CATEGORY.":</B> <A HREF=\"modules.php?name=Downloads&d_op=viewdownload&cid=$cid\">$ctitle</A>";
        if ($homepage == "") {
	    	echo "<br>";
		} else {
	    	echo "<br><a href=\"$homepage\" target=\"new\">"._HOMEPAGE."</a> | ";
		}
		echo "<a href=\"modules.php?name=$module_name&d_op=ratedownload&amp;lid=$lid&amp;ttitle=$transfertitle\">"._RATERESOURCE."</a>";
		if (is_user($user)) {
	    	echo " | <a href=\"modules.php?name=$module_name&d_op=brokendownload&amp;lid=$lid\">"._REPORTBROKEN."</a>";
		}
		echo " | <a href=\"modules.php?name=$module_name&d_op=viewdownloaddetails&amp;lid=$lid&amp;ttitle=$transfertitle\">"._DETAILS."</a>";
		if ($totalcomments != 0) {
	    	echo " | <a href=\"modules.php?name=$module_name&d_op=viewdownloadcomments&amp;lid=$lid&amp;ttitle=$transfertitle\">"._SCOMMENTS." ($totalcomments)</a>";
		}
		detecteditorial($lid, $transfertitle, 0);
		echo "<br><br>";
    }
    echo "</font></td></tr></table>";
    CloseTable();
    include("footer.php");
}

?>