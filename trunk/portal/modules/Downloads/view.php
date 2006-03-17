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
// FUNCTION : viewdownload($cid, $min, $orderby, $show)
// ######################################################################
function viewdownload($cid, $min, $orderby, $show) {
    global $prefix, $dbi, $admin, $perpage, $module_name, $user, $bgcolor1, $bgcolor3, $show_links_num;
    include("header.php");
    if (!isset($min)) $min=0;
    if (!isset($max)) $max=$min+$perpage;
    if(isset($orderby)) {
	$orderby = convertorderbyin($orderby);
    } else {
	$orderby = "title ASC";
    }
    if ($show!="") {
	$perpage = $show;
    } else {
	$show=$perpage;
    }

    $result = sql_query("SELECT title,cdescription,ldescription,parentid FROM ".$prefix."_downloads_categories WHERE cid=$cid", $dbi);
	list($title,$cdescription,$ldescription,$parentid)=sql_fetch_row($result, $dbi);
	$title=getparentlink($parentid,$title);
	$title="<a href=modules.php?name=$module_name>"._MAIN."</a>/$title";

    menu(1);
    echo "<br>";
	if ($ldescription != '') {
		OpenTable2();
		echo "$ldescription";
		CloseTable2();
		echo "<BR>";
	}
    OpenTable();
	if ($cdescription != '') { $cdescription = "<BR>".$cdescription; }
	echo "<center><font class=\"title\"><b>"._CATEGORY.": $title</b></font>$cdescription</center>";
    echo "<table border=\"0\" cellspacing=\"10\" cellpadding=\"0\" align=\"center\"><tr>";
    $result2 = sql_query("SELECT cid, title, cdescription FROM ".$prefix."_downloads_categories WHERE parentid=$cid order by title", $dbi);
    $count = 0;
    while(list($cid2, $title2, $cdescription2) = sql_fetch_row($result2, $dbi)) {
    	if ($show_links_num == 1) {
            $cresult = sql_query("SELECT * FROM ".$prefix."_downloads_downloads WHERE cid=$cid2", $dbi);
            $cnumrows = sql_num_rows($cresult, $dbi);
            $cnumm = " ($cnumrows)";
        } else { $cnum = ""; }
		if ($cnumrows > 0) { $folder = "modules/Downloads/images/openfolder.gif"; } else { $folder = "modules/Downloads/images/closedfolder.gif"; }
		if (is_admin($admin)) { $folderImg = "<A HREF=\"admin.php?op=DownloadsModCat&amp;cat=$cid2\"><IMG SRC=\"$folder\" BORDER=0 ALT=\""._EDIT."\"></A>"; } else { $folderImg = "<IMG SRC=\"$folder\" BORDER=0 ALT=\"$title2\">"; }
		echo "<td><font class=\"title\">$folderImg <a href=\"modules.php?name=$module_name&d_op=viewdownload&amp;cid=$cid2\"><b>$title2</b></a></font>$cnumm";
		categorynewdownloadgraphic($cid2);
		if ($cdescription2) { echo "<BR><font class=\"content\">$cdescription2</font><br>"; } else { echo "<br>"; }
		$result3 = sql_query("SELECT cid, title FROM ".$prefix."_downloads_categories WHERE parentid=$cid2 order by title limit 0,3", $dbi);
		$space = 0;
		while(list($cid3, $title3) = sql_fetch_row($result3, $dbi)) {
    		if ($space>0) { echo ",&nbsp;"; }
    		if ($show_links_num == 1) {
            	$cresult2 = sql_query("SELECT * FROM ".$prefix."_downloads_downloads WHERE cid=$cid3", $dbi);
            	$cnumrows2 = sql_num_rows($cresult2, $dbi);
            	$cnum = " ($cnumrows2)";
        	} else { $cnum = ""; }
	    	echo "<font class=\"content\"><a href=\"modules.php?name=$module_name&d_op=viewdownload&amp;cid=$cid3\">$title3</a></font>$cnum";
	    	$space++;
		}
		if ($count<1) {
		    echo "</td><td>&nbsp;&nbsp;&nbsp;&nbsp;</td>";
		    $dum = 1;
		}
		$count++;
		if ($count==2) {
	    	echo "</td></tr><tr>";
	    	$count = 0;
	    	$dum = 0;
		}
    }
    if ($dum == 1) { echo "</tr></table>"; } elseif ($dum == 0) { echo "<td></td></tr></table>"; }

    echo "<hr noshade size=\"1\">";
    $orderbyTrans = convertorderbytrans($orderby);
    echo "<center><font class=\"content\">"._SORTDOWNLOADSBY.": "
        .""._TITLE." (<a href=\"modules.php?name=$module_name&d_op=viewdownload&amp;cid=$cid&amp;orderby=titleA\">A</a>\<a href=\"modules.php?name=$module_name&d_op=viewdownload&amp;cid=$cid&amp;orderby=titleD\">D</a>) "
        .""._DATE." (<a href=\"modules.php?name=$module_name&d_op=viewdownload&amp;cid=$cid&amp;orderby=dateA\">A</a>\<a href=\"modules.php?name=$module_name&d_op=viewdownload&amp;cid=$cid&amp;orderby=dateD\">D</a>) "
        .""._RATING." (<a href=\"modules.php?name=$module_name&d_op=viewdownload&amp;cid=$cid&amp;orderby=ratingA\">A</a>\<a href=\"modules.php?name=$module_name&d_op=viewdownload&amp;cid=$cid&amp;orderby=ratingD\">D</a>) "
        .""._POPULARITY." (<a href=\"modules.php?name=$module_name&d_op=viewdownload&amp;cid=$cid&amp;orderby=hitsA\">A</a>\<a href=\"modules.php?name=$module_name&d_op=viewdownload&amp;cid=$cid&amp;orderby=hitsD\">D</a>)"
	."<br><b>"._RESSORTED.": $orderbyTrans</b></font></center>";
    echo "<hr noshade size=\"1\">";
    $result=sql_query("SELECT lid, title, url, description, date, hits, downloadratingsummary, totalvotes, totalcomments, filesize, version, homepage FROM ".$prefix."_downloads_downloads WHERE cid=$cid order by $orderby limit $min,$perpage ", $dbi);
    $fullcountresult=sql_query("SELECT lid FROM ".$prefix."_downloads_downloads WHERE cid=$cid", $dbi);
    $totalselecteddownloads = sql_num_rows($fullcountresult, $dbi);
    echo "<table width=\"100%\" cellspacing=\"0\" cellpadding=\"10\" border=\"0\"><tr><td><font class=\"content\">";
    $x=0;
	$color = $bgcolor3;
    while(list($lid, $title, $url, $description, $time, $hits, $downloadratingsummary, $totalvotes, $totalcomments, $filesize, $version, $homepage)=sql_fetch_row($result, $dbi)) {
	$downloadratingsummary = number_format($downloadratingsummary, $mainvotedecimal);
	$title = stripslashes($title);
	$description = stripslashes($description);
	$color = switchColor($color);
	echo "<TABLE BORDER=0 CELLPADDING=2 CELLSPACING=0 WIDTH=100%><TR BGCOLOR=\"$color\"><TD>";

	if (is_admin($admin)) {
		if (eregi("http", $url)) { echo "<a href=\"admin.php?op=DownloadsModDownload&amp;lid=$lid\"><img src=\"modules/$module_name/images/icon30.gif\" border=\"0\" alt=\""._EDIT."\"></a>"; }
		else { echo "<a href=\"admin.php?op=DownloadsModDownload&amp;lid=$lid\"><img src=\"modules/$module_name/images/download.gif\" border=\"0\" alt=\""._EDIT."\"></a>"; }
	} else {
		if (eregi("http", $url)) { echo "<img src=\"modules/$module_name/images/icon30.gif\" border=\"0\" alt=\"\">"; }
		else { echo "<img src=\"modules/$module_name/images/download.gif\" border=\"0\" alt=\"\">"; }
	}
    echo "</td><TD WIDTH=100% CLASS=\"title\" VALIGN=TOP><a href=\"modules.php?name=$module_name&d_op=getit&amp;lid=$lid\" TARGET=\"_blank\"><B>$title</B></a>";
	newdownloadgraphic($datetime, $time);
	popgraphic($hits);
	detecteditorial($lid, $transfertitle, 1);
	echo "</TD></TR><TR BGCOLOR=\"$color\"><TD COLSPAN=2>";
	echo "<DIV ALIGN=\"JUSTIFY\"><b>"._DESCRIPTION.":</b> $description</TD></TR><TR BGCOLOR=\"$color\"><TD COLSPAN=2>";
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
	    echo " <b>"._RATING.":</b> $downloadratingsummary ($totalvotes $votestring)";
	}
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
	echo "</DIV></TD></TR></TABLE><br>";
	$x++;
    }
    echo "</font>";
    $orderby = convertorderbyout($orderby);
    /* Calculates how many pages exist. Which page one should be on, etc... */
    $downloadpagesint = ($totalselecteddownloads / $perpage);
    $downloadpageremainder = ($totalselecteddownloads % $perpage);
    if ($downloadpageremainder != 0) {
    	$downloadpages = ceil($downloadpagesint);
    	if ($totalselecteddownloads < $perpage) {
    		$downloadpageremainder = 0;
    	}
    } else {
    	$downloadpages = $downloadpagesint;
    }
    /* Page Numbering */
    if ($downloadpages!=1 && $downloadpages!=0) {
        echo "<br><br>";
      	echo ""._SELECTPAGE.": ";
     	$prev=$min-$perpage;
     	if ($prev>=0) {
    	    echo "&nbsp;&nbsp;<b>[ <a href=\"modules.php?name=$module_name&d_op=viewdownload&amp;cid=$cid&amp;min=$prev&amp;orderby=$orderby&amp;show=$show\">";
    	    echo " &lt;&lt; "._PREVIOUS."</a> ]</b> ";
  	}
    	$counter = 1;
 	$currentpage = ($max / $perpage);
       	while ($counter<=$downloadpages ) {
      	    $cpage = $counter;
      	    $mintemp = ($perpage * $counter) - $perpage;
      	    if ($counter == $currentpage) {
		echo "<b>$counter</b>&nbsp";
	    } else {
		echo "<a href=\"modules.php?name=$module_name&d_op=viewdownload&amp;cid=$cid&amp;min=$mintemp&amp;orderby=$orderby&amp;show=$show\">$counter</a> ";
	    }
       	    $counter++;
       	}
     	$next=$min+$perpage;
     	if ($x>=$perpage) {
    		echo "&nbsp;&nbsp;<b>[ <a href=\"modules.php?name=$module_name&d_op=viewdownload&amp;cid=$cid&amp;min=$max&amp;orderby=$orderby&amp;show=$show\">";
    		echo " "._NEXT." &gt;&gt;</a> ]</b> ";
     	}
    }
    echo "</td></tr></table>";
    CloseTable();
    include("footer.php");
}

// ######################################################################
// FUNCTION : viewsdownload($sid, $min, $orderby, $show)
// ######################################################################
function viewsdownload($sid, $min, $orderby, $show) {
    global $prefix, $dbi, $admin, $module_name, $user;
    include("modules/$module_name/d_config.php");
    include("header.php");
    menu(1);
    if (!isset($min)) $min=0;
    if (!isset($max)) $max=$min+$perpage;
    if(isset($orderby)) {
	$orderby = convertorderbyin($orderby);
    } else {
	$orderby = "title ASC";
    }
    if ($show!="") {
	$perpage = $show;
    } else {
	$show=$perpage;
    }
    echo "<br>";
    OpenTable();
    $result = sql_query("SELECT title,parentid FROM ".$prefix."_downloads_categories WHERE cid=$cid", $dbi);
	list($title,$parentid)=sql_fetch_row($result, $dbi);
	$title=getparentlink($parentid,$title);
	$title="<a href=modules.php?name=$module_name>"._MAIN."</a>/$title";
    echo "<center><font class=\"option\"><b>"._CATEGORY.": $title</b></font></center><br>";
    echo "<table border=\"0\" cellspacing=\"10\" cellpadding=\"0\" align=\"center\"><tr>";
    $result2 = sql_query("SELECT cid, title, cdescription FROM ".$prefix."_downloads_categories WHERE parentid=$cid order by title", $dbi);
    $count = 0;
    while(list($cid2, $title2, $cdescription2) = sql_fetch_row($result2, $dbi)) {
	echo "<td><font class=\"option\"><strong><big>·</big></strong> <a href=\"modules.php?name=$module_name&d_op=viewdownload&amp;cid=$cid2\"><b>$title2</b></a></font>";
	categorynewdownloadgraphic($cid2);
	if ($cdescription2) {
	    echo "<font class=\"content\">$cdescription2</font><br>";
	} else {
	    echo "<br>";
	}
	$result3 = sql_query("SELECT cid, title FROM ".$prefix."_downloads_categories WHERE parentid=$cid2 order by title limit 0,3", $dbi);
	$space = 0;
	while(list($cid3, $title3) = sql_fetch_row($result3, $dbi)) {
    	    if ($space>0) {
		echo ",&nbsp;";
	    }
	    echo "<font class=\"content\"><a href=\"modules.php?name=$module_name&d_op=viewdownload&amp;cid=$cid3\">$title3</a></font>";
	    $space++;
	}
	if ($count<1) {
	    echo "</td><td>&nbsp;&nbsp;&nbsp;&nbsp;</td>";
	    $dum = 1;
	}
	$count++;
	if ($count==2) {
	    echo "</td></tr><tr>";
	    $count = 0;
	    $dum = 0;
	}
    }
    if ($dum == 1) {
	echo "</tr></table>";
    } elseif ($dum == 0) {
	echo "<td></td></tr></table>";
    }

    echo "<hr noshade size=\"1\">";
    $orderbyTrans = convertorderbytrans($orderby);
    echo "<br><center><font class=\"content\">"._SORTDOWNLOADSBY.": "
	.""._TITLE." (<a href=\"modules.php?name=$module_name&d_op=viewdownload&amp;sid=$sid&amp;orderby=titleA\">A</a>\<a href=\"modules.php?name=$module_name&d_op=viewdownload&amp;sid=$sid&amp;orderby=titleD\">D</a>)"
	." "._DATE." (<a href=\"modules.php?name=$module_name&d_op=viewdownload&amp;sid=$sid&amp;orderby=dateA\">A</a>\<a href=\"modules.php?name=$module_name&d_op=viewdownload&amp;sid=$sid&amp;orderby=dateD\">D</a>)"
	." "._RATING." (<a href=\"modules.php?name=$module_name&d_op=viewdownload&amp;sid=$sid&amp;orderby=ratingA\">A</a>\<a href=\"modules.php?name=$module_name&d_op=viewdownload&amp;sid=$sid&amp;orderby=ratingD\">D</a>)"
        ." "._POPULARITY." (<a href=\"modules.php?name=$module_name&d_op=viewdownload&amp;sid=$sid&amp;orderby=hitsA\">A</a>\<a href=\"modules.php?name=$module_name&d_op=viewdownload&amp;sid=$sid&amp;orderby=hitsD\">D</a>)"
	."<br><b>"._RESSORTED.": $orderbyTrans</b></font></center><br><br>";
    $result=sql_query("SELECT lid, url, title, description, date, hits, downloadratingsummary, totalvotes, totalcomments, filesize, version, homepage FROM ".$prefix."_downloads_downloads WHERE sid=$sid order by $orderby limit $min,$perpage", $dbi);
    $fullcountresult=sql_query("SELECT lid, title, description, date, hits, downloadratingsummary, totalvotes, totalcomments FROM ".$prefix."_downloads_downloads WHERE sid=$sid", $dbi);
    $totalselecteddownloads = sql_num_rows($fullcountresult, $dbi);
    echo "<table width=\"100%\" cellspacing=\"0\" cellpadding=\"10\" border=\"0\"><tr><td><font class=\"content\">";
    $x=0;
    while(list($lid, $url, $title, $description, $time, $hits, $downloadratingsummary, $totalvotes, $totalcomments, $filesize, $version, $homepage)=sql_fetch_row($result, $dbi)) {
	$downloadratingsummary = number_format($downloadratingsummary, $mainvotedecimal);
	$title = stripslashes($title); $description = stripslashes($description);
        global $prefix, $dbi, $admin;
	if (is_admin($admin)) {
	    echo "<a href=\"admin.php?op=DownloadsModDownload&amp;lid=$lid\"><img src=\"modules/$module_name/images/lwin.gif\" border=\"0\" alt=\""._EDIT."\"></a>&nbsp;&nbsp;";
	} else {
	    echo "<img src=\"modules/$module_name/images/lwin.gif\" border=\"0\" alt=\"\">&nbsp;&nbsp;";
	}
        echo "<a href=\"modules.php?name=$module_name&d_op=getit&amp;lid=$lid\">$title</a>";
	newdownloadgraphic($datetime, $time);
	popgraphic($hits);
        /* code for *editor review* insert here	*/
	detecteditorial($lid, $transfertitle, 1);
	echo "<br><b>"._DESCRIPTION.":</b> $description<br>";
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
	    echo " <b>"._RATING.":</b> $downloadratingsummary ($totalvotes $votestring)";
        }
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
	$x++;
    }
    echo "</font>";
    $orderby = convertorderbyout($orderby);
    /* Calculates how many pages exist.  Which page one should be on, etc... */
    $downloadpagesint = ($totalselecteddownloads / $perpage);
    $downloadpageremainder = ($totalselecteddownloads % $perpage);
    if ($downloadpageremainder != 0) {
	$downloadpages = ceil($downloadpagesint);
        if ($totalselecteddownloads < $perpage) {
    	    $downloadpageremainder = 0;
        }
    } else {
    	$downloadpages = $downloadpagesint;
    }
    /* Page Numbering */
    if ($downloadpages!=1 && $downloadpages!=0) {
	echo "<br><br>"
    	    .""._SELECTPAGE.": ";
        $prev=$min-$perpage;
        if ($prev>=0) {
    	    echo "&nbsp;&nbsp;<b>[ <a href=\"modules.php?name=$module_name&d_op=viewdownload&amp;sid=$sid&amp;min=$prev&amp;orderby=$orderby&amp;show=$show\">"
    		." &lt;&lt; "._PREVIOUS."</a> ]</b> ";
      	}
        $counter = 1;
        $currentpage = ($max / $perpage);
        while ($counter<=$downloadpages ) {
    	    $cpage = $counter;
            $mintemp = ($perpage * $counter) - $perpage;
            if ($counter == $currentpage) {
		echo "<b>$counter</b>&nbsp";
	    } else {
		echo "<a href=\"modules.php?name=$module_name&d_op=viewdownload&amp;sid=$sid&amp;min=$mintemp&amp;orderby=$orderby&amp;show=$show\">$counter</a> ";
	    }
            $counter++;
        }
        $next=$min+$perpage;
        if ($x>=$perpage) {
    	    echo "&nbsp;&nbsp;<b>[ <a href=\"modules.php?name=$module_name&d_op=viewdownload&amp;sid=$sid&amp;min=$max&amp;orderby=$orderby&amp;show=$show\">"
    		." "._NEXT." &gt;&gt;</a> ]</b> ";
        }
    }
    echo "</td></tr></table>";
    CloseTable();
    include("footer.php");
}

?>