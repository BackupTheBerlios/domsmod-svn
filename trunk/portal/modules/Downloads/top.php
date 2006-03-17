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
// FUNCTION : TopRated($ratenum, $ratetype)
// ######################################################################
function TopRated($ratenum, $ratetype) {
    global $prefix, $db, $admin, $module_name, $user;
    include("header.php");
    include("modules/$module_name/d_config.php");
    menu(1);
    echo "<br>";
    OpenTable();
    echo "<table border=\"0\" width=\"100%\"><tr><td align=\"center\">";
    if ($ratenum != "" && $ratetype != "") {
    	$topdownloads = $ratenum;
    	if ($ratetype == "percent") {
	    $topdownloadspercentrigger = 1;
	}
    }
    if ($topdownloadspercentrigger == 1) {
    	$topdownloadspercent = $topdownloads;
    	$totalrateddownloads = $db->sql_numrows($db->sql_query("SELECT * FROM ".$prefix."_downloads_downloads WHERE downloadratingsummary != 0"));
    	$topdownloads = $topdownloads / 100;
    	$topdownloads = $totalrateddownloads * $topdownloads;
    	$topdownloads = round($topdownloads);
    }
    if ($topdownloadspercentrigger == 1) {
	echo "<center><font class=\"option\"><b>"._DBESTRATED." $topdownloadspercent% ("._OF." $totalrateddownloads "._TRATEDDOWNLOADS.")</b></font></center><br>";
    } else {
	echo "<center><font class=\"option\"><b>"._DBESTRATED." $topdownloads </b></font></center><br>";
    }
    echo "</td></tr>"
	."<tr><td><center>"._NOTE." $downloadvotemin "._TVOTESREQ."<br>"
	.""._SHOWTOP.":  [ <a href=\"modules.php?name=$module_name&d_op=TopRated&amp;ratenum=10&amp;ratetype=num\">10</a> - "
	."<a href=\"modules.php?name=$module_name&d_op=TopRated&amp;ratenum=25&amp;ratetype=num\">25</a> - "
    	."<a href=\"modules.php?name=$module_name&d_op=TopRated&amp;ratenum=50&amp;ratetype=num\">50</a> | "
    	."<a href=\"modules.php?name=$module_name&d_op=TopRated&amp;ratenum=1&amp;ratetype=percent\">1%</a> - "
    	."<a href=\"modules.php?name=$module_name&d_op=TopRated&amp;ratenum=5&amp;ratetype=percent\">5%</a> - "
    	."<a href=\"modules.php?name=$module_name&d_op=TopRated&amp;ratenum=10&amp;ratetype=percent\">10%</a> ]</center><br><br></td></tr>";
    $sql = "SELECT lid, cid, title, description, date, hits, url, downloadratingsummary, totalvotes, totalcomments, filesize, version, homepage FROM ".$prefix."_downloads_downloads WHERE downloadratingsummary != 0 AND totalvotes >= $downloadvotemin ORDER BY downloadratingsummary DESC LIMIT 0,$topdownloads";
    $result = $db->sql_query($sql);
    echo "<tr><td>";
    while ($row = $db->sql_fetchrow($result)) {
	$lid = $row[lid];
	$cid = $row[cid];
	$title = $row[title];
	$description = $row[description];
	$time = $row[date];
	$hits = $row[hits];
	$url = $row[url];
	$downloadratingsummary = $row[downloadratingsummary];
	$totalvotes = $row[totalvotes];
	$totalcomments = $row[totalcomments];
	$filesize = $row[filesize];
	$version = $row[version];
	$homepage = $row[homepage];
	$downloadratingsummary = number_format($downloadratingsummary, $mainvotedecimal);
	$title = stripslashes($title);
	$description = stripslashes($description);
	if (is_admin($admin)) {
		if (eregi("http", $url)) { echo "<a href=\"admin.php?op=DownloadsModDownload&amp;lid=$lid\"><img src=\"modules/$module_name/images/icon30.gif\" border=\"0\" alt=\""._EDIT."\"></a>"; }
		else { echo "<a href=\"admin.php?op=DownloadsModDownload&amp;lid=$lid\"><img src=\"modules/$module_name/images/download.gif\" border=\"0\" alt=\""._EDIT."\"></a>"; }
	} else {
		if (eregi("http", $url)) { echo "<img src=\"modules/$module_name/images/icon30.gif\" border=\"0\" alt=\"\">"; }
		else { echo "<img src=\"modules/$module_name/images/download.gif\" border=\"0\" alt=\"\">"; }
	}
    echo "&nbsp;<a href=\"modules.php?name=$module_name&d_op=getit&amp;lid=$lid\" TARGET=\"_blank\" CLASS=\"title\">$title</a>";
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
	echo "<b>"._ADDEDON.":</b> $datetime <b>"._UDOWNLOADS.":</b> $hits";
	$transfertitle = str_replace (" ", "_", $title);
	/* voting & comments stats */
        if ($totalvotes == 1) {
	    $votestring = _VOTE;
        } else {
	    $votestring = _VOTES;
	}
	if ($downloadratingsummary!="0" || $downloadratingsummary!="0.0") {
	    echo " <b>"._RATING.":</b> <b>$downloadratingsummary</b> ($totalvotes $votestring)";
	}
	echo "<br>";
	$sql2 = "SELECT title FROM ".$prefix."_downloads_categories WHERE cid=$cid";
	$result2 = $db->sql_query($sql2);
	$row2 = $db->sql_fetchrow($result2);
	$ctitle = $row2[title];
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