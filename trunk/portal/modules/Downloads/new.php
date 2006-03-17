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
// FUNCTION : NewDownloads($newdownloadshowdays)
// ######################################################################
function NewDownloads($newdownloadshowdays) {
    global $prefix, $db, $module_name;
    include("header.php");
    menu(1);
    echo "<br>";
    OpenTable();
    echo "<center><font class=\"option\"><b>"._NEWDOWNLOADS."</b></font></center><br>";
    $counter = 0;
    $allweekdownloads = 0;
    while ($counter <= 7-1){
	$newdownloaddayRaw = (time()-(86400 * $counter));
	$newdownloadday = date("d-M-Y", $newdownloaddayRaw);
	$newdownloadView = date("F d, Y", $newdownloaddayRaw);
	$newdownloadDB = Date("Y-m-d", $newdownloaddayRaw);
	$totaldownloads = $db->sql_numrows($db->sql_query("SELECT * FROM ".$prefix."_downloads_downloads WHERE date LIKE '%$newdownloadDB%'"));
	$counter++;
	$allweekdownloads = $allweekdownloads + $totaldownloads;
    }
    $counter = 0;
    while ($counter <=30-1){
        $newdownloaddayRaw = (time()-(86400 * $counter));
        $newdownloadDB = Date("Y-m-d", $newdownloaddayRaw);
        $totaldownloads = $db->sql_numrows($db->sql_query("SELECT * FROM ".$prefix."_downloads_downloads WHERE date LIKE '%$newdownloadDB%'"));
        $allmonthdownloads = $allmonthdownloads + $totaldownloads;
        $counter++;
    }
    echo "<center><b>"._TOTALNEWDOWNLOADS.":</b> "._LASTWEEK." - $allweekdownloads \ "._LAST30DAYS." - $allmonthdownloads<br>"
	.""._SHOW.": <a href=\"modules.php?name=$module_name&d_op=NewDownloads&amp;newdownloadshowdays=7\">"._1WEEK."</a> - <a href=\"modules.php?name=$module_name&d_op=NewDownloads&amp;newdownloadshowdays=14\">"._2WEEKS."</a> - <a href=\"modules.php?name=$module_name&d_op=NewDownloads&amp;newdownloadshowdays=30\">"._30DAYS."</a>"
	."</center><br>";
    /* List Last VARIABLE Days of Downloads */
    if (!isset($newdownloadshowdays)) {
	$newdownloadshowdays = 7;
    }
    echo "<br><center><b>"._DTOTALFORLAST." $newdownloadshowdays "._DAYS.":</b><br><br>";
    $counter = 0;
    $allweekdownloads = 0;
    while ($counter <= $newdownloadshowdays-1) {
	$newdownloaddayRaw = (time()-(86400 * $counter));
	$newdownloadday = date("d-M-Y", $newdownloaddayRaw);
	$newdownloadView = date("F d, Y", $newdownloaddayRaw);
	$newdownloadDB = Date("Y-m-d", $newdownloaddayRaw);
	$totaldownloads = $db->sql_numrows($db->sql_query("SELECT * FROM ".$prefix."_downloads_downloads WHERE date LIKE '%$newdownloadDB%'"));
	$counter++;
	$allweekdownloads = $allweekdownloads + $totaldownloads;
	if ($totaldownloads > 0) { $totaldownloads = "<B>$totaldownloads</B>"; }
	echo "<strong><big>&middot;</big></strong> <a href=\"modules.php?name=$module_name&d_op=NewDownloadsDate&amp;selectdate=$newdownloaddayRaw\">$newdownloadView</a>&nbsp($totaldownloads)<br>";
    }
    $counter = 0;
    $allmonthdownloads = 0;
    echo "</center>";
    CloseTable();
    include("footer.php");
}

// ######################################################################
// FUNCTION : NewDownloadsDate($selectdate)
// ######################################################################
function NewDownloadsDate($selectdate) {
    global $prefix, $db, $module_name, $admin, $user;
    $dateDB = (date("d-M-Y", $selectdate));
    $dateView = (date("F d, Y", $selectdate));
    include("header.php");
    menu(1);
    echo "<br>";
    OpenTable();
    $newdownloadDB = Date("Y-m-d", $selectdate);
    $totaldownloads = $db->sql_numrows($db->sql_query("SELECT * FROM ".$prefix."_downloads_downloads WHERE date LIKE '%$newdownloadDB%'"));
    echo "<font class=\"option\"><b>$dateView - $totaldownloads "._NEWDOWNLOADS."</b></font>"
	."<table width=\"100%\" cellspacing=\"0\" cellpadding=\"10\" border=\"0\"><tr><td><font class=\"content\">";
    $sql = "SELECT lid, cid, title, description, date, hits, url, downloadratingsummary, totalvotes, totalcomments, filesize, version, homepage FROM ".$prefix."_downloads_downloads WHERE date LIKE '%$newdownloadDB%' ORDER BY title ASC";
    $result = $db->sql_query($sql);
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
	$title = stripslashes($title); $description = stripslashes($description);
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
	echo "<br><b>"._DESCRIPTION.":</b> $description<br>";
	setlocale (LC_TIME, $locale);
	/* INSERT code for *editor review* here */
	ereg ("([0-9]{4})-([0-9]{1,2})-([0-9]{1,2}) ([0-9]{1,2}):([0-9]{1,2}):([0-9]{1,2})", $time, $datetime);
	$datetime = strftime(""._LINKSDATESTRING."", mktime($datetime[4],$datetime[5],$datetime[6],$datetime[2],$datetime[3],$datetime[1]));
	$datetime = ucfirst($datetime);
	echo "<b>"._VERSION.":</b> $version <b>"._FILESIZE.":</b> ".CoolSize($filesize)."<br>";
	echo "<b>"._ADDEDON.":</b> <b>$datetime</b> <b>"._UDOWNLOADS.":</b> $hits";
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
	$sql2 = "SELECT title FROM ".$prefix."_downloads_categories WHERE cid='$cid'";
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