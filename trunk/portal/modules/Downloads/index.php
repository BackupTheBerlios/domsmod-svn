<?php

// ######################################################################
// # PHP-Nuke                                                           #
// #====================================================================#
// #  Copyright (c) 2003 - Francisco Burzi                              #
// #  http://phpnuke.org/                                               #
// #====================================================================#
// # Paladin's Downloads                                                #
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

require_once("mainfile.php");
$module_name = basename(dirname(__FILE__));
get_lang($module_name);
$pagetitle = "- "._UDOWNLOADS."";
require_once("modules/$module_name/d_config.php");
$index = $viewrightblocks;

// ######################################################################
// FUNCTIONS :: START
// ######################################################################

// ######################################################################
// FUNCTION : switchColor($color)
// ######################################################################
function switchColor($color) {
	global $bgcolor1, $bgcolor3;
	if ($color == $bgcolor1) { $outColor = $bgcolor3; } else { $outColor = $bgcolor1; }
	return $outColor;
}

// ######################################################################
// FUNCTION : getparent($parentid,$title)
// ######################################################################
function getparent($parentid,$title) {
    global $prefix, $db;
    $sql = "SELECT cid, title, parentid FROM ".$prefix."_downloads_categories WHERE cid='$parentid'";
    $result = $db->sql_query($sql);
    $row = $db->sql_fetchrow($result);
    $cid = $row[cid];
    $ptitle = $row[title];
    $pparentid = $row[parentid];
    if ($ptitle!="") $title=$ptitle."/".$title;
    if ($pparentid!=0) {
	$title=getparent($pparentid,$ptitle);
    }
    return $title;
}

// ######################################################################
// FUNCTION : getparentlink($parentid,$title)
// ######################################################################
function getparentlink($parentid,$title) {
    global $prefix, $db, $module_name;
    $sql = "SELECT cid, title, parentid FROM ".$prefix."_downloads_categories WHERE cid='$parentid'";
    $result = $db->sql_query($sql);
    $row = $db->sql_fetchrow($result);
    $cid = $row[cid];
    $ptitle = $row[title];
    $pparentid = $row[parentid];
    if ($ptitle!="") $title="<a href=modules.php?name=$module_name&d_op=viewdownload&cid=$cid>$ptitle</a>/".$title;
    if ($pparentid!=0) {
    	$title=getparentlink($pparentid,$ptitle);
    }
    return $title;
}

// ######################################################################
// FUNCTION : menu($maindownload)
// ######################################################################
function menu($maindownload) {
    global $prefix, $dbi, $user_adddownload, $module_name;
    OpenTable();
    echo "<br><center><a href=\"modules.php?name=$module_name\"><img src=\"modules/$module_name/images/down-logo.gif\" border=\"0\" alt=\"\"></a><br><br>";
    echo "<form action=\"modules.php?name=$module_name&d_op=search&amp;query=$query\" method=\"post\">"
	."<font class=\"content\"><input type=\"text\" size=\"25\" name=\"query\"> <input type=\"submit\" value=\""._SEARCH."\"></font>"
	."</form>";
    echo "<font class=\"content\">[ ";
    if ($maindownload>0) {
	echo "<a href=\"modules.php?name=$module_name\">"._DOWNLOADSMAIN."</a> | ";
    }
    if ($user_adddownload == 1) {
	echo "<a href=\"modules.php?name=$module_name&d_op=AddDownload\">"._ADDDOWNLOAD."</a>"
	    ." | ";
    }
    echo "<a href=\"modules.php?name=$module_name&d_op=NewDownloads\">"._NEW."</a>"
	." | <a href=\"modules.php?name=$module_name&d_op=MostPopular\">"._POPULAR."</a>"
	." | <a href=\"modules.php?name=$module_name&d_op=TopRated\">"._TOPRATED."</a> ]"
	."</font></center>";
    CloseTable();
}

// ######################################################################
// FUNCTION : SearchForm()
// ######################################################################
function SearchForm() {
    global $module_name;
    echo "<form action=\"modules.php?name=$module_name\" method=\"post\">"
	."<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\">"
	."<tr><td><font class=\"content\"><imput type=\"hidden\" name=\"d_op\" value=\"search\"><input type=\"text\" size=\"25\" name=\"query\"> <input type=\"submit\" value=\""._SEARCH."\"></td></tr>"
	."</table>"
	."</form>";
}

// ######################################################################
// FUNCTION : downloadinfomenu($lid, $ttitle)
// ######################################################################
function downloadinfomenu($lid, $ttitle) {
    global $module_name, $user;
    $ttitle = stripslashes($ttitle);
    echo "<br><font class=\"content\">[ "
	."<a href=\"modules.php?name=$module_name&d_op=viewdownloadcomments&amp;lid=$lid&amp;ttitle=$ttitle\">"._DOWNLOADCOMMENTS."</a>"
	." | <a href=\"modules.php?name=$module_name&d_op=viewdownloaddetails&amp;lid=$lid&amp;ttitle=$ttitle\">"._ADDITIONALDET."</a>"
	." | <a href=\"modules.php?name=$module_name&d_op=viewdownloadeditorial&amp;lid=$lid&amp;ttitle=$ttitle\">"._EDITORREVIEW."</a>"
	." | <a href=\"modules.php?name=$module_name&d_op=modifydownloadrequest&amp;lid=$lid\">"._MODIFY."</a>";
    if (is_user($user)) {
	echo " | <a href=\"modules.php?name=$module_name&d_op=brokendownload&amp;lid=$lid\">"._REPORTBROKEN."</a>";
    }
    echo " ]</font>";
}

// ######################################################################
// FUNCTION : index()
// ######################################################################
function index() {
    global $prefix, $db, $module_name, $show_links_num, $show_links_info, $show_links_inum, $admin;
    include("header.php");
    $maindownload = 0;
    menu($maindownload);
    echo "<br>";
    OpenTable();
    echo "<center><font class=\"title\"><b>"._DOWNLOADSMAINCAT."</b></font></center><br>";
    echo "<table border=\"0\" cellspacing=\"10\" cellpadding=\"0\" align=\"center\"><tr>";
    $sql = "SELECT cid, title, cdescription FROM ".$prefix."_downloads_categories WHERE parentid='0' ORDER BY title";
    $result = $db->sql_query($sql);
    $count = 0;
    while ($row = $db->sql_fetchrow($result)) {
		$cid = $row[cid];
		$title = $row[title];
		$cdescription = $row[cdescription];
		if ($show_links_num == 1) {
	    	$cnumrows = $db->sql_numrows($db->sql_query("SELECT * FROM ".$prefix."_downloads_downloads WHERE cid='$cid'"));
	    	$cnumm = " ($cnumrows)";
		} else { $cnumm = ""; }
		if ($cnumrows > 0) { $folder = "modules/Downloads/images/openfolder.gif"; } else { $folder = "modules/Downloads/images/closedfolder.gif"; }
		if (is_admin($admin)) { $folderImg = "<A HREF=\"admin.php?op=DownloadsModCat&amp;cat=$cid\"><IMG SRC=\"$folder\" BORDER=0 ALT=\""._EDIT."\"></A>"; } else { $folderImg = "<IMG SRC=\"$folder\" BORDER=0 ALT=\"$title\">"; }
		echo "<td><font class=\"title\">$folderImg <a href=\"modules.php?name=$module_name&d_op=viewdownload&amp;cid=$cid\"><b>$title</b></a></font>$cnumm";
		categorynewdownloadgraphic($cid);
		if ($cdescription) { echo "<br><font class=\"content\">$cdescription</font><br>"; }
		else { echo "<br>"; }
		$sql2 = "SELECT cid, title FROM ".$prefix."_downloads_categories WHERE parentid='$cid' ORDER BY title LIMIT 0,3";
		$result2 = $db->sql_query($sql2);
		$space = 0;
		while ($row2 = $db->sql_fetchrow($result2)) {
	    	$cid = $row2[cid];
	    	$stitle = $row2[title];
    	    if ($space>0) { echo ",&nbsp;"; }
            if ($show_links_num == 1) {
        		$cnumrows2 = $db->sql_numrows($db->sql_query("SELECT * FROM ".$prefix."_downloads_downloads WHERE cid='$cid'"));
				$cnum = " ($cnumrows2)";
	    	} else { $cnumrows2 = ""; }
	    echo "<font class=\"content\"><a href=\"modules.php?name=$module_name&d_op=viewdownload&amp;cid=$cid\">$stitle</a>$cnum</font>";
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
    $numrows = $db->sql_numrows($db->sql_query("SELECT * FROM ".$prefix."_downloads_downloads"));
    $catnum = $db->sql_numrows($db->sql_query("SELECT * FROM ".$prefix."_downloads_categories"));
    echo "<center><font class=\"content\">"._THEREARE." <b>$numrows</b> "._DOWNLOADS." "._AND." <b>$catnum</b> "._CATEGORIES." "._INDB."</font></center>";
    CloseTable();
    if ($show_links_info == 1) {
	    echo "<BR>";
    	OpenTable();
	    echo "<TABLE BORDER=0 CELLPADDING=0 CELLSPACING=3 WIDTH=100%>"
    		."<TR><TD WIDTH=50% VALIGN=TOP ALIGN=CENTER>";
//		OpenTable2();
		echo "<DIV ALIGN=CENTER CLASS=\"title\">"._NEWDOWNLOADS."</DIV>";
//		CloseTable2();
    	echo "</TD><TD WIDTH=50% VALIGN=TOP ALIGN=CENTER>";
//		OpenTable2();
		echo "<DIV ALIGN=CENTER CLASS=\"title\">"._MOSTPOPULAR." $show_links_inum</DIV>";
//		CloseTable2();
    	echo "</TD></TR>"
    		."<TR><TD WIDTH=50% VALIGN=TOP ALIGN=CENTER>";
		OpenTable2();
		$content = "";
		$content .= "<TABLE BORDER=0 WIDTH=\"100%\">";
		$color = $bgcolor3;
		$sql = "SELECT lid, title, hits FROM ".$prefix."_downloads_downloads ORDER BY date DESC LIMIT 0, $show_links_inum";
		$result = $db->sql_query($sql);
		while ($row = $db->sql_fetchrow($result)) {
    		$title2 = ereg_replace("_", " ", $row[title]);
    		$color = switchColor($color);
	    	$content .= "<TR><TD BGCOLOR=\"$color\" ALIGN=LEFT><a href=\"modules.php?name=Downloads&amp;d_op=viewdownloaddetails&amp;lid=$row[lid]&amp;title=$row[title]\">$title2</a></TD>";
    		$content .= "<TD BGCOLOR=\"$color\" ALIGN=CENTER WIDTH=\"20\">$row[hits]</TD></TR>";
		}
		echo "$content</TABLE>";
		CloseTable2();
    	echo "|[ <A HREF=\"modules.php?name=Downloads&d_op=NewDownloads\">"._NEWDOWNLOADS."</A> ]|";
    	echo "</TD><TD WIDTH=50% VALIGN=TOP ALIGN=CENTER>";
		OpenTable2();
		$content = "";
		$content .= "<TABLE BORDER=0 WIDTH=\"100%\">";
		$color = $bgcolor3;
		$sql = "SELECT lid, title, hits FROM ".$prefix."_downloads_downloads ORDER BY hits DESC LIMIT 0, $show_links_inum";
		$result = $db->sql_query($sql);
		while ($row = $db->sql_fetchrow($result)) {
    		$title2 = ereg_replace("_", " ", $row[title]);
	    	$color = switchColor($color);
		    $content .= "<TR><TD BGCOLOR=\"$color\" ALIGN=LEFT><a href=\"modules.php?name=Downloads&amp;d_op=viewdownloaddetails&amp;lid=$row[lid]&amp;title=$row[title]\">$title2</a></TD>";
    		$content .= "<TD BGCOLOR=\"$color\" ALIGN=CENTER WIDTH=\"20\">$row[hits]</TD></TR>";
		}
		echo "$content</TABLE>";
		CloseTable2();
    	echo "|[ <A HREF=\"modules.php?name=Downloads&d_op=MostPopular\">"._MOSTPOPULAR." "._DOWNLOADS."</A> ]|";
    	echo "</TD></TR>"
    		."</TABLE>";
    	CloseTable();
	}
   	include("footer.php");
}

// ######################################################################
// FUNCTION : AddDownload()
// ######################################################################
function AddDownload() {
    global $prefix, $db, $cookie, $user, $downloads_anonadddownloadlock, $module_name;
    include("header.php");
    $maindownload = 1;
    menu(1);
    echo "<br>";
    OpenTable();
    echo "<center><font class=\"title\"><b>"._ADDADOWNLOAD."</b></font></center><br><br>";
    if (is_user($user) || $downloads_anonadddownloadlock != 1) {
    	echo "<b>"._INSTRUCTIONS.":</b><br>"
	    ."<strong><big>&middot;</big></strong> "._DSUBMITONCE."<br>"
	    ."<strong><big>&middot;</big></strong> "._DPOSTPENDING."<br>"
	    ."<strong><big>&middot;</big></strong> "._USERANDIP."<br>";
    	echo "<form method=\"post\" action=\"modules.php?name=$module_name&d_op=Add\">"
    	    .""._DOWNLOADNAME.": <input type=\"text\" name=\"title\" size=\"40\" maxlength=\"100\"><br>"
    	    .""._FILEURL.": <input type=\"text\" name=\"url\" size=\"50\" maxlength=\"100\" value=\"http://\"><br>";
    	echo ""._CATEGORY.": <select name=\"cat\">";
    	$sql = "SELECT cid, title, parentid FROM ".$prefix."_downloads_categories ORDER BY parentid,title";
	$result = $db->sql_query($sql);
    	while ($row = $db->sql_fetchrow($result)) {
	    $cid2 = $row[cid];
	    $ctitle2 = $row[title];
	    $parentid2 = $row[parentid];
    	    if ($parentid2!=0) $ctitle2=getparent($parentid2,$ctitle2);
    	    echo "<option value=\"$cid2\">$ctitle2</option>";
    	}
    	echo "</select><br><br>"
    	    .""._LDESCRIPTION."<br><textarea name=\"description\" cols=\"60\" rows=\"8\"></textarea><br><br>"
    	    .""._AUTHORNAME.": <input type=\"text\" name=\"auth_name\" size=\"30\" maxlength=\"60\"><br>"
    	    .""._AUTHOREMAIL.": <input type=\"text\" name=\"email\" size=\"30\" maxlength=\"60\"><br>"
	    .""._FILESIZE.": <input type=\"text\" name=\"filesize\" size=\"12\" maxlength=\"11\"> ("._INBYTES.")<br>"
	    .""._VERSION.": <input type=\"text\" name=\"version\" size=\"11\" maxlength=\"10\"><br>"
    	    .""._HOMEPAGE.": <input type=\"text\" name=\"homepage\" size=\"50\" maxlength=\"200\" value=\"http://\"><br><br>"
	    ."<input type=\"hidden\" name=\"d_op\" value=\"Add\">"
    	    ."<input type=\"submit\" value=\""._ADDTHISFILE."\"> "._GOBACK."<br><br>"
    	    ."</form>";
    } else {
    	echo "<center>"._DOWNLOADSNOTUSER1."<br>"
	    .""._DOWNLOADSNOTUSER2."<br><br>"
    	    .""._DOWNLOADSNOTUSER3."<br>"
    	    .""._DOWNLOADSNOTUSER4."<br>"
    	    .""._DOWNLOADSNOTUSER5."<br>"
    	    .""._DOWNLOADSNOTUSER6."<br>"
    	    .""._DOWNLOADSNOTUSER7."<br><br>"
    	    .""._DOWNLOADSNOTUSER8."";
    }
    CloseTable();
    include("footer.php");
}

// ######################################################################
// FUNCTION : Add($title, $url, $auth_name, $cat, $description, $email, $filesize, $version, $homepage)
// ######################################################################
function Add($title, $url, $auth_name, $cat, $description, $email, $filesize, $version, $homepage) {
    global $prefix, $db, $user;
    $sql = "SELECT url FROM ".$prefix."_downloads_downloads WHERE url='$url'";
    $result = $db->sql_query($sql);
    $numrows = $db->sql_numrows($result);
    if ($numrows>0) {
	include("header.php");
	menu(1);
	echo "<br>";
	OpenTable();
	echo "<center><b>"._DOWNLOADALREADYEXT."</b><br><br>"
	    .""._GOBACK."";
	CloseTable();
	include("footer.php");
    } else {
	if(is_user($user)) {
	    $user2 = base64_decode($user);
	    $cookie = explode(":", $user2);
	    cookiedecode($user);
	    $submitter = $cookie[1];
    }
// Check if Title exist
    if ($title=="") {
	include("header.php");
	menu(1);
	echo "<br>";
	OpenTable();
	echo "<center><b>"._DOWNLOADNOTITLE."</b><br><br>"
	    .""._GOBACK."";
	CloseTable();
	include("footer.php");
    }
// Check if URL exist
    if ($url=="") {
	include("header.php");
	menu(1);
	echo "<br>";
	OpenTable();
	echo "<center><b>"._DOWNLOADNOURL."</b><br><br>"
	    .""._GOBACK."";
	CloseTable();
	include("footer.php");
    }
// Check if Description exist
    if ($description=="") {
	include("header.php");
	menu(1);
	echo "<br>";
	OpenTable();
	echo "<center><b>"._DOWNLOADNODESC."</b><br><br>"
	    .""._GOBACK."";
	CloseTable();
	include("footer.php");
    }
    $cat = explode("-", $cat);
    if ($cat[1]=="") {
	$cat[1] = 0;
    }
    $title = stripslashes(FixQuotes($title));
    $url = stripslashes(FixQuotes($url));
    $description = stripslashes(FixQuotes($description));
    $auth_name = stripslashes(FixQuotes($auth_name));
    $email = stripslashes(FixQuotes($email));
    $filesize = ereg_replace("\.","",$filesize);
    $filesize = ereg_replace("\,","",$filesize);
    $db->sql_query("INSERT INTO ".$prefix."_downloads_newdownload VALUES (NULL, '$cat[0]', '$cat[1]', '$title', '$url', '$description', '$auth_name', '$email', '$submitter', '$filesize', '$version', '$homepage')");
    include("header.php");
    menu(1);
    echo "<br>";
    OpenTable();
    echo "<center><b>"._DOWNLOADRECEIVED."</b><br>";
    if ($email == "") {
	echo _CHECKFORIT;
    }
    CloseTable();
    include("footer.php");
    }
}

// ######################################################################
// FUNCTION : newdownloadgraphic($datetime, $time)
// ######################################################################
function newdownloadgraphic($datetime, $time) {
    global $module_name;
    echo "&nbsp;";
    setlocale (LC_TIME, $locale);
    ereg ("([0-9]{4})-([0-9]{1,2})-([0-9]{1,2}) ([0-9]{1,2}):([0-9]{1,2}):([0-9]{1,2})", $time, $datetime);
    $datetime = strftime(""._LINKSDATESTRING."", mktime($datetime[4],$datetime[5],$datetime[6],$datetime[2],$datetime[3],$datetime[1]));
    $datetime = ucfirst($datetime);
    $startdate = time();
    $count = 0;
    while ($count <= 7) {
	$daysold = date("d-M-Y", $startdate);
        if ("$daysold" == "$datetime") {
    	    if ($count<=1) {
		echo "<img src=\"modules/$module_name/images/new_1.gif\" alt=\""._NEWTODAY."\">";
	    }
            if ($count<=3 && $count>1) {
		echo "<img src=\"modules/$module_name/images/new_3.gif\" alt=\""._NEWLAST3DAYS."\">";
	    }
            if ($count<=7 && $count>3) {
		echo "<img src=\"modules/$module_name/images/new_7.gif\" alt=\""._NEWTHISWEEK."\">";
	    }
	}
        $count++;
        $startdate = (time()-(86400 * $count));
    }
}

// ######################################################################
// FUNCTION : categorynewdownloadgraphic($cat)
// ######################################################################
function categorynewdownloadgraphic($cat) {
    global $prefix, $dbi, $module_name;
    $newresult = sql_query("SELECT date FROM ".$prefix."_downloads_downloads WHERE cid=$cat order by date desc limit 1", $dbi);
    list($time)=sql_fetch_row($newresult, $dbi);
    echo "&nbsp;";
    setlocale (LC_TIME, $locale);
    ereg ("([0-9]{4})-([0-9]{1,2})-([0-9]{1,2}) ([0-9]{1,2}):([0-9]{1,2}):([0-9]{1,2})", $time, $datetime);
    $datetime = strftime(""._LINKSDATESTRING."", mktime($datetime[4],$datetime[5],$datetime[6],$datetime[2],$datetime[3],$datetime[1]));
    $datetime = ucfirst($datetime);
    $startdate = time();
    $count = 0;
    while ($count <= 7) {
	$daysold = date("d-M-Y", $startdate);
        if ("$daysold" == "$datetime") {
    	    if ($count<=1) {
		echo "<img src=\"modules/$module_name/images/new_1.gif\" alt=\""._DCATNEWTODAY."\">";
	    }
            if ($count<=3 && $count>1) {
		echo "<img src=\"modules/$module_name/images/new_3.gif\" alt=\""._DCATLAST3DAYS."\">";
	    }
            if ($count<=7 && $count>3) {
		echo "<img src=\"modules/$module_name/images/new_7.gif\" alt=\""._DCATTHISWEEK."\">";
	    }
	}
        $count++;
        $startdate = (time()-(86400 * $count));
    }
}

// ######################################################################
// FUNCTION : popgraphic($hits)
// ######################################################################
function popgraphic($hits) {
    global $module_name;
    include("modules/$module_name/d_config.php");
    if ($hits>=$popular) {
	echo "&nbsp;<img src=\"modules/$module_name/images/popular.gif\" alt=\""._POPULAR."\">";
    }
}

// ######################################################################
// FUNCTION : convertorderbyin($orderby)
// ######################################################################
function convertorderbyin($orderby) {
    if ($orderby == "titleA")	$orderby = "title ASC";
    if ($orderby == "dateA")	$orderby = "date ASC";
    if ($orderby == "hitsA")	$orderby = "hits ASC";
    if ($orderby == "ratingA")	$orderby = "downloadratingsummary ASC";
    if ($orderby == "titleD")	$orderby = "title DESC";
    if ($orderby == "dateD")	$orderby = "date DESC";
    if ($orderby == "hitsD")	$orderby = "hits DESC";
    if ($orderby == "ratingD")	$orderby = "downloadratingsummary DESC";
    return $orderby;
}

// ######################################################################
// FUNCTION : convertorderbytrans($orderby)
// ######################################################################
function convertorderbytrans($orderby) {
    if ($orderby == "hits ASC")			$orderbyTrans = ""._POPULARITY1."";
    if ($orderby == "hits DESC")		$orderbyTrans = ""._POPULARITY2."";
    if ($orderby == "title ASC")		$orderbyTrans = ""._TITLEAZ."";
    if ($orderby == "title DESC")		$orderbyTrans = ""._TITLEZA."";
    if ($orderby == "date ASC")			$orderbyTrans = ""._DDATE1."";
    if ($orderby == "date DESC")		$orderbyTrans = ""._DDATE2."";
    if ($orderby == "downloadratingsummary ASC")	$orderbyTrans = ""._RATING1."";
    if ($orderby == "downloadratingsummary DESC")	$orderbyTrans = ""._RATING2."";
    return $orderbyTrans;
}

// ######################################################################
// FUNCTION : convertorderbyout($orderby)
// ######################################################################
function convertorderbyout($orderby) {
    if ($orderby == "title ASC")		$orderby = "titleA";
    if ($orderby == "date ASC")			$orderby = "dateA";
    if ($orderby == "hits ASC")			$orderby = "hitsA";
    if ($orderby == "downloadratingsummary ASC")	$orderby = "ratingA";
    if ($orderby == "title DESC")		$orderby = "titleD";
    if ($orderby == "date DESC")		$orderby = "dateD";
    if ($orderby == "hits DESC")		$orderby = "hitsD";
    if ($orderby == "downloadratingsummary DESC")	$orderby = "ratingD";
    return $orderby;
}

// ######################################################################
// FUNCTION : getit($lid)
// ######################################################################
function getit($lid) {
    global $prefix, $dbi;
    sql_query("update ".$prefix."_downloads_downloads set hits=hits+1 WHERE lid=$lid", $dbi);
    $result = sql_query("SELECT url FROM ".$prefix."_downloads_downloads WHERE lid=$lid", $dbi);
    list($url) = sql_fetch_row($result, $dbi);
    Header("Location: $url");
}

// ######################################################################
// FUNCTION : detecteditorial($lid, $ttitle, $img)
// ######################################################################
function detecteditorial($lid, $ttitle, $img) {
    global $prefix, $dbi, $module_name;
    $resulted2 = sql_query("SELECT adminid FROM ".$prefix."_downloads_editorials WHERE downloadid=$lid", $dbi);
    $recordexist = sql_num_rows($resulted2, $dbi);
    if ($recordexist != 0) {
	if ($img == 1) {
	    echo "&nbsp;&nbsp;<a href=\"modules.php?name=$module_name&d_op=viewdownloadeditorial&amp;lid=$lid&amp;ttitle=$ttitle\"><img src=\"modules/$module_name/images/cool.gif\" alt=\""._EDITORIAL."\" border=\"0\"></a>";
	} else {
	    echo " | <a href=\"modules.php?name=$module_name&d_op=viewdownloadeditorial&amp;lid=$lid&amp;ttitle=$ttitle\">"._EDITORIAL."</a>";
	}
    }
}

// ######################################################################
// FUNCTION : downloadfooter($lid,$ttitle)
// ######################################################################
function downloadfooter($lid,$ttitle) {
    global $module_name;
    $ttitle = stripslashes($ttitle);
    echo "<font class=\"content\">[ <a href=\"modules.php?name=$module_name&d_op=getit&amp;lid=$lid\">"._DOWNLOADNOW."</a> | <a href=\"modules.php?name=$module_name&d_op=ratedownload&amp;lid=$lid&amp;ttitle=$ttitle\">"._RATETHISSITE."</a> ]</font><br><br>";
    downloadfooterchild($lid);
}

// ######################################################################
// FUNCTION : downloadfooterchild($lid)
// ######################################################################
function downloadfooterchild($lid) {
    global $module_name;
    include("modules/$module_name/d_config.php");
    if ($useoutsidevoting = 1) {
	echo "<br><font class=\"content\">"._ISTHISYOURSITE." <a href=\"modules.php?name=$module_name&d_op=outsidedownloadsetup&amp;lid=$lid\">"._ALLOWTORATE."</a></font>";
    }
}

// ######################################################################
// FUNCTION : outsidedownloadsetup($lid)
// ######################################################################
function outsidedownloadsetup($lid) {
    global $module_name, $sitename, $nukeurl;
    include("header.php");
    include("modules/$module_name/d_config.php");
    menu(1);
    echo "<br>";
    OpenTable();
    echo "<center><font class=\"option\"><b>"._PROMOTEYOURSITE."</b></font></center><br><br>

    "._PROMOTE01."<br><br>

    <b>1) "._TEXTLINK."</b><br><br>

    "._PROMOTE02."<br><br>
    <center><a href=\"$nukeurl/modules.php?name=$module_name&d_op=ratedownload&amp;lid=$lid\">"._RATETHISSITE." @ $sitename</a></center><br><br>
    <center>"._HTMLCODE1."</center><br>
    <center><i>&lt;a href=\"$nukeurl/modules.php?name=$module_name&d_op=ratedownload&lid=$lid\"&gt;"._RATETHISSITE."&lt;/a&gt;</i></center>
    <br><br>
    "._THENUMBER." \"$lid\" "._IDREFER."<br><br>

    <b>2) "._BUTTONLINK."</b><br><br>

    "._PROMOTE03."<br><br>

    <center>
    <form action=\"modules.php?name=$module_name\" method=\"post\">\n
	<input type=\"hidden\" name=\"lid\" value=\"$lid\">\n
	<input type=\"hidden\" name=\"d_op\" value=\"ratedownload\">\n
	<input type=\"submit\" value=\""._RATEIT."\">\n
    </form>\n
    </center>

    <center>"._HTMLCODE2."</center><br><br>

    <table border=\"0\" align=\"center\"><tr><td align=\"left\"><i>
    &lt;form action=\"$nukeurl/modules.php?name=$module_name\" method=\"post\"&gt;<br>\n
    &nbsp;&nbsp;&lt;input type=\"hidden\" name=\"lid\" value=\"$lid\"&gt;<br>\n
    &nbsp;&nbsp;&lt;input type=\"hidden\" name=\"d_op\" value=\"ratedownload\"&gt;<br>\n
    &nbsp;&nbsp;&lt;input type=\"submit\" value=\""._RATEIT."\"&gt;<br>\n
    &lt;/form&gt;\n
    </i></td></tr></table>

    <br><br>

    <b>3) "._REMOTEFORM."</b><br><br>

    "._PROMOTE04."

    <center>
    <form method=\"post\" action=\"$nukeurl/modules.php?name=$module_name\">
    <table align=\"center\" border=\"0\" width=\"175\" cellspacing=\"0\" cellpadding=\"0\">
    <tr><td align=\"center\"><b>"._VOTE4THISSITE."</b></a></td></tr>
    <tr><td>
    <table border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\">
    <tr><td valign=\"top\">
        <select name=\"rating\">
        <option selected>--</option>
	<option>10</option>
	<option>9</option>
	<option>8</option>
	<option>7</option>
	<option>6</option>
	<option>5</option>
	<option>4</option>
	<option>3</option>
	<option>2</option>
	<option>1</option>
	</select>
    </td><td valign=\"top\">
	<input type=\"hidden\" name=\"ratinglid\" value=\"$lid\">
        <input type=\"hidden\" name=\"ratinguser\" value=\"outside\">
        <input type=\"hidden\" name=\"op value=\"addrating\">
	<input type=\"submit\" value=\""._DOWNLOADVOTE."\">
    </td></tr></table>
    </td></tr></table></form>

    <br>"._HTMLCODE3."<br><br></center>

    <blockquote><i>
    &lt;form method=\"post\" action=\"$nukeurl/modules.php?name=$module_name\"&gt;<br>
	&lt;table align=\"center\" border=\"0\" width=\"175\" cellspacing=\"0\" cellpadding=\"0\"&gt;<br>
	    &lt;tr&gt;&lt;td align=\"center\"&gt;&lt;b&gt;"._VOTE4THISSITE."&lt;/b&gt;&lt;/a&gt;&lt;/td&gt;&lt;/tr&gt;<br>
	    &lt;tr&gt;&lt;td&gt;<br>
	    &lt;table border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\"&gt;<br>
		&lt;tr&gt;&lt;td valign=\"top\"&gt;<br>
    		&lt;select name=\"rating\"&gt;<br>
    		&lt;option selected&gt;--&lt;/option&gt;<br>
		&lt;option&gt;10&lt;/option&gt;<br>
		&lt;option&gt;9&lt;/option&gt;<br>
		&lt;option&gt;8&lt;/option&gt;<br>
		&lt;option&gt;7&lt;/option&gt;<br>
		&lt;option&gt;6&lt;/option&gt;<br>
		&lt;option&gt;5&lt;/option&gt;<br>
		&lt;option&gt;4&lt;/option&gt;<br>
		&lt;option&gt;3&lt;/option&gt;<br>
		&lt;option&gt;2&lt;/option&gt;<br>
		&lt;option&gt;1&lt;/option&gt;<br>
		&lt;/select&gt;<br>
	    &lt;/td&gt;&lt;td valign=\"top\"&gt;<br>
		&lt;input type=\"hidden\" name=\"ratinglid\" value=\"$lid\"&gt;<br>
    		&lt;input type=\"hidden\" name=\"ratinguser\" value=\"outside\"&gt;<br>
    		&lt;input type=\"hidden\" name=\"d_op\" value=\"addrating\"&gt;<br>
		&lt;input type=\"submit\" value=\""._DOWNLOADVOTE."\"&gt;<br>
	    &lt;/td&gt;&lt;/tr&gt;&lt;/table&gt;<br>
	&lt;/td&gt;&lt;/tr&gt;&lt;/table&gt;<br>
    &lt;/form&gt;<br>
    </i></blockquote>
    <br><br><center>
    "._PROMOTE05."<br><br>
    - $sitename "._STAFF."
    <br><br></center>";
    CloseTable();
    include("footer.php");
}

// ######################################################################
// FUNCTION : brokendownload($lid)
// ######################################################################
function brokendownload($lid) {
    global $prefix, $dbi, $user, $cookie, $module_name;
    if (is_user($user)) {
	include("header.php");
	include("modules/$module_name/d_config.php");
    	$user2 = base64_decode($user);
   	$cookie = explode(":", $user2);
	cookiedecode($user);
	$ratinguser = $cookie[1];
	menu(1);
	echo "<br>";
	OpenTable();
	echo "<center><font class=\"option\"><b>"._REPORTBROKEN."</b></font><br><br><br><font class=\"content\">";
	echo "<form action=\"modules.php?name=$module_name\" method=\"post\">";
	echo "<input type=\"hidden\" name=\"lid\" value=\"$lid\">";
	echo "<input type=\"hidden\" name=\"modifysubmitter\" value=\"$ratinguser\">";
	echo ""._THANKSBROKEN."<br>"._SECURITYBROKEN."<br><br>";
	echo "<input type=\"hidden\" name=\"d_op\" value=\"brokendownloadS\"><input type=\"submit\" value=\""._REPORTBROKEN."\"></center></form>";
	CloseTable();
	include("footer.php");
    } else {
	Header("Location: modules.php?name=$module_name");
    }
}

// ######################################################################
// FUNCTION : brokendownloadS($lid, $modifysubmitter)
// ######################################################################
function brokendownloadS($lid, $modifysubmitter) {
    global $prefix, $dbi, $user, $anonymous, $cookie, $module_name, $user;
    if (is_user($user)) {
	include("modules/$module_name/d_config.php");
	$user2 = base64_decode($user);
   	$cookie = explode(":", $user2);
	cookiedecode($user);
	$ratinguser = $cookie[1];
	sql_query("insert into ".$prefix."_downloads_modrequest values (NULL, $lid, 0, 0, '', '', '', '$ratinguser', 1, '$auth_name', '$email', '$filesize', '$version', '$homepage')", $dbi);
	include("header.php");
	menu(1);
	echo "<br>";
	OpenTable();
	echo "<br><center>"._THANKSFORINFO."<br><br>"._LOOKTOREQUEST."</center><br>";
	CloseTable();
	include("footer.php");
    } else {
	Header("Location: modules.php?name=$module_name");
    }
}

// ######################################################################
// FUNCTION : modifydownloadrequest($lid)
// ######################################################################
function modifydownloadrequest($lid) {
    global $prefix, $dbi, $user, $module_name;
    include("header.php");
    if(is_user($user)) {
    	$user2 = base64_decode($user);
   	$cookie = explode(":", $user2);
	cookiedecode($user);
	$ratinguser = $cookie[1];
    } else {
	$ratinguser = "$anonymous";
    }
    menu(1);
    echo "<br>";
    OpenTable();
    $blocknow = 0;
    if ($blockunregmodify == 1 && $ratinguser=="$anonymous") {
	echo "<br><br><center>"._DONLYREGUSERSMODIFY."</center>";
	$blocknow = 1;
    }
    if ($blocknow != 1) {
    	$result = sql_query("SELECT cid, title, url, description, name, email, filesize, version, homepage FROM ".$prefix."_downloads_downloads WHERE lid=$lid", $dbi);
    	echo "<center><font class=\"option\"><b>"._REQUESTDOWNLOADMOD."</b></font><br><font class=\"content\">";
    	while(list($cid, $title, $url, $description, $auth_name, $email, $filesize, $version, $homepage) = sql_fetch_row($result, $dbi)) {
    	    $title = stripslashes($title);
	    $description = stripslashes($description);
    	    echo "<form action=\"modules.php?name=$module_name\" method=\"post\">"
	        .""._DOWNLOADID.": <b>$lid</b></center><br><br><br>"
	        .""._DOWNLOADNAME.":<br><input type=\"text\" name=\"title\" value=\"$title\" size=\"50\" maxlength=\"100\"><br><br>"
	        .""._URL.":<br><input type=\"text\" name=\"url\" value=\"$url\" size=\"50\" maxlength=\"100\"><br><br>"
	        .""._DESCRIPTION.": <br><textarea name=\"description\" cols=\"60\" rows=\"10\">$description</textarea><br><br>";
	    $result2=sql_query("SELECT cid, title FROM ".$prefix."_downloads_categories order by title", $dbi);
	    echo "<input type=\"hidden\" name=\"lid\" value=\"$lid\">"
		."<input type=\"hidden\" name=\"modifysubmitter\" value=\"$ratinguser\">"
		.""._CATEGORY.": <select name=\"cat\">";

	$result2=sql_query("SELECT cid, title, parentid FROM ".$prefix."_downloads_categories order by title", $dbi);
	while(list($cid2, $ctitle2, $parentid2) = sql_fetch_row($result2, $dbi)) {
		if ($cid2==$cid) {
			$sel = "selected";
		} else {
			$sel = "";
		}
		if ($parentid2!=0) $ctitle2=getparent($parentid2,$ctitle2);
	    echo "<option value=\"$cid2\" $sel>$ctitle2</option>";
	}
	    echo "</select><br><br>"
		.""._AUTHORNAME.":<br><input type=\"text\" name=\"auth_name\" value=\"$auth_name\" size=\"30\" maxlength=\"80\"><br><br>"
		.""._AUTHOREMAIL.":<br><input type=\"text\" name=\"email\" value=\"$email\" size=\"30\" maxlength=\"80\"><br><br>"
		.""._FILESIZE.": ("._INBYTES.")<br><input type=\"text\" name=\"filesize\" value=\"$filesize\" size=\"12\" maxlength=\"11\"><br><br>"
		.""._VERSION.":<br><input type=\"text\" name=\"version\" value=\"$version\" size=\"11\" maxlength=\"10\"><br><br>"
		.""._HOMEPAGE.":<br><input type=\"text\" name=\"homepage\" value=\"$homepage\" size=\"50\" maxlength=\"200\"><br><br>"
		."<input type=\"hidden\" name=\"d_op\" value=\"modifydownloadrequestS\">"
		."<input type=\"submit\" value=\""._SENDREQUEST."\"></form>";
    	}
    }
    CloseTable();
    include("footer.php");
}

// ######################################################################
// FUNCTION : modifydownloadrequestS($lid, $cat, $title, $url, $description, $modifysubmitter, $auth_name, $email, $filesize, $version, $homepage)
// ######################################################################
function modifydownloadrequestS($lid, $cat, $title, $url, $description, $modifysubmitter, $auth_name, $email, $filesize, $version, $homepage) {
    global $prefix, $dbi, $user, $module_name;
    include("modules/$module_name/d_config.php");
    if(is_user($user)) {
	$user2 = base64_decode($user);
	$cookie = explode(":", $user2);
	cookiedecode($user);
	$ratinguser = $cookie[1];
    } else {
	$ratinguser = "$anonymous";
    }
    $blocknow = 0;
    if ($blockunregmodify == 1 && $ratinguser=="$anonymous") {
	include("header.php");
	menu(1);
	echo "<br>";
	OpenTable();
	echo "<center><font class=\"content\">"._DONLYREGUSERSMODIFY."</font></center>";
	$blocknow = 1;
	CloseTable();
	include("footer.php");
    }
    if ($blocknow != 1) {
    	$cat = explode("-", $cat);
    	if ($cat[1]=="") {
    	    $cat[1] = 0;
    	}
    	$title = stripslashes(FixQuotes($title));
    	$url = stripslashes(FixQuotes($url));
    	$description = stripslashes(FixQuotes($description));
    	sql_query("insert into ".$prefix."_downloads_modrequest values (NULL, $lid, $cat[0], $cat[1], '$title', '$url', '$description', '$ratinguser', 0, '$auth_name', '$email', '$filesize', '$version', '$homepage')", $dbi);
    	include("header.php");
	menu(1);
	echo "<br>";
	OpenTable();
    	echo "<center><font class=\"content\">"._THANKSFORINFO." "._LOOKTOREQUEST."</font></center>";
    	CloseTable();
	include("footer.php");
    }
}

// ######################################################################
// FUNCTION : rateinfo($lid)
// ######################################################################
function rateinfo($lid) {
    global $prefix, $dbi;
    sql_query("update ".$prefix."_downloads_downloads set hits=hits+1 WHERE lid=$lid", $dbi);
    $result = sql_query("SELECT url FROM ".$prefix."_downloads_downloads WHERE lid=$lid", $dbi);
    list($url) = sql_fetch_row($result, $dbi);
    Header("Location: $url");
}

// ######################################################################
// FUNCTION : addrating($ratinglid, $ratinguser, $rating, $ratinghost_name, $ratingcomments)
// ######################################################################
function addrating($ratinglid, $ratinguser, $rating, $ratinghost_name, $ratingcomments) {
    global $prefix, $dbi, $cookie, $user, $module_name;
    $passtest = "yes";
    include("header.php");
    include("modules/$module_name/d_config.php");
    completevoteheader();
    if(is_user($user)) {
	$user2 = base64_decode($user);
   	$cookie = explode(":", $user2);
	cookiedecode($user);
	$ratinguser = $cookie[1];
    } else if ($ratinguser=="outside") {
	$ratinguser = "outside";
    } else {
	$ratinguser = "$anonymous";
    }
    $results3 = sql_query("SELECT title FROM ".$prefix."_downloads_downloads WHERE lid=$ratinglid", $dbi);
    while(list($title)=sql_fetch_row($results3, $dbi)) $ttitle = $title;
    /* Make sure only 1 anonymous from an IP in a single day. */
    $ip = $_SERVER["REMOTE_HOST"];
    if (empty($ip)) {
       $ip = $_SERVER["REMOTE_ADDR"];
    }
    /* Check if Rating is Null */
    if ($rating=="--") {
	$error = "nullerror";
        completevote($error);
	$passtest = "no";
    }
    /* Check if Download POSTER is voting (UNLESS Anonymous users allowed to post) */
    if ($ratinguser != $anonymous && $ratinguser != "outside") {
    	$result=sql_query("SELECT submitter FROM ".$prefix."_downloads_downloads WHERE lid=$ratinglid", $dbi);
    	while(list($ratinguserDB)=sql_fetch_row($result, $dbi)) {
    	    if ($ratinguserDB==$ratinguser) {
    		$error = "postervote";
    	        completevote($error);
		$passtest = "no";
    	    }
   	}
    }
    /* Check if REG user is trying to vote twice. */
    if ($ratinguser!=$anonymous && $ratinguser != "outside") {
    	$result=sql_query("SELECT ratinguser FROM ".$prefix."_downloads_votedata WHERE ratinglid=$ratinglid", $dbi);
    	while(list($ratinguserDB)=sql_fetch_row($result, $dbi)) {
    	    if ($ratinguserDB==$ratinguser) {
    	        $error = "regflood";
                completevote($error);
		$passtest = "no";
	    }
        }
    }
    /* Check if ANONYMOUS user is trying to vote more than once per day. */
    if ($ratinguser==$anonymous){
    	$yesterdaytimestamp = (time()-(86400 * $anonwaitdays));
    	$ytsDB = Date("Y-m-d H:i:s", $yesterdaytimestamp);
    	$result=sql_query("SELECT * FROM ".$prefix."_downloads_votedata WHERE ratinglid=$ratinglid AND ratinguser='$anonymous' AND ratinghostname = '$ip' AND TO_DAYS(NOW()) - TO_DAYS(ratingtimestamp) < $anonwaitdays", $dbi);
        $anonvotecount = sql_num_rows($result, $dbi);
    	if ($anonvotecount >= 1) {
    	    $error = "anonflood";
            completevote($error);
    	    $passtest = "no";
    	}
    }
    /* Check if OUTSIDE user is trying to vote more than once per day. */
    if ($ratinguser=="outside"){
    	$yesterdaytimestamp = (time()-(86400 * $outsidewaitdays));
    	$ytsDB = Date("Y-m-d H:i:s", $yesterdaytimestamp);
    	$result=sql_query("SELECT * FROM ".$prefix."_downloads_votedata WHERE ratinglid=$ratinglid AND ratinguser='outside' AND ratinghostname = '$ip' AND TO_DAYS(NOW()) - TO_DAYS(ratingtimestamp) < $outsidewaitdays", $dbi);
        $outsidevotecount = sql_num_rows($result, $dbi);
    	if ($outsidevotecount >= 1) {
    	    $error = "outsideflood";
            completevote($error);
    	    $passtest = "no";
    	}
    }
    /* Passed Tests */
    if ($passtest == "yes") {
    	$comment = stripslashes(FixQuotes($comment));
    	/* All is well.  Add to Line Item Rate to DB. */
	 sql_query("INSERT into ".$prefix."_downloads_votedata values (NULL,'$ratinglid', '$ratinguser', '$rating', '$ip', '$ratingcomments', now())", $dbi);
	/* All is well.  Calculate Score & Add to Summary (for quick retrieval & sorting) to DB. */
	/* NOTE: If weight is modified, ALL downloads need to be refreshed with new weight. */
	/*	 Running a SQL statement with your modded calc for ALL downloads will accomplish this. */
        $voteresult = sql_query("SELECT rating, ratinguser, ratingcomments FROM ".$prefix."_downloads_votedata WHERE ratinglid = $ratinglid", $dbi);
	$totalvotesDB = sql_num_rows($voteresult, $dbi);
	include ("modules/$module_name/voteinclude.php");
        sql_query("UPDATE ".$prefix."_downloads_downloads SET downloadratingsummary=$finalrating,totalvotes=$totalvotesDB,totalcomments=$truecomments WHERE lid = $ratinglid", $dbi);
        $error = "none";
        completevote($error);
    }
    completevotefooter($ratinglid, $ttitle, $ratinguser);
    include("footer.php");
}

// ######################################################################
// FUNCTION : completevoteheader()
// ######################################################################
function completevoteheader() {
    menu(1);
    echo "<br>";
    OpenTable();
}

// ######################################################################
// FUNCTION : completevotefooter($lid, $ttitle, $ratinguser)
// ######################################################################
function completevotefooter($lid, $ttitle, $ratinguser) {
    global $prefix, $dbi, $module_name;
    include("modules/$module_name/d_config.php");
    $result = sql_query("SELECT url FROM ".$prefix."_downloads_downloads WHERE lid=$lid", $dbi);
    list($url)=sql_fetch_row($result, $dbi);
    echo "<font class=\"content\">"._THANKSTOTAKETIME." $sitename. "._DLETSDECIDE."</font><br><br><br>";
    if ($ratinguser=="outside") {
	echo "<center><font class=\"content\">".WEAPPREACIATE." $sitename!<br><a href=\"$url\">"._RETURNTO." $ttitle</a></font><center><br><br>";
        $result=sql_query("SELECT title FROM ".$prefix."_downloads_downloads WHERE lid=$lid", $dbi);
        list($title)=sql_fetch_row($result, $dbi);
        $ttitle = ereg_replace (" ", "_", $title);
    }
    echo "<center>";
    downloadinfomenu($lid,$ttitle);
    echo "</center>";
    CloseTable();
}

// ######################################################################
// FUNCTION : completevote($error)
// ######################################################################
function completevote($error) {
    global $module_name;
    include("modules/$module_name/d_config.php");
    if ($error == "none") echo "<center><font class=\"content\"><b>"._COMPLETEVOTE1."</b></font></center>";
    if ($error == "anonflood") echo "<center><font class=\"option\"><b>"._COMPLETEVOTE2."</b></font></center><br>";
    if ($error == "regflood") echo "<center><font class=\"option\"><b>"._COMPLETEVOTE3."</b></font></center><br>";
    if ($error == "postervote") echo "<center><font class=\"option\"><b>"._COMPLETEVOTE4."</b></font></center><br>";
    if ($error == "nullerror") echo "<center><font class=\"option\"><b>"._COMPLETEVOTE5."</b></font></center><br>";
    if ($error == "outsideflood") echo "<center><font class=\"option\"><b>"._COMPLETEVOTE6."</b></font></center><br>";
}

// ######################################################################
// FUNCTION : ratedownload($lid, $user, $ttitle)
// ######################################################################
function ratedownload($lid, $user, $ttitle) {
    global $prefix, $dbi, $cookie, $datetime, $module_name;
    include("header.php");
    menu(1);
    echo "<br>";
    OpenTable();
    $transfertitle = ereg_replace ("_", " ", $ttitle);
    $transfertitle = stripslashes($transfertitle);
    $displaytitle = $transfertitle;
    $ip = $_SERVER["REMOTE_HOST"];
    if (empty($ip)) {
       $ip = $_SERVER["REMOTE_ADDR"];
    }
    echo "<b>$displaytitle</b>"
	."<ul><font class=\"content\">"
	."<li>"._RATENOTE1.""
	."<li>"._RATENOTE2.""
	."<li>"._RATENOTE3.""
	."<li>"._DRATENOTE4.""
	."<li>"._RATENOTE5."";
    if(is_user($user)) {
    	$user2 = base64_decode($user);
   	$cookie = explode(":", $user2);
	echo "<li>"._YOUAREREGGED.""
	    ."<li>"._FEELFREE2ADD."";
	cookiedecode($user);
	$auth_name = $cookie[1];
    } else {
	echo "<li>"._YOUARENOTREGGED.""
	    ."<li>"._IFYOUWEREREG."";
	$auth_name = "$anonymous";
    }
    echo "</ul>"
    	."<form method=\"post\" action=\"modules.php?name=$module_name\">"
        ."<table border=\"0\" cellpadding=\"1\" cellspacing=\"0\" width=\"100%\">"
        ."<tr><td width=\"25\" nowrap></td>"
        ."<tr><td width=\"25\" nowrap></td><td width=\"550\">"
        ."<input type=\"hidden\" name=\"ratinglid\" value=\"$lid\">"
        ."<input type=\"hidden\" name=\"ratinguser\" value=\"$auth_name\">"
        ."<input type=\"hidden\" name=\"ratinghost_name\" value=\"$ip\">"
        ."<font class=content>"._RATETHISSITE.""
        ."<select name=\"rating\">"
        ."<option>--</option>"
        ."<option>10</option>"
        ."<option>9</option>"
	."<option>8</option>"
        ."<option>7</option>"
        ."<option>6</option>"
        ."<option>5</option>"
        ."<option>4</option>"
        ."<option>3</option>"
        ."<option>2</option>"
        ."<option>1</option>"
        ."</select></font>"
	."<font class=\"content\"><input type=\"submit\" value=\""._RATETHISSITE."\"></font>"
        ."<br><br>";
    if(is_user($user)) {
	echo "<b>"._SCOMMENTS.":</b><br><textarea wrap=\"virtual\" cols=\"50\" rows=\"10\" name=\"ratingcomments\"></textarea>"
 	    ."<br><br><br>"
     	    ."</font></td>";
    } else {
	echo"<input type=\"hidden\" name=\"ratingcomments\" value=\"\">";
    }
    echo "</tr></table></form>";
    echo "<center>";
    downloadfooterchild($lid);
    echo "</center>";
    CloseTable();
    include("footer.php");
}

// ######################################################################
// FUNCTION : CoolSize($size)
// ######################################################################
function CoolSize($size) {
    $mb = 1024*1024;
    if ( $size > $mb ) {
        $mysize = sprintf ("%01.2f",$size/$mb) . " MB";
    } elseif ( $size >= 1024 ) {
        $mysize = sprintf ("%01.2f",$size/1024) . " Kb";
    } else {
        $mysize = $size . " bytes";
    }
    return $mysize;
}

if (isset($ratinglid) && isset ($ratinguser) && isset ($rating)) {
    $ret = addrating($ratinglid, $ratinguser, $rating, $ratinghost_name, $ratingcomments);
}

// ######################################################################
// SWITCHBOARD
// ######################################################################
switch($d_op) {

    case "menu":
    menu($maindownload);
    break;

    case "AddDownload":
    AddDownload();
    break;

    case "NewDownloads":
    require_once("new.php");
    NewDownloads($newdownloadshowdays);
    break;

    case "NewDownloadsDate":
    require_once("new.php");
    NewDownloadsDate($selectdate);
    break;

    case "CoolSize":
    CoolSize($size);
    break;

    case "TopRated":
    require_once("top.php");
    TopRated($ratenum, $ratetype);
    break;

    case "MostPopular":
    require_once("pop.php");
    MostPopular($ratenum, $ratetype);
    break;

    case "viewdownload":
    require_once("view.php");
    viewdownload($cid, $min, $orderby, $show);
    break;

    case "viewsdownload":
    require_once("view.php");
    viewsdownload($sid, $min, $orderby, $show);
    break;

    case "brokendownload":
    brokendownload($lid);
    break;

    case "modifydownloadrequest":
    modifydownloadrequest($lid);
    break;

    case "modifydownloadrequestS":
    modifydownloadrequestS($lid, $cat, $title, $url, $description, $modifysubmitter, $auth_name, $email, $filesize, $version, $homepage);
    break;

    case "brokendownloadS":
    brokendownloadS($lid, $modifysubmitter);
    break;

    case "getit":
    getit($lid);
    break;

    case "Add":
    Add($title, $url, $auth_name, $cat, $description, $email, $filesize, $version, $homepage);
    break;

    case "search":
    require_once("search.php");
    search($query, $min, $orderby, $show);
    break;

    case "rateinfo":
    rateinfo($lid, $user, $title);
    break;

    case "ratedownload":
    ratedownload($lid, $user, $ttitle);
    break;

    case "addrating":
    addrating($ratinglid, $ratinguser, $rating, $ratinghost_name, $ratingcomments, $user);
    break;

    case "viewdownloadcomments":
    require_once("comments.php");
    viewdownloadcomments($lid, $ttitle);
    break;

    case "outsidedownloadsetup":
    outsidedownloadsetup($lid);
    break;

    case "viewdownloadeditorial":
    require_once("editorial.php");
    viewdownloadeditorial($lid, $ttitle);
    break;

    case "viewdownloaddetails":
    require_once("details.php");
    viewdownloaddetails($lid, $ttitle);
    break;

    default:
    index();
    break;

}

?>