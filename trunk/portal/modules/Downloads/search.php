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
// FUNCTION : search($query, $min, $orderby, $show)
// ######################################################################
function search($query, $min, $orderby, $show) {
    global $prefix, $dbi, $admin, $bgcolor2, $module_name;
    include("modules/$module_name/d_config.php");
    include("header.php");
    if (!isset($min)) $min=0;
    if (!isset($max)) $max=$min+$downloadsresults;
    if(isset($orderby)) {
	$orderby = convertorderbyin($orderby);
    } else {
	$orderby = "title ASC";
    }
    if ($show!="") {
	$downloadsresults = $show;
    } else {
	$show=$downloadsresults;
    }
    $query = check_html($query, nohtml);
    $query = addslashes($query);
    $result = sql_query("SELECT lid, cid, title, url, description, date, hits, downloadratingsummary, totalvotes, totalcomments, filesize, version, homepage FROM ".$prefix."_downloads_downloads WHERE title LIKE '%$query%' OR description LIKE '%$query%' ORDER BY $orderby LIMIT $min,$downloadsresults", $dbi);
    $fullcountresult = sql_query("SELECT lid, title, description, date, hits, downloadratingsummary, totalvotes, totalcomments FROM ".$prefix."_downloads_downloads WHERE title LIKE '%$query%' OR description LIKE '%$query%' ", $dbi);
    $totalselecteddownloads = sql_num_rows($fullcountresult, $dbi);
    $nrows = sql_num_rows($result, $dbi);
    $x=0;
    $the_query = stripslashes($query);
    $the_query = str_replace("\'", "'", $the_query);
    menu(1);
    echo "<br>";
    OpenTable();
    if ($query != "") {
    	if ($nrows>0) {
	    echo "<font class=\"option\">"._SEARCHRESULTS4.": <b>$the_query</b></font><br><br>"
	        ."<table width=\"100%\" bgcolor=\"$bgcolor2\"><tr><td><font class=\"option\"><b>"._USUBCATEGORIES."</b></font></td></tr></table>";
    	    $result2 = sql_query("SELECT cid, title FROM ".$prefix."_downloads_categories WHERE title LIKE '%$query%' ORDER BY title DESC", $dbi);
	    while(list($cid, $stitle) = sql_fetch_row($result2, $dbi)) {
	        $res = sql_query("SELECT * FROM ".$prefix."_downloads_downloads WHERE cid=$cid", $dbi);
	        $numrows = sql_num_rows($res, $dbi);
    	        $result3 = sql_query("SELECT cid,title,parentid FROM ".$prefix."_downloads_categories WHERE cid=$cid", $dbi);
    	        list($cid3,$title3,$parentid3) = sql_fetch_row($result3, $dbi);
    	        if ($parentid3>0) $title3 = getparent($parentid3,$title3);
    	        $title3 = ereg_replace($query, "<b>$query</b>", $title3);
    	        echo "<strong><big>·</big></strong>&nbsp;<a href=\"modules.php?name=$module_name&d_op=viewdownload&amp;cid=$cid\">$title3</a> ($numrows)<br>";
	    }
	    echo "<br><table width=\"100%\" bgcolor=\"$bgcolor2\"><tr><td><font class=\"option\"><b>"._UDOWNLOADS."</b></font></td></tr></table>";
    	    $orderbyTrans = convertorderbytrans($orderby);
    	    echo "<center><font class=\"content\">"._SORTDOWNLOADSBY.": "
    		.""._TITLE." (<a href=\"modules.php?name=$module_name&d_op=search&amp;query=$the_query&amp;orderby=titleA\">A</a>\<a href=\"modules.php?name=$module_name&d_op=search&amp;query=$the_query&amp;orderby=titleD\">D</a>) "
    		.""._DATE." (<a href=\"modules.php?name=$module_name&d_op=search&amp;query=$the_query&amp;orderby=dateA\">A</a>\<a href=\"modules.php?name=$module_name&d_op=search&amp;query=$the_query&amp;orderby=dateD\">D</a>) "
    		.""._RATING." (<a href=\"modules.php?name=$module_name&d_op=search&amp;query=$the_query&amp;orderby=ratingA\">A</a>\<a href=\"modules.php?name=$module_name&d_op=search&amp;query=$the_query&amp;orderby=ratingD\">D</a>) "
    		.""._POPULARITY." (<a href=\"modules.php?name=$module_name&d_op=search&amp;query=$the_query&amp;orderby=hitsA\">A</a>\<a href=\"modules.php?name=$module_name&d_op=search&amp;query=$the_query&amp;orderby=hitsD\">D</a>)"
    		."<br>"._RESSORTED.": $orderbyTrans</center><br><br><br>";
	    while(list($lid, $cid, $title, $url, $description, $time, $hits, $downloadratingsummary, $totalvotes, $totalcomments, $filesize, $version, $homepage) = sql_fetch_row($result, $dbi)) {
			$downloadratingsummary = number_format($downloadratingsummary, $mainvotedecimal);
			$title = stripslashes($title); $description = stripslashes($description);
			$transfertitle = str_replace (" ", "_", $title);
			$title = ereg_replace($query, "<b>$query</b>", $title);
    		global $prefix, $dbi, $admin;
			if (is_admin($admin)) {
				if (eregi("http", $url)) { echo "<a href=\"admin.php?op=DownloadsModDownload&amp;lid=$lid\"><img src=\"modules/$module_name/images/icon30.gif\" border=\"0\" alt=\""._EDIT."\"></a>"; }
				else { echo "<a href=\"admin.php?op=DownloadsModDownload&amp;lid=$lid\"><img src=\"modules/$module_name/images/download.gif\" border=\"0\" alt=\""._EDIT."\"></a>"; }
			} else {
				if (eregi("http", $url)) { echo "<img src=\"modules/$module_name/images/icon30.gif\" border=\"0\" alt=\"\">"; }
				else { echo "<img src=\"modules/$module_name/images/download.gif\" border=\"0\" alt=\"\">"; }
			}
			echo "&nbsp;<a href=\"modules.php?name=$module_name&d_op=getit&amp;lid=$lid\" CLASS=\"title\" TARGET=\"_blank\">$title</a>";
			newdownloadgraphic($datetime, $time);
    		popgraphic($hits);
			detecteditorial($lid, $transfertitle, 1);
			echo "<br>";
			$description = ereg_replace($query, "<b>$query</b>", $description);
			echo "<b>"._DESCRIPTION.":</b> $description<br>";
			setlocale (LC_TIME, $locale);
			ereg ("([0-9]{4})-([0-9]{1,2})-([0-9]{1,2}) ([0-9]{1,2}):([0-9]{1,2}):([0-9]{1,2})", $time, $datetime);
			$datetime = strftime(""._LINKSDATESTRING."", mktime($datetime[4],$datetime[5],$datetime[6],$datetime[2],$datetime[3],$datetime[1]));
			$datetime = ucfirst($datetime);
			echo "<b>"._VERSION.":</b> $version <b>"._FILESIZE.":</b> ".CoolSize($filesize)."<br>";
			echo "<b>"._ADDEDON.":</b> $datetime <b>"._UDOWNLOADS.":</b> $hits";
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
			$result3 = sql_query("SELECT cid,title,parentid FROM ".$prefix."_downloads_categories WHERE cid=$cid", $dbi);
			list($cid3,$title3,$parentid3) = sql_fetch_row($result3, $dbi);
			if ($parentid3>0) $title3 = getparent($parentid3,$title3);
			echo "<B>"._CATEGORY.":</B> <A HREF=\"modules.php?name=Downloads&d_op=viewdownload&cid=$cid\">$title3</A>";
    		if ($homepage == "") {
		    	echo "<br>";
			} else {
		    	echo "<br><a href=\"$homepage\" target=\"new\">"._HOMEPAGE."</a> | ";
			}
    		echo "<a href=\"modules.php?name=$module_name&d_op=ratedownload&amp;lid=$lid&amp;ttitle=$transfertitle\">"._RATERESOURCE."</a>";
			echo " | <a href=\"modules.php?name=$module_name&d_op=viewdownloaddetails&amp;lid=$lid&amp;ttitle=$transfertitle\">"._DETAILS."</a>";
    		if ($totalcomments != 0) {
	    	    echo " | <a href=\"modules.php?name=$module_name&d_op=viewdownloadcomments&amp;lid=$lid&amp;ttitle=$transfertitle>"._SCOMMENTS." ($totalcomments)</a>";
			}
			detecteditorial($lid, $transfertitle, 0);
			echo "<BR><BR>";
			$x++;
	    }
	    echo "</font>";
    	$orderby = convertorderbyout($orderby);
	} else {
	    echo "<br><br><center><font class=\"option\"><b>"._NOMATCHES."</b></font><br><br>"._GOBACK."<br></center>";
	}
    /* Calculates how many pages exist.  Which page one should be on, etc... */
    $downloadpagesint = ($totalselecteddownloads / $downloadsresults);
    $downloadpageremainder = ($totalselecteddownloads % $downloadsresults);
    if ($downloadpageremainder != 0) {
    	$downloadpages = ceil($downloadpagesint);
        if ($totalselecteddownloads < $downloadsresults) {
    	    $downloadpageremainder = 0;
	}
    } else {
    	$downloadpages = $downloadpagesint;
    }
    /* Page Numbering */
    if ($downloadpages!=1 && $downloadpages!=0) {
	echo "<br><br>"
	    .""._SELECTPAGE.": ";
	$prev=$min-$downloadsresults;
	if ($prev>=0) {
    	    echo "&nbsp;&nbsp;<b>[ <a href=\"modules.php?name=$module_name&d_op=search&amp;query=$the_query&amp;min=$prev&amp;orderby=$orderby&amp;show=$show\">"
    		." &lt;&lt; "._PREVIOUS."</a> ]</b> ";
      	}
	$counter = 1;
        $currentpage = ($max / $downloadsresults);
        while ($counter<=$downloadpages ) {
    	    $cpage = $counter;
            $mintemp = ($perpage * $counter) - $downloadsresults;
            if ($counter == $currentpage) {
		echo "<b>$counter</b> ";
	    } else {
		echo "<a href=\"modules.php?name=$module_name&d_op=search&amp;query=$the_query&amp;min=$mintemp&amp;orderby=$orderby&amp;show=$show\">$counter</a> ";
	    }
            $counter++;
        }
        $next=$min+$downloadsresults;
        if ($x>=$perpage) {
    	    echo "&nbsp;&nbsp;<b>[ <a href=\"modules.php?name=$module_name&d_op=search&amp;query=$the_query&amp;min=$max&amp;orderby=$orderby&amp;show=$show\">"
    		." "._NEXT." &gt;&gt;</a> ]</b>";
        }
    }
    echo "<br><br><center><font class=\"content\">"
	.""._TRY2SEARCH." \"$the_query\" "._INOTHERSENGINES."<br>"
	."<a target=\"_blank\" href=\"http://www.altavista.com/cgi-bin/query?pg=q&amp;sc=on&amp;hl=on&amp;act=2006&amp;par=0&amp;q=$the_query&amp;kl=XX&amp;stype=stext\">Alta Vista</a> - "
	."<a target=\"_blank\" href=\"http://www.hotbot.com/?MT=$the_query&amp;DU=days&amp;SW=web\">HotBot</a> - "
	."<a target=\"_blank\" href=\"http://www.infoseek.com/Titles?qt=$the_query\">Infoseek</a> - "
	."<a target=\"_blank\" href=\"http://www.dejanews.com/dnquery.xp?QRY=$the_query\">Deja News</a> - "
	."<a target=\"_blank\" href=\"http://www.lycos.com/cgi-bin/pursuit?query=$the_query&amp;maxhits=20\">Lycos</a> - "
	."<a target=\"_blank\" href=\"http://search.yahoo.com/bin/search?p=$the_query\">Yahoo</a>"
	."<br>"
	."<a target=\"_blank\" href=\"http://es.linuxstart.com/cgi-bin/sqlsearch.cgi?pos=1&amp;query=$the_query&amp;language=&amp;advanced=&amp;urlonly=&amp;withid=\">LinuxStart</a> - "
	."<a target=\"_blank\" href=\"http://search.1stlinuxsearch.com/compass?scope=$the_query&amp;ui=sr\">1stLinuxSearch</a> - "
	."<a target=\"_blank\" href=\"http://www.google.com/search?q=$the_query\">Google</a> - "
	."<a target=\"_blank\" href=\"http://www.linuxdownloads.com/cgi-bin/search.cgi?query=$the_query&amp;engine=Downloads\">LinuxDownloads</a> - "
	."<a target=\"_blank\" href=\"http://www.freshmeat.net/search/?q=$the_query&amp;section=projects\">Freshmeat</a> - "
	."<a target=\"_blank\" href=\"http://www.justlinux.com/bin/search.pl?key=$the_query\">JustLinux</a>"
	."</font>";
    } else {
	echo "<center><font class=\"option\"><b>"._NOMATCHES."</b></font></center><br><br>";
    }
    CloseTable();
    include("footer.php");
}

?>