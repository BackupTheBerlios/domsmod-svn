<?php

/************************************************************************/
/* PHP-NUKE: Web Portal System                                          */
/* ===========================                                          */
/*                                                                      */
/* Copyright (c) 2002 by Francisco Burzi                                */
/* http://phpnuke.org                                                   */
/*                                                                      */
/* This program is free software. You can redistribute it and/or modify */
/* it under the terms of the GNU General Public License as published by */
/* the Free Software Foundation; either version 2 of the License.       */
/*                                                                      */
/************************************************************************/
/*         Additional security & Abstraction layer conversion           */
/*                           2003 chatserv                              */
/*      http://www.nukefixes.com -- http://www.nukeresources.com        */
/************************************************************************/

if (!eregi("admin.php", $_SERVER['PHP_SELF'])) { die ("Access Denied"); }
global $prefix, $db;
//FIX:DOMSNITT
// START: HACK - ADVANCED USER MANAGER - Fixed by Satish
get_lang($module_name);
// END: HACK - ADVANCED USER MANAGER
//END-OF-FIX

$aid = substr("$aid", 0,25);
$row = $db->sql_fetchrow($db->sql_query("SELECT title, admins FROM ".$prefix."_modules WHERE title='Your_Account'"));
$row2 = $db->sql_fetchrow($db->sql_query("SELECT name, radminsuper FROM ".$prefix."_authors WHERE aid='$aid'"));
$admins = explode(",", $row['admins']);
$auth_user = 0;
for ($i=0; $i < sizeof($admins); $i++) {
    if ($row2['name'] == "$admins[$i]" AND $row['admins'] != "") {
        $auth_user = 1;	
    }
}

if ($row2['radminsuper'] == 1 || $auth_user == 1) {

/*********************************************************/
/* Users Functions                                       */
/*********************************************************/
//FIX:DOMSNITT
// START: HACK - ADVANCED USER MANAGER
	function menu()
	{
		global $admin, $admin_file, $bgcolor2;
		$admin_file="admin";
		$msg = "Admin file: " . $admin_file;
		toLog($msg);
		echo "<table cellpadding='1' cellspacing='1' width='100%' style='border-bottom: 1px solid;'>"
			."<form method='post' action='".$admin_file.".php'>"
			."<tr><td width='100%' align='left'>"
			."<div style='margin-left: 48px;'>"
			."<img src='images/center_l.gif' border='0' hspace='2' align='absmiddle' />"._AUM_ADVMENU.""
			."<div style='margin-left: 24px;'>"
			."<li>"
			."<a href='".$admin_file.".php?op=advancedUserManager'>"._ADVUSERMAN_MODE."</a>"
			."<li>"
			."<a href='".$admin_file.".php?op=aumDUPConfig'>"._AUM_DUPCONFIG."</a>"
			."<li>"
			."<a href='".$admin_file.".php?op=aumMailDomainFilter'>"._AUM_MAILDOMAINFILTER."</a>"
			."<li>"
			."<a href='".$admin_file.".php?op=aumDeadUserList'>"._AUM_DEADUSERLIST."</a>"
			."<li>"
			."<a href='".$admin_file.".php?op=aumPruneQList'>"._AUM_PRUNEQLIST."</a>"
			."<li>"
			."<a href='".$admin_file.".php?op=aumPruneQRemove'>"._AUM_PRUNEQREMOVE."</a>"
			."<li>"
			."<a href='".$admin_file.".php?op=aumUserTempRemove'>"._AUM_USERTEMPBUFREMOVE."</a>"
			."</div>"
			."<br>"
			."<img src='images/center_l.gif' border='0' hspace='2' align='absmiddle' />"._AUM_GENERALMENU.""
			."<div style='margin-left: 24px;'>"
			."<li>"
			."<a href='".$admin_file.".php?op=mod_users&amp;menu=advuserman_adduser'>"._ADDUSER."</a>"
			."<br>"
			."<li>"
			."<b>" . _NICKNAME . ": </b> <input type='text' name='chng_uid' size='20'> "
			."<select name='op'>"
			."<option value='modifyUser'>"._MODIFY."</option>"
			."<option value='delUser'>"._DELETE."</option>"
			."<option value='viewUser'>"._AUM_VIEWUSER."</option>"
			."</select> "
			."<input type=\"submit\" value='"._OK."'>"
			."</div>"
			."</div>"
			."</td></tr></form>"
			."<tr><td bgcolor='$bgcolor2' nowrap='nowrap' align='right' width='100%'>"
			//."<a href='http://www.nukekorea.net' target='_blank'>NukeKorea Dev. Network &copy; 2003-2005 </a>"
			."</td></tr></table>";
	}; // end of memu function

	function ListInactivatedReg()
	{
		global $admin, $admin_file, $bgcolor2, $db, $prefix;
	        $sql = "SELECT * FROM ".$prefix."_users_temp";
		$result = $db->sql_query($sql);
		$numrows = $db->sql_numrows($result);
		if ($numrows)
		{
			echo "<br><center><a href='".$admin_file.".php?op=aumInactiveRegList'>"._AUM_INACTIVEREG."</a></b> (<a href='".$admin_file.".php?op=aumInactiveRegList'>".$numrows."</a>)</center><br />";
		}
	}; // end of member function

	//
	// Pagination routine, generates
	// page number sequence
	//
	function generate_pagination($base_url, $num_items, $per_page, $start_item, $add_prevnext_text = TRUE)
	{
		$total_pages = ceil($num_items/$per_page);
		if ( $total_pages == 1 )
		{
			return '';
		}
		$on_page = floor($start_item / $per_page) + 1;
		$page_string = '';
		if ( $total_pages > 10 )
		{
			$init_page_max = ( $total_pages > 3 ) ? 3 : $total_pages;
			for($i = 1; $i < $init_page_max + 1; $i++)
			{
				$page_string .= ( $i == $on_page ) ? '<b>' . $i . '</b>' : '<a href="' . $base_url . "&amp;start=" . ( ( $i - 1 ) * $per_page ) . '">' . $i . '</a>';
				if ( $i <  $init_page_max )
				{
					$page_string .= ", ";
				}
			}

			if ( $total_pages > 3 )
			{
				if ( $on_page > 1  && $on_page < $total_pages )
				{
					$page_string .= ( $on_page > 5 ) ? ' ... ' : ', ';

					$init_page_min = ( $on_page > 4 ) ? $on_page : 5;
					$init_page_max = ( $on_page < $total_pages - 4 ) ? $on_page : $total_pages - 4;

					for($i = $init_page_min - 1; $i < $init_page_max + 2; $i++)
					{
						$page_string .= ($i == $on_page) ? '<b>' . $i . '</b>' : '<a href="' . $base_url . "&amp;start=" . ( ( $i - 1 ) * $per_page ) . '">' . $i . '</a>';
						if ( $i <  $init_page_max + 1 )
						{
							$page_string .= ', ';
						}
					}

					$page_string .= ( $on_page < $total_pages - 4 ) ? ' ... ' : ', ';
				}
				else
				{
					$page_string .= ' ... ';
				}

				for($i = $total_pages - 2; $i < $total_pages + 1; $i++)
				{
					$page_string .= ( $i == $on_page ) ? '<b>' . $i . '</b>'  : '<a href="' . $base_url . "&amp;start=" . ( ( $i - 1 ) * $per_page ) . '">' . $i . '</a>';
					if( $i <  $total_pages )
					{
						$page_string .= ", ";
					}
				}
			}
		}
		else
		{
			for($i=1; $i<$total_pages+1; $i++)
			{
				$page_string .= ($i == $on_page ) ? '<b>' . $i . '</b>' : '<a href="' . $base_url . "&amp;start=" . ( ( $i - 1 ) * $per_page ) . '">' . $i . '</a>';
				if ( $i <  $total_pages )
				{
					$page_string .= ', ';
				}
			}
		}

		if ( $add_prevnext_text )
		{
			if ( $on_page > 1 )
			{
				$page_string = ' <a href="' . $base_url . "&amp;start=" . ( ( $on_page - 2 ) * $per_page ) . '">' . 'Previous' . '</a>&nbsp;&nbsp;' . $page_string;
			}

			if ( $on_page < $total_pages )
			{
				$page_string .= '&nbsp;&nbsp;<a href="' . $base_url . "&amp;start=" . ( $on_page * $per_page ) . '">' . 'Next' . '</a>';
			}

		}
		$page_string = 'Goto_page' . ' ' . $page_string;
		return $page_string;
	}

	function advancedUserManager($viewmode="", $sortorder="", $start="")
	{
		global $user_prefix, $db, $prefix, $admin, $admin_file, $bgcolor2;
		include("header.php");
		GraphicAdmin();
		OpenTable();
		echo "<center><font class=\"title\"><b>" . _USERADMIN . "</b></font></center>";
		CloseTable();
		echo "<br>";
		OpenTable();
		ListInactivatedReg();
		menu();
		CloseTable();
		echo "<br>";

		// main
		OpenTable();
		
		// default configuration
		if (empty($viewmode))
		{
			$viewmode = 'Username';
		}
		if (empty($sortorder))
		{
			$sortorder = 'ASC';
		};
		$start = intval($start);

		// 0. menus - sort method
		$mode_types_text = array((""._AUM_USERNAME.""),
								(""._LASTVISIT.""),
								(""._LASTLOGINIP.""),
								(""._EMAIL.""),
								(""._JOINED.""),
								(""._SUBSCRIPTION.""),
								(""._POSTS.""),
								(""._WEBSITE.""),
								(""._TOP10POSTER.""));
		$mode_types = array('username',
							'user_lastvisit',
							'last_ip',
							'email',
							'joined',
							'subscription',
							'posts',
							'website',
							'topten');

		$select_sort_mode = '<select name="viewmode">';
		for($i= 0; $i<count($mode_types_text); $i++)
		{
			$selected = ($viewmode == $mode_types[$i] ) ? ' selected="selected"' : '';
			$select_sort_mode .= '<option value="' . $mode_types[$i] . '"' . $selected . '>' . $mode_types_text[$i] . '</option>';
		}
		$select_sort_mode .= '</select>';

		$select_sort_order = '<select name="sortorder">';
		if($sortorder == 'ASC')
		{
			$select_sort_order .= '<option value="ASC" selected="selected">' . ""._ASCENDING."" . '</option><option value="DESC">' . ""._DESCENDING."" . '</option>';
		}
		else
		{
			$select_sort_order .= '<option value="ASC">' . ""._ASCENDING."" . '</option><option value="DESC" selected="selected">' . ""._DESCENDING."" . '</option>';
		}
		$select_sort_order .= '</select>';

		echo "<table cellpadding='0' cellspacing='0' width='100%' border='0'>"
			."<form method='post' action='".$admin_file.".php'>"
			."<tr>"
			."<td width='100%'>&nbsp;</td>"
			."<td align='right' nowrap='nowrap'>"._SELECTSORTMETHOD.": $select_sort_mode  "._ORDER.": $select_sort_order &nbsp;</td>"
			."<td nowrap='nowrap'>"
			."<input type='hidden' name='op' value='advancedUserManager'>"
			."<input type='submit' value='"._SORT."'>"
			."</tr>"
			."</form>"
			."</table>";

		// lists
		echo "<table cellpadding='1' cellspacing='1' width='100%' style='border: 1px solid;'>"
			."<tr>"
			."<td align='center'>#</td>"
			."<td nowrap='nowrap' align='center' bgcolor='$bgcolor2'><b>"._AUM_USERNAME."</b></td>"
			."<td nowrap='nowrap' align='center' bgcolor='$bgcolor2'><b>"._LASTVISIT."</b></td>"
			."<td nowrap='nowrap' align='center' bgcolor='$bgcolor2'><b>"._LASTLOGINIP."</b></td>"
			."<td nowrap='nowrap' align='center' bgcolor='$bgcolor2'><b>"._JOINED."</b></td>"
			."<td nowrap='nowrap' align='center' bgcolor='$bgcolor2'><b>"._SUBSCRIPTION."</b></td>"
			."<td nowrap='nowrap' align='center' bgcolor='$bgcolor2'><b>"._EMAIL."</b></td>"
			."<td align='center' bgcolor='$bgcolor2'><b>"._WEBSITES."</td>"
			."<td nowrap='nowrap' align='center' bgcolor='$bgcolor2'><b>"._POSTS."</b></td>"
			."<td nowrap='nowrap' align='center' bgcolor='$bgcolor2'><b>"._FUNCTIONS."</b></td>"
			."</tr>";

		$nperpage = 25;
		switch($viewmode)
		{
			case 'joined':
                $order_by = "user_id $sortorder LIMIT $start, " . $nperpage;
                break;
			case 'username':
                $order_by = "username $sortorder LIMIT $start, " . $nperpage;
                break;
			case 'posts':
                $order_by = "user_posts $sortorder LIMIT $start, " . $nperpage;
                break;
			case 'email':
                $order_by = "user_email $sortorder LIMIT $start, " . $nperpage;
                break;
			case 'website':
                $order_by = "user_website $sortorder LIMIT $start, " . $nperpage;
                break;
			case 'user_lastvisit':
                $order_by = "user_lastvisit $sortorder LIMIT $start, " . $nperpage;
                break;
			case 'last_ip':
                $order_by = "last_ip $sortorder LIMIT $start, " . $nperpage;
                break;
			case 'topten':
                $order_by = "user_posts $sortorder LIMIT 10";
                break;
			case 'topten':
                $order_by = "user_posts $sortorder LIMIT 10";
                break;
			default:
                $order_by = "user_id $sortorder LIMIT $start, " . $nperpage;
                break;
		}

		// total rows
        $sql = "SELECT * FROM ".$prefix."_users WHERE user_id <> 1";
		$result = $db->sql_query($sql);
		$totalrows = $db->sql_numrows($result);

		$sql = "SELECT * FROM ".$prefix."_users WHERE user_id <> 1 ORDER BY $order_by";
		$result = $db->sql_query($sql);
		$numrows = $db->sql_numrows($result);
		if($numrows > 0)
		{
			$image_edit = "<img src='images/edit.gif' border='0' hspace='2' align='absmiddle' />";
			$image_delete = "<img src='images/delete.gif' border='0' hspace='2' align='absmiddle' />";
			$image_view = "<img src='images/view.gif' border='0' hspace='2' align='absmiddle' />";
			echo "<form method='post' name='user_checklist' action='".$admin_file.".php?op=advacnedUserManagerDel'>";
			while ($row=$db->sql_fetchrow($result))
			{
				$user_id = $row['user_id'];
				$username = $row['username'];
				$temp_user_lastvisit = $user_lastvisit = intval($row['user_lastvisit']);
				if ($user_lastvisit)
				{
					$timedateformat = (""._TIMEDATEFORMAT."");
					$user_lastvisit = date($timedateformat, $user_lastvisit);
				}
				else
				{
					$user_lastvisit = "Unavailable";
				};
				$last_ip = $row['last_ip'];
				$email = $row['email'];
				$user_regdate = $row['user_regdate'];
				$user_posts = $row['user_posts'];
				$user_website = ("<a href='".$row['user_website']."' target='_blank'>".$row['user_website']."</a>");

				// find subscription users $subscription = $row['status'];
				$sql1 = "SELECT * FROM ".$prefix."_subscriptions WHERE userid ='$user_id'";
				$result1 = $db->sql_query($sql1);
				$numrows1 = $db->sql_numrows($result1);
				if ($numrows1)
				{
					$subscription = ""._YES."";
				}
				else
				{
					$subscription = ""._NO."";
				};


				echo "<tr>";
				echo "<td nowrap='nowrap' align='center'>$user_id</td>";
				echo "<td nowrap='nowrap' align='center'>$username</td>";
				echo "<td nowrap='nowrap' align='left'>&nbsp;<a href='".$admin_file.".php?op=modifyLastVisit&amp;user_id=".$user_id."&amp;username=".$username."&amp;user_lastvisit=".$temp_user_lastvisit."'>$image_edit</a>$user_lastvisit</td>";
				echo "<td nowrap='nowrap' align='center'>$last_ip</td>";
				echo "<td nowrap='nowrap' align='center'>$user_regdate</td>";
				echo "<td nowrap='nowrap' align='center'>$subscription</td>";
				echo "<td nowrap='nowrap' align='center'>$email</td>";
				echo "<td nowrap='nowrap' align='center'>$user_website</td>";
				echo "<td nowrap='nowrap' align='center'>$user_posts</td>";
				echo "<td nowrap='nowrap' align='center'>"
					."<a href='".$admin_file.".php?op=modifyUser&amp;chng_uid=".$username."&amp;viewmode=".$viewmode."&amp;sortorder=".$sortorder."&amp;start=".$start."'>$image_edit</a>"
					."<a href='".$admin_file.".php?op=delUser&amp;chng_uid=".$username."&amp;viewmode=".$viewmode."&amp;sortorder=".$sortorder."&amp;start=".$start."'>$image_delete</a>"
					."<a href='".$admin_file.".php?op=advancedUserMangerViewUser&amp;username=".$username."'>$image_view</a> "
					."<input type='checkbox' name='mark[]2' value='".$user_id."' />"
					."</td>";
				echo "</tr>";
			};
			// extra delete menu
			echo "<tr>"
				."<td colspan='10' width='100%' align='right'><input type='hidden' name='viewmode' value='".$viewmode."'><input type='hidden' name='sortorder' value='".$sortorder."'><input type='hidden' name='start' value='".$start."'>&nbsp;"
				."<input type='submit' name='delete' value='"._QUEUEMARKED."'>&nbsp;"
				."<input type='submit' name='delete' value='"._QUEUEALL."'>"
				."&nbsp;&nbsp;&nbsp;"
				."<input type='submit' name='delete' value='"._REMOVEMARKED."'>&nbsp;"
				."<input type='submit' name='delete' value='"._REMOVEALL."'>"
				."</td></tr></form></table>";
		}
		else
		{
			echo "<tr><td colspan='10' width='100%' align='center'><b>"._NOUSERSFOUND."</b></td></tr></table>";
		};

		// page number & pagination
        $pagenumber = sprintf("Page <b>%d</b> of %d", (floor($start/$nperpage)+1), ceil($totalrows/$nperpage));
		$pagination = generate_pagination("admin.php?op=advancedUserManager&amp;viewmode=$viewmode&amp;sortorder=$sortorder", $totalrows, $nperpage, $start). '&nbsp;';
		echo "<table width='100%' cellpadding='1' cellspacing='0' border='0'>"
			."<tr>"
			."<td nowrap='nowrap' align='left'>".$pagenumber."</td>"
			."<td width='100%'>&nbsp;</td>"
			."<td nowrap='nowrap' algin='right'>".$pagination."</td>"
			."</tr>"
			."</table>";
		CloseTable();
		include("footer.php");
	}; // end of advancedUserManager function()

	function advancedUserMangerViewUser($username)
	{
		global $user_prefix, $db, $prefix, $admin, $admin_file, $bgcolor2;
		include("header.php");
		GraphicAdmin();
		OpenTable();
		echo "<center><font class=\"title\"><b>" . _USERADMIN . "</b></font></center>";
		CloseTable();
		echo "<br>";
		OpenTable();
		ListInactivatedReg();
		menu();
		CloseTable();
		echo "<br>";

		// full information about one user
		OpenTable();
		echo "<center><b>Not available in the current version</center></b>";
		CloseTable();
		include("footer.php");

	}; //

// END: HACK - ADVANCED USER MANAGER
//END-OF-FIX

//FIX:DOMSNITT   
// START: HACK - ADVANCED USER MANAGER
//	function displayUsers() {
	function displayUsers($menu="") {
// END: HACK - ADVANCED USER MANAGER
//END-OF-FIX
    global $admin;
    include("header.php");
    GraphicAdmin();
    OpenTable();
    
    echo "<center><font class=\"title\"><b>" . _USERADMIN . "</b></font></center>";
    CloseTable();
    echo "<br>";
    OpenTable();
    //FIX:DOMSNITT 
    // START: HACK - ADVANCED USER MANAGER
		ListInactivatedReg();
		menu();
		// END: HACK - ADVANCED USER MANAGER
		//END-OF-FIX
		
		//FIX:DOMSNITT 
		// START: HACK - ADVANCED USER MANAGER
		/*
    echo "<center><font class=\"option\"><b>" . _EDITUSER . "</b></font><br><br>"
		."<form method=\"post\" action=\"admin.php\">"
		."<b>" . _NICKNAME . ": </b> <input type=\"text\" name=\"chng_uid\" size=\"20\">\n"
		."<select name=\"op\">"
		."<option value=\"modifyUser\">" . _MODIFY . "</option>\n"
		."<option value=\"delUser\">" . _DELETE . "</option></select>\n"
		."<input type=\"submit\" value=\"" . _OK . "\"></form></center>";
    */
		// END: HACK - ADVANCED USER MANAGER
    //END-OF-FIX
    CloseTable();
    
    //FIX:DOMSNITT 
    // START: HACK - ADVANCED USER MANAGER
		global $bgcolor2;
		echo "<table width='100%' cellpadding='1' cellspacing='0' border='0' width='100%'>";
		echo "<tr><td nowrap='nowrap' align='right' width='100%'>";
		echo "<a href='http://www.nukekorea.net' target='_blank'>NukeKorea Dev. Network &copy; 2003-2005 </a>";
		echo "</td></tr></table>";

		if ($menu == "advuserman_adduser")
		{
		echo "<br>";
		// END: HACK - ADVANCED USER MANAGER
    //END-OF-FIX
    
    echo "<br>";
    OpenTable();
    echo "<center><font class=\"option\"><b>" . _ADDUSER . "</b></font><br><br>"
	."<form action=\"admin.php\" method=\"post\">"
	."<table border=\"0\" width=\"100%\">"
        ."<tr><td width=\"100\">" . _NICKNAME . "</td>"
        ."<td><input type=\"text\" name=\"add_uname\" size=\"30\" maxlength=\"25\"> <font class=\"tiny\">" . _REQUIRED . "</font></td></tr>"
        ."<tr><td>" . _NAME . "</td>"
        ."<td><input type=\"text\" name=\"add_name\" size=\"30\" maxlength=\"50\"></td></tr>"
        ."<tr><td>" . _EMAIL . "</td>"
        ."<td><input type=\"text\" name=\"add_email\" size=\"30\" maxlength=\"60\"> <font class=\"tiny\">" . _REQUIRED . "</font></td></tr>"
        ."<tr><td>" . _FAKEEMAIL . "</td>"
        ."<td><input type=\"text\" name=\"add_femail\" size=\"30\" maxlength=\"60\"></td></tr>"
        ."<tr><td>" . _URL . "</td>"
        ."<td><input type=\"text\" name=\"add_url\" size=\"30\" maxlength=\"60\"></td></tr>"
        ."<tr><td>" . _ICQ . "</td>"
        ."<td><input type=\"text\" name=\"add_user_icq\" size=\"20\" maxlength=\"20\"></td></tr>"
        ."<tr><td>" . _AIM . "</td>"
        ."<td><input type=\"text\" name=\"add_user_aim\" size=\"20\" maxlength=\"20\"></td></tr>"
        ."<tr><td>" . _YIM . "</td>"
        ."<td><input type=\"text\" name=\"add_user_yim\" size=\"20\" maxlength=\"20\"></td></tr>"
        ."<tr><td>" . _MSNM . "</td>"
        ."<td><input type=\"text\" name=\"add_user_msnm\" size=\"20\" maxlength=\"20\"></td></tr>"
        ."<tr><td>" . _LOCATION . "</td>"
        ."<td><input type=\"text\" name=\"add_user_from\" size=\"25\" maxlength=\"60\"></td></tr>"
        ."<tr><td>" . _OCCUPATION . "</td>"
        ."<td><input type=\"text\" name=\"add_user_occ\" size=\"25\" maxlength=\"60\"></td></tr>"
        ."<tr><td>" . _INTERESTS . "</td>"
        ."<td><input type=\"text\" name=\"add_user_intrest\" size=\"25\" maxlength=\"255\"></td></tr>"
	."<tr><td>" . _OPTION . "</td>"
        ."<td><input type=\"checkbox\" name=\"add_user_viewemail\" VALUE=\"1\"> " . _ALLOWUSERS . "</td></tr>"
	."<tr><td>" . _NEWSLETTER . "</td>"
	."<td><input type=\"radio\" name=\"add_newsletter\" value=\"1\">" . _YES . "<br>"
	."<input type=\"radio\" name=\"add_newsletter\" value=\"0\" checked>" . _NO . "</td></tr>"
        ."<tr><td>" . _SIGNATURE . "</td>"
        ."<td><textarea name=\"add_user_sig\" rows=\"6\" cols=\"45\"></textarea></td></tr>"
        ."<tr><td>" . _PASSWORD . "</td>"
        ."<td><input type=\"password\" name=\"add_pass\" size=\"12\" maxlength=\"12\"> <font class=\"tiny\">" . _REQUIRED . "</font></td></tr>"
        ."<input type=\"hidden\" name=\"add_avatar\" value=\"blank.gif\">"
        ."<input type=\"hidden\" name=\"op\" value=\"addUser\">"
        ."<tr><td><input type=\"submit\" value=\"" . _ADDUSERBUT . "\"></form></td></tr>"
        ."</table>";
    CloseTable();
    //FIX:DOMSNITT   
    // START: HACK - ADVANCED USER MANAGER
		}
	  // END: HACK - ADVANCED USER MANAGER
		//END-OF-FIX
    include("footer.php");
}

//FIX:DOMSNITT   
// START: HACK - ADVANCED USER MANAGER
//	function modifyUser($chng_user) {
	function modifyUser($chng_user, $viewmode="", $sortorder="", $start="") {
// END: HACK - ADVANCED USER MANAGER
//END-OF-FIX
    global $user_prefix, $db;
    include("header.php");
    GraphicAdmin();
    OpenTable();
    echo "<center><font class=\"title\"><b>" . _USERADMIN . "</b></font></center>";
    CloseTable();
    echo "<br>";
    $result = $db->sql_query("SELECT user_id, username, name, user_website, user_email, femail, user_icq, user_aim, user_yim, user_msnm, user_from, user_occ, user_interests, user_viewemail, user_avatar, user_sig, user_password, newsletter from " . $user_prefix . "_users where user_id='$chng_user' or username='$chng_user'");
    $numrows = $db->sql_numrows($result);
    if($numrows > 0) {
        $row = $db->sql_fetchrow($result);
	$chng_uid = intval($row['user_id']);
	$chng_uname = $row['username'];
	$chng_name = $row['name'];
	$chng_url = $row['user_website'];
	$chng_email = $row['user_email'];
	$chng_femail = $row['femail'];
	$chng_user_icq = $row['user_icq'];
	$chng_user_aim = $row['user_aim'];
	$chng_user_yim = $row['user_yim'];
	$chng_user_msnm = $row['user_msnm'];
	$chng_user_from = $row['user_from'];
	$chng_user_occ = $row['user_occ'];
	$chng_user_intrest = $row['user_interests'];
	$chng_user_viewemail = $row['user_viewemail'];
	$chng_avatar = $row['user_avatar'];
	$chng_user_sig = $row['user_sig'];
	$chng_pass = $row['user_password'];
	$chng_newsletter = intval($row['newsletter']);
	OpenTable();
	echo "<center><font class=\"option\"><b>" . _USERUPDATE . ": <i>$chng_user</i></b></font></center>"
	    ."<form action=\"admin.php\" method=\"post\">"
	    ."<table border=\"0\">"
	    ."<tr><td>" . _USERID . "</td>"
	    ."<td><b>$chng_uid</b></td></tr>"
	    ."<tr><td>" . _NICKNAME . "</td>"
	    ."<td><input type=\"text\" name=\"chng_uname\" value=\"$chng_uname\"> <font class=\"tiny\">" . _REQUIRED . "</font></td></tr>"
	    ."<tr><td>" . _NAME . "</td>"
	    ."<td><input type=\"text\" name=\"chng_name\" value=\"$chng_name\"></td></tr>"
	    ."<tr><td>" . _URL . "</td>"
	    ."<td><input type=\"text\" name=\"chng_url\" value=\"$chng_url\" size=\"30\" maxlength=\"60\"></td></tr>"
	    ."<tr><td>" . _EMAIL . "</td>"
	    ."<td><input type=\"text\" name=\"chng_email\" value=\"$chng_email\" size=\"30\" maxlength=\"60\"> <font class=\"tiny\">" . _REQUIRED . "</font></td></tr>"
	    ."<tr><td>" . _FAKEEMAIL . "</td>"
	    ."<td><input type=\"text\" name=\"chng_femail\" value=\"$chng_femail\" size=\"30\" maxlength=\"60\"></td></tr>"
	    ."<tr><td>" . _ICQ . "</td>"
	    ."<td><input type=\"text\" name=\"chng_user_icq\" value=\"$chng_user_icq\" size=\"20\" maxlength=\"20\"></td></tr>"
	    ."<tr><td>" . _AIM . "</td>"
	    ."<td><input type=\"text\" name=\"chng_user_aim\" value=\"$chng_user_aim\" size=\"20\" maxlength=\"20\"></td></tr>"
	    ."<tr><td>" . _YIM . "</td>"
	    ."<td><input type=\"text\" name=\"chng_user_yim\" value=\"$chng_user_yim\" size=\"20\" maxlength=\"20\"></td></tr>"
	    ."<tr><td>" . _MSNM . "</td>"
	    ."<td><input type=\"text\" name=\"chng_user_msnm\" value=\"$chng_user_msnm\" size=\"20\" maxlength=\"20\"></td></tr>"
	    ."<tr><td>" . _LOCATION . "</td>"
	    ."<td><input type=\"text\" name=\"chng_user_from\" value=\"$chng_user_from\" size=\"25\" maxlength=\"60\"></td></tr>"
	    ."<tr><td>" . _OCCUPATION . "</td>"
	    ."<td><input type=\"text\" name=\"chng_user_occ\" value=\"$chng_user_occ\" size=\"25\" maxlength=\"60\"></td></tr>"
	    ."<tr><td>" . _INTERESTS . "</td>"
	    ."<td><input type=\"text\" name=\"chng_user_intrest\" value=\"$chng_user_intrest\" size=\"25\" maxlength=\"255\"></td></tr>"
	    ."<tr><td>" . _OPTION . "</td>";
	if ($chng_user_viewemail ==1) {
	    echo "<td><input type=\"checkbox\" name=\"chng_user_viewemail\" value=\"1\" checked> " . _ALLOWUSERS . "</td></tr>";
	} else {
	    echo "<td><input type=\"checkbox\" name=\"chng_user_viewemail\" value=\"1\"> " . _ALLOWUSERS . "</td></tr>";
	}
	if ($chng_newsletter == 1) {
	    echo "<tr><td>" . _NEWSLETTER . "</td><td><input type=\"radio\" name=\"chng_newsletter\" value=\"1\" checked>" . _YES . "&nbsp;&nbsp;"
		."<input type=\"radio\" name=\"chng_newsletter\" value=\"0\">" . _NO . "</td></tr>";
	} elseif ($chng_newsletter == 0) {
	    echo "<tr><td>" . _NEWSLETTER . "</td><td><input type=\"radio\" name=\"chng_newsletter\" value=\"1\">" . _YES . "&nbsp;&nbsp;"
		."<input type=\"radio\" name=\"chng_newsletter\" value=\"0\" checked>" . _NO . "</td></tr>";
	}
	$subnum = $db->sql_numrows($db->sql_query("SELECT * FROM " . $prefix . "_subscriptions WHERE userid='$chng_uid'"));
	if ($subnum == 0) {
		$content .= "<tr><td>" . _SUBUSERASK . "</td><td><input type='radio' name='subscription' value='1'> " . _YES . "&nbsp;&nbsp;&nbsp;<input type='radio' name='subscription' value='0' checked> " . _NO . "</td></tr>";
		$content .= "<tr><td>" . _SUBPERIOD . "</td><td><select name='subscription_expire'>";
		$content .= "<option value='0' selected>" . _NONE . "</option>";
		$content .= "<option value='1'>1 "._YEAR."</option>";
		$content .= "<option value='2'>2 "._YEARS."</option>";
		$content .= "<option value='3'>3 "._YEARS."</option>";
		$content .= "<option value='4'>4 "._YEARS."</option>";
		$content .= "<option value='5'>5 "._YEARS."</option>";
		$content .= "<option value='6'>6 "._YEARS."</option>";
		$content .= "<option value='7'>7 "._YEARS."</option>";
		$content .= "<option value='8'>8 "._YEARS."</option>";
		$content .= "<option value='9'>9 "._YEARS."</option>";
		$content .= "<option value='10'>10 "._YEARS."</option>";
		$content .= "</select><input type='hidden' name='reason' value='0'></td></tr>";
	} elseif ($subnum == 1) {
		$content .= "<tr><td>"._UNSUBUSER."</td><td><input type='radio' name='subscription' value='0'> "._YES."&nbsp;&nbsp;&nbsp;<input type='radio' name='subscription' value='1' checked> "._NO."</td></tr>";
		$content .= "<tr><td>"._ADDSUBPERIOD."</td><td><select name='subscription_expire'>";
		$content .= "<option value='0' selected>"._NONE."</option>";
		$content .= "<option value='1'>1 "._YEAR."</option>";
		$content .= "<option value='2'>2 "._YEARS."</option>";
		$content .= "<option value='3'>3 "._YEARS."</option>";
		$content .= "<option value='4'>4 "._YEARS."</option>";
		$content .= "<option value='5'>5 "._YEARS."</option>";
		$content .= "<option value='6'>6 "._YEARS."</option>";
		$content .= "<option value='7'>7 "._YEARS."</option>";
		$content .= "<option value='8'>8 "._YEARS."</option>";
		$content .= "<option value='9'>9 "._YEARS."</option>";
		$content .= "<option value='10'>10 "._YEARS."</option>";
		$content .= "</select></td></tr>";
		$content .= "<tr><td>"._ADMSUBEXPIREIN."</td><td>";
		$rows = $db->sql_fetchrow($db->sql_query("SELECT * FROM ".$prefix."_subscriptions WHERE userid='$chng_uid'"));
		$diff = $rows[subscription_expire]-time();
		$yearDiff = floor($diff/60/60/24/365);
		$diff -= $yearDiff*60*60*24*365;
		if ($yearDiff < 1) {
			$diff = $rows[subscription_expire]-time();
		}
		$daysDiff = floor($diff/60/60/24);
		$diff -= $daysDiff*60*60*24;
		$hrsDiff = floor($diff/60/60);
		$diff -= $hrsDiff*60*60;
		$minsDiff = floor($diff/60);
		$diff -= $minsDiff*60;
		$secsDiff = $diff;
		if ($yearDiff < 1) {
			$rest = "$daysDiff "._SBDAYS.", $hrsDiff "._SBHOURS.", $minsDiff "._SBMINUTES.", $secsDiff "._SBSECONDS."";
		} elseif ($yearDiff == 1) {
			$rest = "$yearDiff "._SBYEAR.", $daysDiff "._SBDAYS.", $hrsDiff "._SBHOURS.", $minsDiff "._SBMINUTES.", $secsDiff "._SBSECONDS."";
		} elseif ($yearDiff > 1) {
			$rest = "$yearDiff "._SBYEARS.", $daysDiff "._SBDAYS.", $hrsDiff "._SBHOURS.", $minsDiff "._SBMINUTES.", $secsDiff "._SBSECONDS."";
		}
		$content .= "<font color='#FF0000'>$rest</font></td></tr>";
		$content .= "<tr><td>"._SUBREASON."</td><td><textarea name='reason' cols='60' rows='10'></textarea></td></tr>";
	}
	echo "$content";
	echo "<tr><td>" . _SIGNATURE . "</td>"
	    ."<td><textarea name=\"chng_user_sig\" rows=\"6\" cols=\"45\">$chng_user_sig</textarea></td></tr>"
	    ."<tr><td>" . _PASSWORD . "</td>"
	    ."<td><input type=\"password\" name=\"chng_pass\" size=\"12\" maxlength=\"12\"></td></tr>"
	    ."<tr><td>" . _RETYPEPASSWD . "</td>"
	    ."<td><input type=\"password\" name=\"chng_pass2\" size=\"12\" maxlength=\"12\"> <font class=\"tiny\">" . _FORCHANGES . "</font></td></tr>"
	    ."<input type=\"hidden\" name=\"chng_avatar\" value=\"$chng_avatar\">"
	    ."<input type=\"hidden\" name=\"chng_uid\" value=\"$chng_uid\">"
	    ."<input type=\"hidden\" name=\"op\" value=\"updateUser\">"
	    
	    
	    ."";
			//FIX:DOMSNITT
			// START: HACK - ADVANCED USER MANAGER - One Line above
			echo "<input type='hidden' name='viewmode' value=".$viewmode.">";
			echo "<input type='hidden' name='sortorder' value=".$sortorder.">";
			echo "<input type='hidden' name='start' value=".$start.">";
		  // END: HACK - ADVANCED USER MANAGER - One Line Below
			//END-OF-FIX
			echo ""
		
	    ."<tr><td><input type=\"submit\" value=\"" . _SAVECHANGES . "\"></form></td></tr>"
	    ."</table>";
	CloseTable();
    } else {
	OpenTable();
	echo "<center><b>" . _USERNOEXIST . "</b><br><br>"
	    ."" . _GOBACK . "</center>";
	CloseTable();
    }
    include("footer.php");
}
//FIX:DOMSNITT
// START: HACK - ADVANCED USER MANAGER
//	function updateUser($chng_uid, $chng_uname, $chng_name, $chng_url, $chng_email, $chng_femail, $chng_user_icq, $chng_user_aim, $chng_user_yim, $chng_user_msnm, $chng_user_from, $chng_user_occ, $chng_user_intrest, $chng_user_viewemail, $chng_avatar, $chng_user_sig, $chng_pass, $chng_pass2, $chng_newsletter, $subscription, $subscription_expire, $reason) {
	function updateUser($chng_uid, $chng_uname, $chng_name, $chng_url, $chng_email, $chng_femail, $chng_user_icq, $chng_user_aim, $chng_user_yim, $chng_user_msnm, $chng_user_from, $chng_user_occ, $chng_user_intrest, $chng_user_viewemail, $chng_avatar, $chng_user_sig, $chng_pass, $chng_pass2, $chng_newsletter, $subscription, $subscription_expire, $reason, $viewmode, $sortorder, $start) {
// END: HACK - ADVANCED USER MANAGER
//END-OF-FIX
    global $user_prefix, $db, $prefix, $nukeurl, $sitename, $adminmail, $subscription_url;
    $chng_uid = intval($chng_uid);
    $tmp = 0;
    if ($chng_pass2 != "") {
        if($chng_pass != $chng_pass2) {
            include("header.php");
	    GraphicAdmin();
	    OpenTable();
	    echo "<center><font class=\"title\"><b>" . _USERADMIN . "</b></font></center>";
	    CloseTable();
	    echo "<br>";
	    OpenTable();
            echo "<center>" . _PASSWDNOMATCH . "<br><br>"
		."" . _GOBACK . "</center>";
	    CloseTable();
            include("footer.php");
            exit;
        }
        $tmp = 1;
    }
    if ($tmp == 0) {
	$db->sql_query("update " . $user_prefix . "_users set username='$chng_uname', name='$chng_name', user_email='$chng_email', femail='$chng_femail', user_website='$chng_url', user_icq='$chng_user_icq', user_aim='$chng_user_aim', user_yim='$chng_user_yim', user_msnm='$chng_user_msnm', user_from='$chng_user_from', user_occ='$chng_user_occ', user_interests='$chng_user_intrest', user_viewemail='$chng_user_viewemail', user_avatar='$chng_avatar', user_sig='$chng_user_sig', newsletter='$chng_newsletter' where user_id='$chng_uid'");
    }
    if ($tmp == 1) {
    	$cpass = md5($chng_pass);
        $db->sql_query("update " . $user_prefix . "_users set username='$chng_uname', name='$chng_name', user_email='$chng_email', femail='$chng_femail', user_website='$chng_url', user_icq='$chng_user_icq', user_aim='$chng_user_aim', user_yim='$chng_user_yim', user_msnm='$chng_user_msnm', user_from='$chng_user_from', user_occ='$chng_user_occ', user_interests='$chng_user_intrest', user_viewemail='$chng_user_viewemail', user_avatar='$chng_avatar', user_sig='$chng_user_sig', user_password='$cpass', newsletter='$chng_newsletter' where user_id='$chng_uid'");
    }
	$subnum = $db->sql_numrows($db->sql_query("SELECT * FROM ".$prefix."_subscriptions WHERE userid='$chng_uid'"));
   	$row = $db->sql_fetchrow($db->sql_query("SELECT * FROM ".$prefix."_subscriptions WHERE userid='$chng_uid'"));
   	$row2 = $db->sql_fetchrow($db->sql_query("SELECT username, user_email FROM ".$user_prefix."_users WHERE user_id='$chng_uid'"));
   	if ($reason == "") {
   		$reason = 0;	
   	}
	if ($subnum == 1) {
		if ($subscription == 0) {
			$from = "$sitename <$adminmail>";
			$subject = "$sitename "._SUBCANCELLED."";
			if ($reason == "0") {
				if ($subscription_url != "") {
					$body = ""._HELLO." $row2[username]!\n\n"._SUBCANCEL."\n\n"._SUBNEEDTOAPPLY." $subscription_url\n\n"._SUBTHANKSATT."\n\n$sitename "._TEAM."\n$nukeurl";
				} else {
					$body = ""._HELLO." $row2[username]!\n\n"._SUBCANCEL."\n\n"._SUBTHANKSATT."\n\n$sitename "._TEAM."\n$nukeurl";
				}
			} else {
				if ($subscription_url != "") {
					$body = ""._HELLO." $row2[username]!\n\n"._SUBCANCELREASON."\n\n$reason\n\n"._SUBNEEDTOAPPLY." $subscription_url\n\n"._SUBTHANKSATT."\n\n$sitename "._TEAM."\n$nukeurl";
				} else {
					$body = ""._HELLO." $row2[username]!\n\n"._SUBCANCELREASON."\n\n$reason\n\n"._SUBTHANKSATT."\n\n$sitename "._TEAM."\n$nukeurl";
				}
			}
			$db->sql_query("DELETE FROM ".$prefix."_subscriptions WHERE userid='$chng_uid'");
			$from=$adminmail;
			mail($row2[user_email], $subject, $body, "From: $from\nX-Mailer: PHP/" . phpversion());
		} elseif ($subscription == 1) {
			if ($subscription_expire != 0) {
				$from = "$sitename <$adminmail>";
				$subject = "$sitename "._SUBUPDATEDSUB."";
				$body = ""._HELLO." $row2[username]!\n\n"._SUBUPDATED." $subscription_expire "._SUBYEARSTOACCOUNT."\n\n"._SUBTHANKSSUPP."\n\n$sitename "._TEAM."\n$nukeurl";
				$expire = $subscription_expire*31536000;
				if ($subnum == 0) {
					$expire = $expire+time();
				}
				$expire = $expire+$row[subscription_expire];
				$db->sql_query("UPDATE ".$prefix."_subscriptions SET subscription_expire='$expire' WHERE userid='$chng_uid'");
				$from=$adminmail;
				mail($row2[user_email], $subject, $body, "From: $from\nX-Mailer: PHP/" . phpversion());
			}
		}
	} elseif ($subnum == 0 AND $subscription == 1) {
		if ($subscription_expire != 0) {
			$expire = $subscription_expire*31536000;
			$expire = $expire+time();
			$db->sql_query("INSERT INTO ".$prefix."_subscriptions VALUES (NULL, '$chng_uid', '$expire')");
			$from = "$sitename <$adminmail>";
			$subject = "$sitename "._SUBACTIVATED."";
			$body = ""._HELLO." $row2[username]!\n\n"._SUBOPENED." $subscription_expire "._SUBOPENED2."\n\n"._SUBHOPELIKE."\n"._SUBTHANKSSUPP2."\n\n$sitename "._TEAM."\n$nukeurl";
			mail($row2[user_email], $subject, $body, "From: $from\nX-Mailer: PHP/" . phpversion());
		}
	}
    //FIX:DOMSNITT   
    // START: HACK - ADVANCED USER MANAGER
		//Header("Location: ".$admin_file.".php?op=adminMain");
		Header("Location: ".$admin_file.".php?op=advancedUserManager&map;viewmode=".$viewmode."&amp;sortorder=".$sortorder."&amp;start=".$start."");
		// END: HACK - ADVANCED USER MANAGER
    //END-OF-FIX
}

//FIX:DOMSNITT
// START: HACK - ADVANCED USER MANAGER
	function modifyLastVisit($user_id, $username, $user_lastvisit)
	{
		global $admin_file, $bgcolor2;
		include("header.php");
		GraphicAdmin();
		OpenTable();
		echo "<center><b>"._USERADMIN."</b></center>";
		CloseTable();
		echo "<br />";
		OpenTable();
		ListInactivatedReg();
		menu();
		echo "<br>";

		if (empty($user_lastvisit))
		{
			$user_lastvisit = (""._AUM_UNAVIAILABLE."");
			$month_select = 0;
			$day_select = 0;
			$year_select = 1969;
			$hour_select = 0;
			$min_select = 0;
			$sec_select = 0;
		}
		else
		{
			$month_select = date("m", $user_lastvisit);
			$day_select = date("d", $user_lastvisit);
			$year_select = date("Y", $user_lastvisit);
			$hour_select = date("G", $user_lastvisit);
			$min_select = date("i", $user_lastvisit);
			$sec_select = date("s", $user_lastvisit);

			$user_lastvisit = intval($user_lastvisit);
			$timedateformat = (""._TIMEDATEFORMAT."");
			$user_lastvisit = date($timedateformat, $user_lastvisit);
		};

		$select_month = '<select name="month">';
		for($i= 1; $i<=12; $i++)
		{
				$selected = ($i == $month_select ) ? ' selected="selected"' : '';
				$select_month .= '<option value="' . $i . '"' . $selected . '>' . $i . '</option>';
		}
		$select_month .= '</select>';

		$select_day = '<select name="day">';
		for($i= 1; $i<=31; $i++)
		{
				$selected = ($i == $day_select ) ? ' selected="selected"' : '';
				$select_day .= '<option value="' . $i . '"' . $selected . '>' . $i . '</option>';
		}
		$select_day .= '</select>';

		$select_year = '<select name="year">';
		$current_year = intval(date("Y", time()));
		for($i= 1969; $i<=$current_year; $i++)
		{
				$selected = ($i == $year_select ) ? ' selected="selected"' : '';
				$select_year .= '<option value="' . $i . '"' . $selected . '>' . $i . '</option>';
		}
		$select_year .= '</select>';


		$select_hour = '<select name="hour">';
		for($i= 0; $i<=23; $i++)
		{
				$selected = ($i == $hour_select ) ? ' selected="selected"' : '';
				$select_hour .= '<option value="' . $i . '"' . $selected . '>' . $i . '</option>';
		}
		$select_hour .= '</select>';

		$select_min = '<select name="min">';
		for($i= 0; $i<=59; $i++)
		{
				$selected = ($i == $min_select ) ? ' selected="selected"' : '';
				$select_min .= '<option value="' . $i . '"' . $selected . '>' . $i . '</option>';
		}
		$select_min .= '</select>';

		$select_sec = '<select name="sec">';
		for($i= 0; $i<=59; $i++)
		{
				$selected = ($i == $sec_select ) ? ' selected="selected"' : '';
				$select_sec .= '<option value="' . $i . '"' . $selected . '>' . $i . '</option>';
		}
		$select_sec .= '</select>';

		echo "<table cellpadding='1' cellspacing='1' width='100%' border='0'>"
			."<form method='post' action='".$admin_file.".php'>"
			."<tr><td></td><td bgcolor='$bgcolor2' style='border:1px solid;' width='100%'><b>"._AUM_MODIFYLASTVISIT."</b></td></tr>"
			."<tr><td nowrap='nowrap' align='right'><b>".$username."</b>: </td><td nowrap='nowrap'>".$user_lastvisit."  </td></tr>"
			."<tr><td></td><td width='100%'>"
			.""._AUM_MONTH.": ".$select_month."&nbsp;"
			.""._AUM_DAY.": ".$select_day."&nbsp;"
			.""._AUM_YEAR.": ".$select_year."&nbsp;"
			."&nbsp;&nbsp;&nbsp;&nbsp;"
			.""._AUM_HOUR.": ".$select_hour."&nbsp;"
			.""._AUM_MIN.": ".$select_min."&nbsp;"
			.""._AUM_SEC.": ".$select_sec."&nbsp;"
			."</td></tr>"
			."<tr></td><td><td width='100%'><input type='hidden' name='op' value='modifyLastVisitSave'>"
			."<input type='hidden' name='user_id' value='".$user_id."'>"
			."<input type='submit' value='"._AUM_MODIFY."'>"
			."</td></tr>"
			."</form>"
			."</table>";
		CloseTable();
		include("footer.php");
	}; // end of function

	function InactiveRegList($viewmode="", $sortorder="", $start="")
	{
		global $admin_file, $bgcolor2;
		include("header.php");
		GraphicAdmin();
		OpenTable();
		echo "<center><b>"._USERADMIN."</b></center>";
		CloseTable();
		echo "<br />";
		OpenTable();
		ListInactivatedReg();
		menu();
		echo "<br>";

		// main
		// default configuration
		if (empty($viewmode))
		{
			$viewmode = 'Username';
		}
		if (empty($sortorder))
		{
			$sortorder = 'ASC';
		};
		$start = intval($start);

		// 0. menus - sort method
		$mode_types_text = array((""._AUM_USERNAME.""),
								(""._AUM_REGDATE.""),
								(""._EMAIL.""));
		$mode_types = array('username',
							'user_regdate',
							'user_email');

		$select_sort_mode = '<select name="viewmode">';
		for($i= 0; $i<count($mode_types_text); $i++)
		{
			$selected = ($viewmode == $mode_types[$i] ) ? ' selected="selected"' : '';
			$select_sort_mode .= '<option value="' . $mode_types[$i] . '"' . $selected . '>' . $mode_types_text[$i] . '</option>';
		}
		$select_sort_mode .= '</select>';

		$select_sort_order = '<select name="sortorder">';
		if($sortorder == 'ASC')
		{
			$select_sort_order .= '<option value="ASC" selected="selected">' . ""._ASCENDING."" . '</option><option value="DESC">' . ""._DESCENDING."" . '</option>';
		}
		else
		{
			$select_sort_order .= '<option value="ASC">' . ""._ASCENDING."" . '</option><option value="DESC" selected="selected">' . ""._DESCENDING."" . '</option>';
		}
		$select_sort_order .= '</select>';

		echo "<table cellpadding='0' cellspacing='0' width='100%' border='0'>"
			."<form method='post' action='".$admin_file.".php'>"
			."<tr>"
			."<td width='100%'>&nbsp;</td>"
			."<td align='right' nowrap='nowrap'>"._SELECTSORTMETHOD.": $select_sort_mode  "._ORDER.": $select_sort_order &nbsp;</td>"
			."<td nowrap='nowrap'>"
			."<input type='hidden' name='op' value='aumInactiveRegList'>"
			."<input type='submit' value='"._SORT."'>"
			."</tr>"
			."</form>"
			."</table>";

		// lists
		echo "<table cellpadding='1' cellspacing='1' width='100%' style='border: 1px solid;'>"
			."<tr>"
			."<td align='center'>#</td>"
			."<td nowrap='nowrap' align='center' bgcolor='$bgcolor2'><b>"._AUM_USERNAME."</b></td>"
			."<td nowrap='nowrap' align='center' bgcolor='$bgcolor2'><b>"._AUM_REGDATE."</b></td>"
			."<td nowrap='nowrap' align='center' bgcolor='$bgcolor2'><b>"._EMAIL."</b></td>"
			."<td nowrap='nowrap' align='right' bgcolor='$bgcolor2' width='100%'><b>"._FUNCTIONS."</b></td>"
			."</tr>";

		$nperpage = 25;
		switch($viewmode)
		{
			case 'username':
                $order_by = "username $sortorder LIMIT $start, " . $nperpage;
                break;
			case 'email':
                $order_by = "user_email $sortorder LIMIT $start, " . $nperpage;
                break;
			case 'user_regdate':
                $order_by = "user_regdate $sortorder LIMIT $start, " . $nperpage;
                break;
			default:
                $order_by = "user_id $sortorder LIMIT $start, " . $nperpage;
                break;
		}

		// total rows
        $sql = "SELECT * FROM ".$prefix."_users_temp WHERE user_id <> 1";
		$result = $db->sql_query($sql);
		$totalrows = $db->sql_numrows($result);

		$sql = "SELECT * FROM ".$prefix."_users_temp WHERE user_id <> 1 ORDER BY $order_by";
		$result = $db->sql_query($sql);
		$numrows = $db->sql_numrows($result);
		if($numrows > 0)
		{
			$image_activate = "<img src='images/activate.gif' border='0' align='absmiddle' />";
			$image_resendemail = "<img src='images/resend.gif' border='0' align='absmiddle' />";
			$image_delete = "<img src='images/delete.gif' border='0' align='absmiddle' />";
			$image_view = "<img src='images/view.gif' border='0' align='absmiddle' />";
			echo "<form method='post' name='user_checklist' action='".$admin_file.".php?op=aumInactiveRegUserManager'>";
			$counter = 0;
			while ($row=$db->sql_fetchrow($result))
			{
				$user_id = $row['user_id'];
				$username = $row['username'];
				$user_regdate = $row['user_regdate'];
				$email = $row['email'];
				$counter++;
				if (($counter % 5) == 0)
				{
					$grid = " bgcolor='$bgcolor2' ";
				}
				else
				{
					$grid = " ";
				};
				echo "<tr>";
				echo "<td nowrap='nowrap' align='center' $grid>$user_id</td>";
				echo "<td nowrap='nowrap' align='center' $grid>$username</td>";
				echo "<td nowrap='nowrap' align='center' $grid>$user_regdate</td>";
				echo "<td nowrap='nowrap' align='center' $grid>$email</td>";
				echo "<td nowrap='nowrap' align='right' $grid>"
					."<a href='".$admin_file.".php?op=aumActivateTempUser&amp;user_id=".$user_id."&amp;username=".$username."&amp;viewmode=".$viewmode."&amp;sortorder=".$sortorder."&amp;start=".$start."'>$image_activate</a> "
					."<a href='".$admin_file.".php?op=aumResendEmail&amp;user_id=".$user_id."&amp;username=".$username."&amp;viewmode=".$viewmode."&amp;sortorder=".$sortorder."&amp;start=".$start."'>$image_resendemail</a> "
					."<a href='".$admin_file.".php?op=aumDelInactiveRegUser&amp;user_id=".$user_id."&amp;username=".$username."&amp;viewmode=".$viewmode."&amp;sortorder=".$sortorder."&amp;start=".$start."'>$image_delete</a> "
					."<a href='".$admin_file.".php?op=aumViewInactiveRegUser&amp;user_id=".$user_id."&amp;username=".$username."'>$image_view</a> "
					."<input type='checkbox' name='mark[]2' value='".$user_id."' />"
					."</td>";
				echo "</tr>";
			};
			// extra delete menu
			echo "<tr>"
				."<td colspan='5' width='100%' align='right'><input type='hidden' name='viewmode' value='".$viewmode."'><input type='hidden' name='sortorder' value='".$sortorder."'><input type='hidden' name='start' value='".$start."'><input type='submit' name='select' value='"._AUM_ACTIVATEMARKED."'>&nbsp;<input type='submit' name='select' value='"._AUM_ACTIVATEALL."'></td>"
				."</tr>"
				."<tr>"
				."<td colspan='5' width='100%' align='right'><input type='hidden' name='viewmode' value='".$viewmode."'><input type='hidden' name='sortorder' value='".$sortorder."'><input type='hidden' name='start' value='".$start."'><input type='submit' name='select' value='"._AUM_RESENDMARKED."'>&nbsp;<input type='submit' name='select' value='"._AUM_RESENDALL."'></td>"
				."</tr>"
				."<tr>"
				."<td colspan='5' width='100%' align='right'><input type='hidden' name='viewmode' value='".$viewmode."'><input type='hidden' name='sortorder' value='".$sortorder."'><input type='hidden' name='start' value='".$start."'><input type='submit' name='select' value='"._AUM_REMOVEMARKED."'>&nbsp;<input type='submit' name='select' value='"._AUM_REMOVEALL."'></td>"
				."</tr>"
				."<tr>"
				."<td colspan='5' width='100%' align='right'><input type='hidden' name='viewmode' value='".$viewmode."'><input type='hidden' name='sortorder' value='".$sortorder."'><input type='hidden' name='start' value='".$start."'><input type='submit' name='select' value='"._AUM_VIEWMARKED."'>&nbsp;<input type='submit' name='select' value='"._AUM_VIEWALL."'></td>"
				."</tr>"
				."</form>"
				."</table>";
		}
		else
		{
			echo "<tr><td colspan='5' width='100%' align='center'><b>"._AUM_NOTEMPUSERSFOUND."</b></td></tr></table>";
		};

		// page number & pagination
        $pagenumber = sprintf("Page <b>%d</b> of %d", (floor($start/$nperpage)+1), ceil($totalrows/$nperpage));
		$pagination = generate_pagination("admin.php?op=aumInactiveRegList&amp;viewmode=$viewmode&amp;sortorder=$sortorder", $totalrows, $nperpage, $start). '&nbsp;';
		echo "<table width='100%' cellpadding='1' cellspacing='0' border='0'>"
			."<tr>"
			."<td nowrap='nowrap' align='left'>".$pagenumber."</td>"
			."<td width='100%'>&nbsp;</td>"
			."<td nowrap='nowrap' algin='right'>".$pagination."</td>"
			."</tr>"
			."</table>";

		CloseTable();
		include("footer.php");
	}

	function ResendEmail($user_id, $username, $viewmode="", $sortorder="", $start="")
	{
		global $admin_file, $bgcolor2;
		global $stop, $EditedMessage, $adminmail, $sitename, $Default_Theme, $user_prefix, $db, $storyhome, $module_name, $nukeurl, $admin_file;
		
		include("header.php");
		GraphicAdmin();
		OpenTable();
		echo "<center><b>"._USERADMIN."</b></center>";
		CloseTable();
		echo "<br />";
		OpenTable();
		ListInactivatedReg();
		menu();
		echo "<br>";
		echo "<center>"._AUM_RESENDMAIL." "
			."("._AUM_USERID.": ".$user_id.""
			.", "
			.""._AUM_USERNAME.": ".$username.""
			.") "
			."[ "
			."<a href='".$admin_file.".php?op=aumResendEmailConfirm&amp;user_id=".$user_id."&amp;username=".$username."&amp;viewmode=".$viewmode."&amp;sortorder=".$sortorder."&amp;start=".$start."'>"._YES."</a>"
			." | "
			."<a href='".$admin_file.".php?op=aumInactiveRegList&amp;viewmode=".$viewmode."&amp;sortorder=".$sortorder."&amp;start=".$start."'>"._NO."</a>"
			." ]";
		CloseTable();
		include("footer.php");
	}; // end of function

	function ResendEmailConfirm($user_id, $username, $viewmode="", $sortorder="", $start="")
	{
		//global $adminmail, $sitename, $prefix, $db, $nukeurl, $admin_file,$module_name$,$Default_Theme, $user_prefix,$stop, $EditedMessage;
			global $stop, $EditedMessage, $adminmail, $sitename, $Default_Theme, $user_prefix, $db, $storyhome, $module_name, $nukeurl, $admin_file;
		
		include("header.php");
		GraphicAdmin();
		OpenTable();
		echo "<center><b>"._USERADMIN."</b></center>";
		CloseTable();
		echo "<br />";
		OpenTable();
		ListInactivatedReg();
		menu();
		echo "<br>";
		$result = $db->sql_query("SELECT * FROM ".$prefix."_users_temp WHERE user_id = '$user_id'");
		$row = $db->sql_fetchrow($result);
		$user_id = intval($row['user_id']);
		$username = $row['username'];
		$user_email = $row['user_email'];
		$user_password = $row['user_password'];
		$user_regdate = $row['user_regdate'];
		//$check_num = intval($row['check_num']);
		$check_num = $row['check_num'];
		$time = $row['time'];
		$finishlink = "$nukeurl/modules.php?name=$module_name&op=activate&username=$username&check_num=$check_num";
		$message = ""._WELCOMETO." $sitename!\n\n"._YOUUSEDEMAIL." ($user_email) "._TOREGISTER." $sitename.\n\n "._TOFINISHUSER."\n\n $finishlink\n\n "._FOLLOWINGMEM."\n\n"._UNICKNAME." $username\n"._UPASSWORD." $user_password"."(Hash)";
		
		
		$subject = ""._ACTIVATIONSUB."";
	  $from = "$adminmail";
		
		mail($user_email, $subject, $message, "From: $from\nX-Mailer: PHP/" . phpversion());
		echo "<center><b>$username:</b> "._AUM_RESENDMAILSUCCESS."</center>";
		echo "<meta http-equiv='refresh' content='5; URL=".$admin_file.".php?op=aumInactiveRegList&amp;viewmode=".$viewmode."&amp;sortorder=".$sortorder."&amp;start=".$start."'>";
		echo "<br>";
		CloseTable();
		include("footer.php");
	}; // end of function

	function ActivateTempUser($user_id, $username, $viewmode="", $sortorder="", $start="")
	{
		global $admin_file, $bgcolor2;
		include("header.php");
		GraphicAdmin();
		OpenTable();
		echo "<center><b>"._USERADMIN."</b></center>";
		CloseTable();
		echo "<br />";
		OpenTable();
		ListInactivatedReg();
		menu();
		echo "<br>";
		echo "<center>"._AUM_ACTIVATETEMPUSER." "
			."("._AUM_USERID.": ".$user_id.""
			.", "
			.""._AUM_USERNAME.": ".$username.""
			.") "
			."[ "
			."<a href='".$admin_file.".php?op=aumActivateTempUserConfirm&amp;user_id=".$user_id."&amp;username=".$username."&amp;viewmode=".$viewmode."&amp;sortorder=".$sortorder."&amp;start=".$start."'>"._YES."</a>"
			." | "
			."<a href='".$admin_file.".php?op=aumInactiveRegList&amp;viewmode=".$viewmode."&amp;sortorder=".$sortorder."&amp;start=".$start."'>"._NO."</a>"
			." ]";
		CloseTable();
		include("footer.php");
	}; // end of function

	function ActivateTempUserConfirm($user_id, $username, $viewmode="", $sortorder="", $start="")
	{
		global $admin_file, $bgcolor2, $db, $prefix, $user_prefix, $nukeurl;
		include("header.php");
		GraphicAdmin();
		OpenTable();
		echo "<center><b>"._USERADMIN."</b></center>";
		CloseTable();
		echo "<br />";
		OpenTable();
		ListInactivatedReg();
		menu();
		echo "<br>";

		$result = $db->sql_query("SELECT * FROM ".$prefix."_users_temp WHERE user_id='$user_id'");
		$row = $db->sql_fetchrow($result);
		$user_email = $row['user_email'];
		$user_password = $row['user_password'];
		$user_regdate = $row['user_regdate'];
		$check_num = $row['check_num'];
		$time = intval($row['time']);
		$result = $db->sql_query("SELECT * FROM ".$user_prefix."_users_temp WHERE username='$username' AND check_num='$check_num'");
		if ($db->sql_numrows($result) == 1)
		{
			$row = $db->sql_fetchrow($result);
			if ($check_num == $row[check_num])
			{
				//$db->sql_query("INSERT INTO ".$user_prefix."_users (user_id, username, user_email, user_password, user_avatar, user_regdate, user_lang) VALUES (NULL, '$row[username]', '$row[user_email]', '$row[user_password]', 'gallery/blank.gif', '$row[user_regdate]', '$language')");
				$query = "INSERT INTO ".$user_prefix."_users (user_id, username, user_email, user_password, user_avatar, user_avatar_type, user_regdate, user_lang,usertype,gradyear,company,designation,name,specialization) VALUES (NULL, '$row[username]', '$row[user_email]', '$row[user_password]', 'gallery/blank.gif', 3, '$row[user_regdate]', '$language','$row[usertype]',$row[gradyear],'$row[company]','$row[designation]','$row[fullname]','$row[specialization]')";
				echo $query;
				toLog($query);				
				$db->sql_query("INSERT INTO ".$user_prefix."_users (user_id, username, user_email, user_password, user_avatar, user_avatar_type, user_regdate, user_lang,usertype,gradyear,company,designation,name,specialization) VALUES (NULL, '$row[username]', '$row[user_email]', '$row[user_password]', 'gallery/blank.gif', 3, '$row[user_regdate]', '$language','$row[usertype]',$row[gradyear],'$row[company]','$row[designation]','$row[fullname]','$row[specialization]')");
				
				
				$db->sql_query("DELETE FROM ".$user_prefix."_users_temp WHERE username='$username' AND check_num='$check_num'");
				echo "<center><b>$row[username]:</b> "._AUM_ACTIVATIONSUCCESS."</center>";
				echo "<meta http-equiv='refresh' content='3; URL=".$admin_file.".php?op=aumInactiveRegList&amp;viewmode=".$viewmode."&amp;sortorder=".$sortorder."&amp;start=".$start."'>";
			}
			else
			{
				echo "<center>"._AUM_ACTIVATIONERROR1."</center>";
			}
		}
		else
		{
			echo "<center>"._AUM_ACTIVATIONERROR2."</center>";
		}
		echo "<br><center>"._GOBACK."</center><br>";
		CloseTable();
		include("footer.php");
	}; // end of function

	function DeleteTempUser($user_id, $username, $viewmode="", $sortorder="", $start="")
	{
		global $admin_file, $bgcolor2;
		include("header.php");
		GraphicAdmin();
		OpenTable();
		echo "<center><b>"._USERADMIN."</b></center>";
		CloseTable();
		echo "<br />";
		OpenTable();
		ListInactivatedReg();
		menu();
		echo "<br>";
		echo "<center>"._AUM_DELETETEMPUSER." "
			."("._AUM_USERID.": ".$user_id.""
			.", "
			.""._AUM_USERNAME.": ".$username.""
			.") "
			."[ "
			."<a href='".$admin_file.".php?op=aumDelInactiveRegUserConfirm&amp;user_id=".$user_id."&amp;username=".$username."&amp;viewmode=".$viewmode."&amp;sortorder=".$sortorder."&amp;start=".$start."'>"._YES."</a>"
			." | "
			."<a href='".$admin_file.".php?op=aumInactiveRegList&amp;viewmode=".$viewmode."&amp;sortorder=".$sortorder."&amp;start=".$start."'>"._NO."</a>"
			." ]";
		CloseTable();
		include("footer.php");
	}; // end of function

	function DeleteTempUserConfirm($user_id, $username, $viewmode="", $sortorder="", $start="")
	{
		global $admin_file, $bgcolor2, $prefix, $user_prefix, $db;
		include("header.php");
		GraphicAdmin();
		OpenTable();
		echo "<center><b>"._USERADMIN."</b></center>";
		CloseTable();
		echo "<br />";
		OpenTable();
		ListInactivatedReg();
		menu();
		echo "<br>";
		$result = $db->sql_query("SELECT * FROM ".$prefix."_users_temp WHERE user_id='$user_id'");
		$row = $db->sql_fetchrow($result);
		$user_email = $row['user_email'];
		$user_password = $row['user_password'];
		$user_regdate = $row['user_regdate'];
		$check_num = $row['check_num'];
		$db->sql_query("DELETE FROM ".$user_prefix."_users_temp WHERE username='$username' AND check_num='$check_num'");
		echo "<center><b>$row[username]:</b> "._AUM_REMOVEPENDINGUSERSUCCESS."</center>";
		echo "<meta http-equiv='refresh' content='3; URL=".$admin_file.".php?op=aumInactiveRegList&amp;viewmode=".$viewmode."&amp;sortorder=".$sortorder."&amp;start=".$start."'>";
		echo "<br><br><center>"._GOBACK."</center><br>";
		CloseTable();
		include("footer.php");
	}; // end of function

	function ViewInactiveRegUser($user_id, $username, $viewmode="", $sortorder="", $start="")
	{
		global $admin_file, $bgcolor2, $db, $prefix;
		include("header.php");
		GraphicAdmin();
		OpenTable();
		echo "<center><b>"._USERADMIN."</b></center>";
		CloseTable();
		echo "<br />";
		OpenTable();
		ListInactivatedReg();
		menu();
		echo "<br>";
		$user_id = intval($user_id);
		$result=$db->sql_query("SELECT * from ".$prefix."_users_temp WHERE user_id = '$user_id'");
		$row = $db->sql_fetchrow($result);
		$user_id = intval($row['user_id']);
		$username = $row['username'];
		$user_email = $row['user_email'];
		$user_password = $row['user_password'];
		$user_regdate = $row['user_regdate'];
		$check_num = $row['check_num'];
		echo "<table cellpadding='1' cellspacing='1' border='0' width='100%'>"
			."<tr><td></td><td width='100%' style='border: 1px solid;' bgcolor='$bgcolor2'>"._AUM_TEMPUSER_INFO."</td>"
			."<tr><td nowrap='nowrap' align='right'><b>"._AUM_USERID.": </td><td width='100%'>".$user_id."<td></tr>"
			."<tr><td nowrap='nowrap' align='right'><b>"._AUM_USERNAME.": </td><td width='100%'>".$username."<td></tr>"
			."<tr><td nowrap='nowrap' align='right'><b>"._AUM_USEREMAIL.": </td><td width='100%'>".$user_email."<td></tr>"
			."<tr><td nowrap='nowrap' align='right'><b>"._AUM_USERPASSWORD.": </td><td width='100%'>".$user_password."<td></tr>"
			."<tr><td nowrap='nowrap' align='right'><b>"._AUM_USERREGDATE.": </td><td width='100%'>".$user_regdate."<td></tr>"
			."<tr><td nowrap='nowrap' align='right'><b>"._AUM_CHECKSUM.": </td><td width='100%'>".$check_num."<td></tr>"
			."</table>"
			."<br>";
		echo "<center>"._GOBACK."</center>";
		echo "<br>";
		CloseTable();
		include("footer.php");
	}; // end of function

	function aumMailDomainFilter()
	{
		global $admin_file, $bgcolor2, $db, $prefix;
		include("header.php");
		GraphicAdmin();
		OpenTable();
		echo "<center><b>"._USERADMIN."</b></center>";
		CloseTable();
		echo "<br />";
		OpenTable();
		ListInactivatedReg();
		menu();
		CloseTable();
		echo "<br>";
		OpenTable();

		$sql = "SELECT * FROM ".$prefix."_aum_mfilter";
		$result = $db->sql_query($sql);
		$numrows = $db->sql_numrows($result);
		echo "<table width='100%' cellpadding='1' cellspacing='1' border='0' style='border-top: 1px $bgcolor2 solid; border-bottom: 1px $bgcolor2 solid;'>"
			."<form method='post' action='".$admin_file.".php'>"
			."<tr><td width='100%' align='center' bgcolor='$bgcolor2' width='100%'>"._AUM_DUPMF_LIST."</td>"
			."<td nowrap='nowrap' bgcolor='$bgcolor2'>"._AUM_SELECT."</td></tr>";
		if (!$numrows)
		{
			echo "<tr><td colspan='2' align='center' width='100%'><b>"._AUM_DUPMF_NOTFOUND."</td></tr>";
		}
		else
		{
			while ($row=$db->sql_fetchrow($result))
			{
				$mfid=intval($row['mfid']);
				$mdomain=$row['mdomain'];
				echo "<tr><td width='100%'>".$mdomain."</td>";
				echo "<td><input type='checkbox' name='mfid_check[]2' value='$mfid'></td>";
				echo "</tr>";
			};
			echo "<tr><td colspan='2' align='right'>";
			echo "<input type='hidden' name='op' value='aumMDFilterDelete'>";
			echo "<input type='submit' name='delete' value='"._REMOVEMARKED."'>&nbsp;";
			echo "<input type='submit' name='delete' value='"._REMOVEALL."'></td>";
			echo "</tr>";
		};					
		echo "</form></table>";
		echo "<br>";
		echo "<table width='100%' cellpadding='1' cellspacing='1' border='0'>"
			."<form method='post' action='".$admin_file.".php'>"
			."<tr><td nowrap='nowrap' align='right'><b>"._AUM_DUPMF_DOMAIN."</b>: </td>"
			."<td width='100%'><input name='mdomain' value='' size='60' maxlength='60'>&nbsp;<input type='hidden' name='op' value='aumMDFilterAdd'><input type='submit' value='"._ADD."'></td></tr>"
			."</form></table>";
		CloseTable();
		include("footer.php");
	}; // end of function

	function aumDUPConfig()
	{
		global $admin_file, $bgcolor2, $db, $prefix;
		include("header.php");
		GraphicAdmin();
		OpenTable();
		echo "<center><b>"._USERADMIN."</b></center>";
		CloseTable();
		echo "<br />";
		OpenTable();
		ListInactivatedReg();
		menu();
		CloseTable();
		echo "<br>";
		OpenTable();

		$result = $db->sql_query("SELECT * FROM ".$prefix."_aum_dupconfig");
		$row = $db->sql_fetchrow($result);
		$allowSchedule = intval($row['allowSchedule']);
		$duptime = intval($row['duptime']);
		$allowSendMail = intval($row['allowSendMail']);
		$duration = intval($row['duration']);
		$mbtext = $row['mbtext'];
		echo "<table width='100%' cellpadding='1' cellspacing='1' border='0'>"
			."<form method='post' action='".$admin_file.".php'>"
			."<tr><td></td><td nowrap='nowrap' width='100%' bgcolor='$bgcolor2'>"._AUM_DUPCONFIG."</td></tr>"
			."<tr><td nowrap='nowrap' align='right'><b>"._AUM_DUP_SCHEDULE."</b>: </td>";
		echo "<td width='100%'>";
		if ($allowSchedule)
		{
			echo "<input type='radio' name='allowSchedule' value='1' checked>" . _YES . " &nbsp;<input type='radio' name='allowSchedule' value='0'>" . _NO . "";
		}
		else
		{
			echo "<input type='radio' name='allowSchedule' value='1'>" . _YES . " &nbsp;<input type='radio' name='allowSchedule' value='0' checked>" . _NO . "";
		};
		echo "</td></tr>";
		echo "<tr><td nowrap='nowrap' align='right' valign='top'><b>"._AUM_DUPDURATION."</b>: </td><td width='100%'>";
		echo ""._AUM_DUPDURATION."<br>";
		echo "<input type='text' name='duptime' value='$duptime' size='10' maxlength='12'>&nbsp;"._DAYS."";
		echo "  "._AUM_DUPDUR_DESC."";
		echo "</td></tr>";
		echo "<tr><td nowrap='nowrap' align='right' valign='top'><b>"._AUM_DUP_ALLOWSENDMAIL."</b>: </td>";
		echo "<td width='100%'>";
		if ($allowSendMail)
		{
			echo "<input type='radio' name='allowSendMail' value='1' checked>" . _YES . " &nbsp;<input type='radio' name='allowSendMail' value='0'>" . _NO . "";
		}
		else
		{
			echo "<input type='radio' name='allowSendMail' value='1'>" . _YES . " &nbsp;<input type='radio' name='allowSendMail' value='0' checked>" . _NO . "";
		};
		echo "&nbsp;&nbsp;"._AUM_DUP_SENDMAILDESC1."";
		echo "<br>";
		echo ""._AUM_DUP_AFTERDAYS."&nbsp;<input type='text' name='duration' value='$duration' size='11' maxlength='12'>&nbsp;"._DAYS."&nbsp;"._AUM_DUP_SENDMAILDESC2."";
		echo "</td></tr>";
		echo "<tr><td nowrap='nowrap' align='right' valign='top'><b>"._AUM_DUPMFTEXTBODY."</b>: </td>"
			."<td width='100%'>"._AUM_DUMPMF_DESC."<br /><textarea cols='30' rows='15' name='mbtext' style='width: 100%;'>$mbtext</textarea></td></tr>"
			."<tr><td></td><td width='100%'>"
			."<input type='hidden' name='op' value='aumDUPConfigSave'>"
			."<input type='submit' value='"._SAVE."'></td></tr>"
			."</form></table>";
		CloseTable();
		include("footer.php");
	}; // end of function

	function aumDUPConfigSave($allowSchedule, $duptime, $allowSendMail, $duration, $mbtext)
	{
		global $admin_file, $bgcolor2, $db, $prefix;
		include("header.php");
		GraphicAdmin();
		OpenTable();
		echo "<center><b>"._USERADMIN."</b></center>";
		CloseTable();
		echo "<br>";
		OpenTable();
		$allowSchedule = intval($allowSchedule);
		$duptime = intval($duptime);
		$allowSendMail = intval($allowSendMail);
		$duration = intval($duration);
		if ($mbtext == "")
		{
			echo "<br>"
				."<center>"._ERROR." "._AUM_DUPCONFIG_NOMAILBODY."<br><br>"._GOBACK."</center><br>";
		}
		else
		{
			$result = $db->sql_query("SELECT * FROM ".$prefix."_aum_dupconfig");
			$numrows = $db->sql_numrows($result);
			echo "<center>";
			if ($numrows)
			{	// update
				$db->sql_query("UPDATE " . $prefix . "_aum_dupconfig SET allowSchedule='$allowSchedule', duptime='$duptime', allowSendMail='$allowSendMail', duration='$duration', mbtext='$mbtext' WHERE configid=1");
				echo "<br>"
					.""._AUM_DUPCONFIG_UPDATED."<br><br>"
					."<a href='".$admin_file.".php?op=aumDUPConfig'>"._AUM_GOBACK."</a>"
					."<br>";
			}
			else
			{	// insert
				$db->sql_query("INSERT INTO ".$prefix."_aum_dupconfig VALUES (NULL, '$allowSchedule', '$duptime', '$allowSendMail', '$duration', '$mbtext')");
				echo "<br>"
					.""._AUM_DUPCONFIG_SAVED."<br><br>"
					."<a href='".$admin_file.".php?op=aumDUPConfig'>"._AUM_GOBACK."</a>"
					."<br>";
			}; // end of if-else ladder
			echo "</center>";
		}; // end of if-else ladder
		CloseTable();
		include("footer.php");
	}; // end of function

	function aumPruneQRemove()
	{
		global $admin_file, $bgcolor2, $db, $prefix;
		include("header.php");
		GraphicAdmin();
		OpenTable();
		echo "<center><b>"._USERADMIN."</b></center>";
		CloseTable();
		echo "<br>";
		OpenTable();
		echo "<br>";
		$numrows = $db->sql_numrows($db->sql_query("SELECT * FROM ".$prefix."_aum_pruneq"));
		if ($numrows)
		{
			$db->sql_query("TRUNCATE ".$prefix."_aum_pruneq");
			echo "<center><b>"._RESULTS."</b>: "._AUM_PRUNEQREMOVEDNUM."- (".$numrows.")<br/>";
		}
		else
		{
			echo "<center><b>"._WARNING."</b>: "._AUM_PRUNEQNOTFOUND."<br/>";
		};
		echo "<br>"
			."<a href='".$admin_file.".php?op=mod_users'>"._AUM_GOBACK."</a>"
			."<br>";
		echo "</center>";
		CloseTable();
		include("footer.php");
	}; // end of function
	
	function aumUserTempRemove()
	{
		global $admin_file, $bgcolor2, $db, $prefix;
		include("header.php");
		GraphicAdmin();
		OpenTable();
		echo "<center><b>"._USERADMIN."</b></center>";
		CloseTable();
		echo "<br>";
		OpenTable();
		$numrows = $db->sql_numrows($db->sql_query("SELECT * FROM ".$user_prefix."_users_temp"));
		if ($numrows)
		{
			$db->sql_query("TRUNCATE ".$user_prefix."_users_temp");
			echo "<center><b>"._RESULTS."</b>: "._AUM_USERTMPREMOVEDNUM."- (".$numrows.")<br/>";
		}
		else
		{
			echo "<center><b>"._WARNING."</b>: "._AUM_USERTMPNOTFOUND."<br/>";
		};
		echo "<br>"
			."<a href='".$admin_file.".php?op=mod_users'>"._AUM_GOBACK."</a>"
			."<br>";
		echo "</center>";
		CloseTable();
		include("footer.php");
	}; // end of function  

	function aumDeadUserList()
	{
		global $admin_file, $bgcolor2, $db, $prefix, $user_prefix;
		include("header.php");
		GraphicAdmin();
		OpenTable();
		echo "<center><b>"._USERADMIN."</b></center>";
		CloseTable();
		echo "<br>";
		OpenTable();
		ListInactivatedReg();
		menu();
		CloseTable();

		// list up the table
		OpenTable();
		echo "<center><b>"._AUM_DEADUSERLIST."</b></center>";

		// dead users
		$result_dupconfig = $db->sql_query("SELECT * FROM ".$prefix."_aum_dupconfig");
		$n_dupconfig = $db->sql_numrows($result_dupconfig);
		if ($n_dupconfig)
		{
			$row_dupconfig = $db->sql_fetchrow($result_dupconfig);
			$allowSchedule = intval($row_dupconfig['allowSchedule']);
			if ($allowSchedule)
			{
				$duptime = intval($row_dupconfig['duptime']);
				$duptime = time()-$duptime*24*60*60;
				$result = $db->sql_query("SELECT * FROM ".$user_prefix."_users WHERE user_lastvisit < '$duptime' AND user_id <> 1");
				$n_deadusers = $db->sql_numrows($result);
				echo "<table align='center' cellpadding='1' cellspacing='1' border='0' width='100%' style='border-top: 1px $bgcolor2 solid; border-bottom: 1px $bgcolor2 solid;'>"
					."<tr><td bgcolor='$bgcolor2' nowrap='nowrap' align='center' width='15%'>&nbsp;"._USERNAME."&nbsp;</td>"
					."<td bgcolor='$bgcolor2' nowrap='nowrap' align='center' width='25%'>&nbsp;"._AUM_MAILING."&nbsp;</td>"
					."<td bgcolor='$bgcolor2' nowrap='nowrap' align='center' width='25%'>&nbsp;"._LASTVISIT."&nbsp;</td>"
					."<td bgcolor='$bgcolor2' nowrap='nowrap' align='center' width='20%'>&nbsp;"._AUM_REGDATE."&nbsp;</td>"
					."<td bgcolor='$bgcolor2' nowrap='nowrap' align='center' width='15%'>&nbsp;"._AUM_DUP_DEADLINE."&nbsp;</td>"
					."<td bgcolor='$bgcolor2' nowrap='nowrap' align='center' width='15%'>&nbsp;"._FUNCTIONS."&nbsp;</td>"
					."</tr>";
				if ($n_deadusers)
				{
					$image_delete = "<img src='images/delete.gif' border='0' hspace='2'>";
					$image_view = "<img src='images/view.gif' border='0' hspace='2'>";
					echo "<form method='post' name='deaduser_checklist' action='".$admin_file.".php'>";
					while ($row=$db->sql_fetchrow($result))
					{
						$user_id = intval($row['user_id']);
						$username = $row['username'];
						$user_email = $row['user_email'];
						$temp_user_lastvisit = $user_lastvisit = intval($row['user_lastvisit']);
						$timedateformat = (""._TIMEDATEFORMAT."");
						if ($user_lastvisit)
						{
							$user_lastvisit = date($timedateformat, $user_lastvisit);
						}
						else
						{
							$user_lastvisit = "Unavailable";
						};
						$user_regdate = $row['user_regdate'];
						$cut_off = date($timedateformat, $duptime);

						echo "<tr>";
						echo "<td nowrap='nowrap'>".$username."</td>";
						echo "<td nowrap='nowrap'>".$user_email."</td>";
						echo "<td nowrap='nowrap'>".$user_lastvisit."</td>";
						echo "<td nowrap='nowrap'>".$user_regdate."</td>";
						echo "<td nowrap='nowrap'>".$cut_off."</td>";
						echo "<td nowrap='nowrap'>"
							."<a href='".$admin_file.".php?op=delUser&amp;chng_uid=".$username."&amp;viewmode=".$viewmode."&amp;sortorder=".$sortorder."&amp;start=".$start."'>$image_delete</a>"
							."<a href='".$admin_file.".php?op=advancedUserMangerViewUser&amp;username=".$username."'>$image_view</a>"
							."<input type='checkbox' name='mark[]2' value='".$user_id."' />"
							."<input type='hidden' name='mark_all[]2' value='".$user_id."' />"
							."</td>";
						echo "</tr>";
					}; // end of while loop block
					echo "<tr><td colspan='6' nowrap='nowrap' width='100%' style='border-top: 1px $bgcolor2 solid;' align='left'>"._AUM_TOTAL.": ".$n_deadusers."</td></tr>";
					echo "<tr><td colspan='6' nowrap='nowrap' width='100%' style='border-top: 1px $bgcolor2 solid;' align='right'>"
						."<input type='hidden' name='op' value='aumDeadUserRemove'>"
						."<input type='submit' name='delete' value='"._REMOVEMARKED."'>&nbsp;"
						."<input type='submit' name='delete' value='"._REMOVEALL."'>"
						."</td></tr></form>";
				}
				else
				{
					echo "<tr><td colspan='6' width='100%' align='center'>"._AUM_DUPNOTFOUND."</td></tr>";
				};
				echo "</table>";
			};
		}
		else
		{
			echo "<br><center><b>"._AUM_DUPCONFIG_NOTFOUND."</b></center><br>";
			echo "<br>"
				."<a href='".$admin_file.".php?op=mod_users'>"._AUM_GOBACK."</a>"
				."<br>";
		}; // end of if-else ladder

		CloseTable();
		include("footer.php");
	}; // end of function

	function aumPruneQList()
	{
		global $admin_file, $bgcolor2, $db, $prefix, $user_prefix;
		include("header.php");
		GraphicAdmin();
		OpenTable();
		echo "<center><b>"._USERADMIN."</b></center>";
		CloseTable();
		echo "<br>";
		OpenTable();
		ListInactivatedReg();
		menu();
		CloseTable();

		
		OpenTable();
		echo "<center><b>"._AUM_PRUNEQLIST."</b></center>";

		// scheduled dead user lists in the pruning queues
		$result = $db->sql_query("SELECT * FROM ".$prefix."_aum_pruneq");
		$numrows = $db->sql_numrows($result);
		if ($numrows)
		{
			$image_delete = "<img src='images/delete.gif' border='0' hspace='2'>";
			$image_view = "<img src='images/view.gif' border='0' hspace='2'>";
			echo "<table width='100%' cellpadding='1' cellspacing='1' border='0' style='border-top: 1px $bgcolor2 solid; border-bottom: 1px $bgcolor2 solid;'>"
				."<tr>"
				."<td width='30%' bgcolor='$bgcolor2' align='center'>&nbsp;"._AUM_USERNAME."&nbsp;</td>"
				."<td width='20%' nowrap='nowrap' bgcolor='$bgcolor2' align='center'>&nbsp;"._LASTVISIT."&nbsp;</td>"
				."<td width='20%' nowrap='nowrap' bgcolor='$bgcolor2' align='center'>&nbsp;"._AUM_REGDATE."&nbsp;</td>"
				."<td width='20%' nowrap='nowrap' bgcolor='$bgcolor2' align='center'>&nbsp;"._AUM_SCHEDULEDATE."&nbsp;</td>"
				."<td width='10%' nowrap='nowrap' bgcolor='$bgcolor2' align='center'>&nbsp;"._FUNCTIONS."&nbsp;</td>"
				."</tr>";
			echo "<form method='post' name='deaduser_checklist' action='".$admin_file.".php'>";
			while ($row=$db->sql_fetchrow($result))
			{
				$user_id = intval($row['user_id']);
				$reulst_user = $db->sql_query("SELECT username, user_regdate, user_lastvisit FROM ".$user_prefix."_users WHERE user_id = '$user_id' AND user_id <> 1");
				$row_user = $db->sql_fetchrow($result_user);
				$username = $row_user['username'];
				$user_regdate = $row_user['user_regdate'];
				$timedateformat = (""._TIMEDATEFORMAT."");
				if ($user_lastvisit)
				{
					$user_lastvisit = date($timedateformat, $user_lastvisit);
				}
				else
				{
					$user_lastvisit = "Unavailable";
				};
				$pqdue = intval($row['pqdue']);
				$scheduled = date($timedateformat, $pqdue);
				echo "<tr>";
				echo "<td nowrap='nowrap'>".$username."</td>";
				echo "<td nowrap='nowrap'>".$user_lastvisit."</td>";
				echo "<td nowrap='nowrap'>".$user_regdate."</td>";
				echo "<td nowrap='nowrap'>".$scheduled."</td>";
				echo "<td nowrap='nowrap'>"
					."<a href='".$admin_file.".php?op=aumPruneQListDelete&amp;user_id=".$user_id."'>".$image_delete."</a>"
					."<a href='".$admin_file.".php?op=advancedUserMangerViewUser&amp;username=".$username."'>$image_view</a>"
					."<input type='hidden' name='mark_all[]2' value='".$user_id."' />"
					."<input type='checkbox' name='mark[]2' value='".$user_id."' />"
					."</td>";
				echo "</tr>";
			}; // end of while-loop block
			echo "<tr><td colspan='5' align='left' width='100%' style='border-top: 1px $bgcolor2 solid;'>"._AUM_TOTAL.": ".$numrows."</td></tr>";
			echo "<tr><td colspan='5' align='right' width='100%' style='border-top: 1px $bgcolor2 solid;'>"
				."<input type='hidden' name='op' value='aumPruneQListDelete'>"
				."<input type='submit' name='delete' value='"._REMOVEMARKED."'>&nbsp;"
				."<input type='submit' name='delete' value='"._REMOVEALL."'>"
				."</td></tr>";
			echo "</form></table>";
		}
		else
		{
			echo "<br><center><b>"._AUM_PRUNEQNOTFOUND."</b></center><br>";
			echo "<br>"
				."<center><a href='".$admin_file.".php?op=mod_users'>"._AUM_GOBACK."</a></center>"
				."<br>";
		}; // end of if-else ladder
		$db->sql_freeresult($result);
		CloseTable();
		include("footer.php");
	}; // end of function

// END: HACK - ADVANCED USER MANAGER
//END-OF-FIX

//toLog("Operation:" . $op);

switch($op) {

    //FIX:DOMSNITT   
    // START: HACK - ADVANCED USER MANAGER
		case "advancedUserManager":
			advancedUserManager($viewmode, $sortorder, $start);
			break;
		// END: HACK - ADVANCED USER MANAGER
		//END-OF-FIX
    
    case "mod_users":
    //FIX:DOMSNITT
    // START: HACK - ADVANCED USER MANAGER
		//		displayUsers();
		displayUsers($menu);
		// END: HACK - ADVANCED USER MANAGER
		//END-OF-FIX
    break;

		//FIX:DOMSNITT
		// START: HACK - ADVANCED USER MANAGER
		case "advancedUserMangerViewUser":
			AdvancedUserMangerViewUser($username);
			break;
		case advacnedUserManagerDel:
			global $user_prefix, $db, $prefix, $nukeurl, $sitename, $adminmail, $subscription_url, $admin_file;
			global $admin_file, $bgcolor2, $db, $prefix;
			global $user_module;
			include("header.php");
			GraphicAdmin();
			OpenTable();
			echo "<center><b>"._USERADMIN."</b></center>";
			CloseTable();
			echo "<br />";
			OpenTable();
			ListInactivatedReg();
			menu();
			CloseTable();
			echo "<br>";
			OpenTable();
			echo "<br>";
			if ($delete == (""._REMOVEMARKED.""))
			{
				$mark_list = (!empty($mark)) ? $mark : 0;
				if (isset($mark_list) && !is_array($mark_list))
				{
					// Set to empty array instead of '0' if nothing is selected.
					$mark_list = array();
				}
				echo "<table width='80%' cellpadding='1' cellspacing='1' align='center' style='border-top: 1px $bgcolor2 solid; border-bottom: 1px $bgcolor2 solid;'>"
					."<tr><td bgcolor='$bgcolor2' nowrap='nowrap' width='100%'>&nbsp;"._USERNAME."&nbsp;</td>"
					."<td nowrap='nowrap' bgcolor='$bgcolor2'>"._AUM_RESULT."</td></tr>";
				for ($i=0; $i<count($mark_list); $i++)
				{
					$result0 = $db->sql_query("SELECT username from ". $user_prefix . "_users WHERE user_id = '".intval($mark_list[$i])."'");
					$row0 = $db->sql_fetchrow($result0);
					$del_uid = $row0['username'];

					$result = $db->sql_query("SELECT user_id from " . $user_prefix . "_users where username='$del_uid'");
					$row = $db->sql_fetchrow($result);
					$del_user_id = intval($row['user_id']);
					$db->sql_query("UPDATE " . $user_prefix . "_bbposts SET poster_id = '1', post_username = '$del_uid' WHERE poster_id = '$del_user_id'");
					$db->sql_query("UPDATE " . $user_prefix . "_bbtopics SET topic_poster = '1' WHERE topic_poster = '$del_user_id'");
					$db->sql_query("UPDATE " . $user_prefix . "_bbvote_voters SET vote_user_id = '1' WHERE vote_user_id = '$del_user_id'");
					$db->sql_query("delete from " . $user_prefix . "_users where username='$del_uid'");
					$db->sql_query("delete from " . $user_prefix . "_bbuser_group where user_id='$del_user_id'");
					$result2 = $db->sql_query("SELECT group_id FROM " . $user_prefix . "_bbgroups WHERE group_moderator = '$del_user_id'");
					$row2 = $db->sql_fetchrow($result2);
					$del_group_id = intval($row2['group_id']);
					if (intval($del_group_id) > 0)
					{
						$db->sql_query("delete from " . $user_prefix . "_bbgroups where group_id='$del_group_id'");
						$db->sql_query("delete from " . $user_prefix . "_bbauth_access where group_id='$del_group_id'");
					}
					$db->sql_query("delete from " . $user_prefix . "_bbtopics_watch where user_id='$del_user_id'");
					$db->sql_query("delete from " . $user_prefix . "_bbbanlist where ban_userid='$del_user_id'");
					$result3 = $db->sql_query("SELECT privmsgs_id FROM " . $user_prefix . "_bbprivmsgs WHERE privmsgs_from_userid = '$del_user_id' OR privmsgs_to_userid = '$del_user_id'");
					while ( $row_privmsgs = $db->sql_fetchrow($result3) )
					{
						$mark_list[] = $row_privmsgs['privmsgs_id'];
					}
					$delete_sql_id = implode(', ', $mark_list);
					$db->sql_query("delete from " . $user_prefix . "_bbprivmsgs_text where privmsgs_text_id IN ($delete_sql_id)");
					$db->sql_query("delete from " . $user_prefix . "_bbprivmsgs where privmsgs_id IN ($delete_sql_id)");

					echo "<tr><td width='100%' nowrap='nowrap'>".$del_uid."</td><td>"._AUM_DELETED."</td></tr>";
				};
				echo "</table>";
				echo "<br><center><a href=".$admin_file.".php?op=advancedUserManager&map;viewmode=".$viewmode."&amp;sortorder=".$sortorder."&amp;start=".$start.">"._AUM_GOBACK."</a>";
			}
			else if ($delete == (""._REMOVEALL.""))
			{
				$mark_list = array();
				$result0 = $db->sql_query("SELECT username from ". $user_prefix . "_users WHERE user_id <> 1");
				$numrows0 = $db->sql_numrows($result0);
				echo "<table width='80%' cellpadding='1' cellspacing='1' align='center' style='border-top: 1px $bgcolor2 solid; border-bottom: 1px $bgcolor2 solid;'>"
					."<tr><td bgcolor='$bgcolor2' nowrap='nowrap' width='100%'>&nbsp;"._USERNAME."&nbsp;</td>"
					."<td nowrap='nowrap' bgcolor='$bgcolor2'>"._AUM_RESULT."</td></tr>";
				for ($i=0; $i<$numrows0; $i++)
				{
					$row0 = $db->sql_fetchrow($result0);
					$del_uid = $row0['username'];

					$result = $db->sql_query("SELECT user_id from " . $user_prefix . "_users where username='$del_uid'");
					$row = $db->sql_fetchrow($result);
					$del_user_id = intval($row['user_id']);
					$db->sql_query("UPDATE " . $user_prefix . "_bbposts SET poster_id = '1', post_username = '$del_uid' WHERE poster_id = '$del_user_id'");
					$db->sql_query("UPDATE " . $user_prefix . "_bbtopics SET topic_poster = '1' WHERE topic_poster = '$del_user_id'");
					$db->sql_query("UPDATE " . $user_prefix . "_bbvote_voters SET vote_user_id = '1' WHERE vote_user_id = '$del_user_id'");
					$db->sql_query("delete from " . $user_prefix . "_users where username='$del_uid'");
					$db->sql_query("delete from " . $user_prefix . "_bbuser_group where user_id='$del_user_id'");
					$result2 = $db->sql_query("SELECT group_id FROM " . $user_prefix . "_bbgroups WHERE group_moderator = '$del_user_id'");
					$row2 = $db->sql_fetchrow($result2);
					$del_group_id = intval($row2['group_id']);
					if (intval($del_group_id) > 0)
					{
						$db->sql_query("delete from " . $user_prefix . "_bbgroups where group_id='$del_group_id'");
						$db->sql_query("delete from " . $user_prefix . "_bbauth_access where group_id='$del_group_id'");
					}
					$db->sql_query("delete from " . $user_prefix . "_bbtopics_watch where user_id='$del_user_id'");
					$db->sql_query("delete from " . $user_prefix . "_bbbanlist where ban_userid='$del_user_id'");
					$result3 = $db->sql_query("SELECT privmsgs_id FROM " . $user_prefix . "_bbprivmsgs WHERE privmsgs_from_userid = '$del_user_id' OR privmsgs_to_userid = '$del_user_id'");
					while ( $row_privmsgs = $db->sql_fetchrow($result3) )
					{
						$mark_list[] = $row_privmsgs['privmsgs_id'];
					}
					$delete_sql_id = implode(", ", $mark_list);
					$db->sql_query("delete from " . $user_prefix . "_bbprivmsgs_text where privmsgs_text_id IN ($delete_sql_id)");
					$db->sql_query("delete from " . $user_prefix . "_bbprivmsgs where privmsgs_id IN ($delete_sql_id)");
					
					echo "<tr><td width='100%' nowrap='nowrap'>".$del_uid."</td><td>"._AUM_DELETED."</td></tr>";
				};
				echo "<tr><td colspan='2' align='center' width='100%' style='border-top: 1px $bgcolor2; solid;'>"
					.""._AUM_TOTAL." ".$numrows0." "._AUM_USERS." "._AUM_DELETED."</td></tr>";
				echo "</table>";
				echo "<br><center><a href=".$admin_file.".php?op=advancedUserManager&map;viewmode=".$viewmode."&amp;sortorder=".$sortorder."&amp;start=".$start.">"._AUM_GOBACK."</a>";
			}
			else if ($delete == (""._QUEUEMARKED.""))
			{
				$mark_list = (!empty($mark)) ? $mark : 0;
				if (isset($mark_list) && !is_array($mark_list))
				{
					// Set to empty array instead of '0' if nothing is selected.
					$mark_list = array();
				}

				$result = $db->sql_query("SELECT * FROM ".$prefix."_aum_dupconfig");
				$numrows = $db->sql_numrows($result);
				if ($numrows)
				{
					$row = $db->sql_fetchrow($result);
					$allowSchedule = intval($row['allowSchedule']);
					$duptime = intval($row['duptime']);
					$allowSendMail = intval($row['allowSendMail']);
					$duration = intval($row['duration']);
					$mbtext = $row['mbtext'];
					$pqdue = time() + $duration*60*60*24;

					$mailsent = "OFF";
					if ($allowSendMail)
					{
						$mailsent = "mailed";
					};

					$timedateformat = (""._TIMEDATEFORMAT."");
					$prunedate = date($timedateformat, $pqdue);
					echo "<table align='center' cellpadding='1' cellspacing='1' border='0' width='90%' style='border-top: 1px $bgcolor2 solid; border-bottom: 1px $bgcolor2 solid;'>"
						."<tr><td bgcolor='$bgcolor2' nowrap='nowrap' align='center' width='35%'>&nbsp;"._USERNAME."&nbsp;</td>"
						."<td bgcolor='$bgcolor2' nowrap='nowrap' align='center' width='20%'>&nbsp;"._AUM_MAILING."&nbsp;</td>"
						."<td bgcolor='$bgcolor2' nowrap='nowrap' align='center' width='25%'>&nbsp;"._AUM_PRUNEDATE."&nbsp;</td>"
						."<td bgcolor='$bgcolor2' nowrap='nowrap' align='center' width='20%'>&nbsp;"._AUM_RESULT."&nbsp;</td>"
						."</tr>";
					for ($i=0; $i<count($mark_list); $i++)
					{
						$user_id = intval($mark_list[$i]);
						$result0 = $db->sql_query("SELECT * from ". $prefix . "_users WHERE user_id = '".$user_id."'");
						$row0 = $db->sql_fetchrow($result0);
						$username = $row0['username'];
						$user_email = $row0['user_email'];
						$time = $row0['time'];
						echo "<tr>";
						echo "<td nowrap='nowrap'>".$user_email."</td>";
						echo "<td nowrap='nowrap'>".$mailsent."</td>";
						echo "<td nowrap='nowrap'>".$prunedate."</td>";

						// send mails if needed
						if (!$allowSendMail)
						{
							$from=$adminmail;
							$subject = ""._AUM_PRUNENOTICE_SUBJECT."";
							mail($user_email, $subject, $mbtext, "From: $from\nX-Mailer: PHP/" . phpversion());
						}

						// queueing
						$queued = (""._AUM_QUEUED."");
						$result2 = $db->sql_query("SELECT * FROM ".$prefix."_aum_pruneq WHERE user_id='$user_id'");
						$numrows2 = $db->sql_numrows($result2);
						if ($numrows2)
						{
							$db->sql_query("UPDATE ".$prefix."_aum_pruneq SET pqdue='$pqdue') WHERE user_id='$user_id'");
							$queued = (""._AUM_QUEUEUPDATED."");
						}
						else
						{
							$db->sql_query("INSERT INTO ".$prefix."_aum_pruneq (pqid, user_id, pqdue) VALUES (NULL, '$user_id', '$pqdue')");
						};
						echo "<td nowrap='nowrap'>".$queued."</td>";
						echo "</tr>";
					}; // end of $i-for loop
					echo "<tr><td colspan='4' style='border-top: 1px $bgcolor2 solid;' width='100%' align='center'>"
						.""._AUM_TOTAL." ".count($mark_list)." "._AUM_USERS." "._AUM_QUEUED."</td></tr>";
					echo "</table>";
				}
				else
				{
					echo "<center><b>"._AUM_NODUPCONFIG_FOUND."</b></center><br>";
				}; // end of if-else ladder
				echo "<br><center><a href=".$admin_file.".php?op=advancedUserManager&map;viewmode=".$viewmode."&amp;sortorder=".$sortorder."&amp;start=".$start.">"._AUM_GOBACK."</a>";
			}
			else if ($delete == (""._QUEUEALL.""))
			{
				$result = $db->sql_query("SELECT * FROM ".$prefix."_aum_dupconfig");
				$numrows = $db->sql_numrows($result);
				if ($numrows)
				{
					$row = $db->sql_fetchrow($result);
					$allowSchedule = intval($row['allowSchedule']);
					$duptime = intval($row['duptime']);
					$allowSendMail = intval($row['allowSendMail']);
					$duration = intval($row['duration']);
					$mbtext = $row['mbtext'];
					$pqdue = time() + $duration*60*60*24;

					$mailsent = "OFF";
					if ($allowSendMail)
					{
						$mailsent = "mailed";
					};

					$timedateformat = (""._TIMEDATEFORMAT."");
					$prunedate = date($timedateformat, $pqdue);
					echo "<table align='center' cellpadding='1' cellspacing='1' border='0' width='90%' style='border-top: 1px $bgcolor2 solid; border-bottom: 1px $bgcolor2 solid;'>"
						."<tr><td bgcolor='$bgcolor2' nowrap='nowrap' align='center' width='35%'>&nbsp;"._USERNAME."&nbsp;</td>"
						."<td bgcolor='$bgcolor2' nowrap='nowrap' align='center' width='20%'>&nbsp;"._AUM_MAILING."&nbsp;</td>"
						."<td bgcolor='$bgcolor2' nowrap='nowrap' align='center' width='25%'>&nbsp;"._AUM_PRUNEDATE."&nbsp;</td>"
						."<td bgcolor='$bgcolor2' nowrap='nowrap' align='center' width='20%'>&nbsp;"._AUM_RESULT."&nbsp;</td>"
						."</tr>";
					$resultall = $db->sql_query("SELECT * FROM ".$prefix."_users WHERE user_id <> 1");
					$numrowsall = $db->sql_numrows($resultall);
					while ($rowall=$db->sql_fetchrow($resultall))
					{
						$user_id = intval($rowall['user_id']);
						$username = $rowall['username'];
						$user_email = $rowall['user_email'];
						$time = $rowall['time'];
						echo "<tr>";
						echo "<td nowrap='nowrap'>".$user_email."</td>";
						echo "<td nowrap='nowrap'>".$mailsent."</td>";
						echo "<td nowrap='nowrap'>".$prunedate."</td>";

						// send mails if needed
						if (!$allowSendMail)
						{
							$subject = ""._AUM_PRUNENOTICE_SUBJECT."";
							$from=$adminmail;
							mail($user_email, $subject, $mbtext, "From: $from\nX-Mailer: PHP/" . phpversion());
						}

						// queueing
						$queued = (""._AUM_QUEUED."");
						$result2 = $db->sql_query("SELECT * FROM ".$prefix."_aum_pruneq WHERE user_id='$user_id'");
						$numrows2 = $db->sql_numrows($result2);
						if ($numrows2)
						{
							$db->sql_query("UPDATE ".$prefix."_aum_pruneq SET pqdue='$pqdue') WHERE user_id='$user_id'");
							$queued = (""._AUM_QUEUEUPDATED."");
						}
						else
						{
							$db->sql_query("INSERT INTO ".$prefix."_aum_pruneq (pqid, user_id, pqdue) VALUES (NULL, '$user_id', '$pqdue')");
						};
						echo "<td nowrap='nowrap'>".$queued."</td>";
						echo "</tr>";
					}; // end of while loop
					echo "<tr><td colspan='4' style='border-top: 1px $bgcolor2 solid;' width='100%' align='center'>"
						.""._AUM_TOTAL." ".$numrowsall." "._AUM_USERS." "._AUM_QUEUED."</td></tr>";
					echo "</table>";
				}
				else
				{
					echo "<center><b>"._AUM_NODUPCONFIG_FOUND."</b></center><br>";
				}; // end of if-else ladder
				echo "<br><center><a href=".$admin_file.".php?op=advancedUserManager&map;viewmode=".$viewmode."&amp;sortorder=".$sortorder."&amp;start=".$start.">"._AUM_GOBACK."</a>";
			}
			else
			{
				// invalid delete option
			};
			CloseTable();
			include("footer.php");
			break;
			// END: HACK - ADVANCED USER MANAGER
			//END-OF-FIX

    case "modifyUser":
    //FIX:DOMSNITT   
    // START: HACK - ADVANCED USER MANAGER
		//modifyUser($chng_uid);
		modifyUser($chng_uid, $viewmode, $sortorder, $start);
		// END: HACK - ADVANCED USER MANAGER
		//END-OF-FIX
    break;

    case "updateUser":
    //FIX:DOMSNITT 
    // START: HACK - ADVANCED USER MANAGER
		//updateUser($chng_uid, $chng_uname, $chng_name, $chng_url, $chng_email, $chng_femail, $chng_user_icq, $chng_user_aim, $chng_user_yim, $chng_user_msnm, $chng_user_from, $chng_user_occ, $chng_user_intrest, $chng_user_viewemail, $chng_avatar, $chng_user_sig, $chng_pass, $chng_pass2, $chng_newsletter, $subscription, $subscription_expire, $reason);
		updateUser($chng_uid, $chng_uname, $chng_name, $chng_url, $chng_email, $chng_femail, $chng_user_icq, $chng_user_aim, $chng_user_yim, $chng_user_msnm, $chng_user_from, $chng_user_occ, $chng_user_intrest, $chng_user_viewemail, $chng_avatar, $chng_user_sig, $chng_pass, $chng_pass2, $chng_newsletter, $subscription, $subscription_expire, $reason, $viewmode, $sortorder, $start);
		// END: HACK - ADVANCED USER MANAGER
		//END-OF-FIX
    break;

    case "delUser":
    include("header.php");
    GraphicAdmin();
    OpenTable();
    echo "<center><font class=\"title\"><b>" . _USERADMIN . "</b></font></center>";
    CloseTable();
    echo "<br>";
    OpenTable();
    echo "<center><font class=\"option\"><b>" . _DELETEUSER . "</b></font><br><br>"
		."" . _SURE2DELETE . " $chng_uid?<br><br>"
		
		."";
		//FIX:DOMSNITT 
		// START: HACK - ADVANCED USER MANAGER - One Line up
		//		."[ <a href=\"".$admin_file.".php?op=delUserConf&amp;del_uid=$chng_uid\">" . _YES . "</a> | <a href=\"".$admin_file.".php?op=mod_users\">" . _NO . "</a> ]</center>";
		echo "[ <a href='".$admin_file.".php?op=delUserConf&amp;del_uid=$chng_uid&amp;viewmode=$viewmode&amp;sortorder=$sortorder&amp;start=$start'>" . _YES . "</a> | <a href='".$admin_file.".php?op=mod_users&amp;viewmode=$viewmode&amp;sortorder=$sortorder&amp;start=$start'>" . _NO . "</a> ]</center>";
		// END: HACK - ADVANCED USER MANAGER
    //END-OF-FIX
    
    CloseTable();
    include("footer.php");
    break;

    case "delUserConf":
    $db->sql_query("delete from " . $user_prefix . "_users where username='$del_uid'");
     
     //FIX:DOMSNITT 
    // START: HACK - ADVANCED USER MANAGER - Fixed on OWN
		//Header("Location: ".$admin_file.".php?op=adminMain");
		 Header("Location: ".$admin_file.".php?op=advancedUserManager&map;viewmode=".$viewmode."&amp;sortorder=".$sortorder."&amp;start=".$start."");
		// END: HACK - ADVANCED USER MANAGER
		//END-OF-FIX
    break;

    case "addUser":
    $add_pass = md5($add_pass);
    if (!($add_uname && $add_email && $add_pass)) {
			include("header.php");
			GraphicAdmin();
			OpenTable();
			echo "<center><font class=\"title\"><b>" . _USERADMIN . "</b></font></center>";
			CloseTable();
			echo "<br>";
      OpenTable();
			echo "<center><b>" . _NEEDTOCOMPLETE . "</b><br><br>"
	    ."" . _GOBACK . "";
			CloseTable();
			include("footer.php");
      	return;
    		}
   		$numrow = $db->sql_numrows($db->sql_query("SELECT user_id FROM ".$user_prefix."_users WHERE username='$add_uname'"));
    	if ($numrow > 0) {
			include("header.php");
			GraphicAdmin();
			OpenTable();
			echo "<center><font class=\"title\"><b>" . _USERADMIN . "</b></font></center>";
			CloseTable();
			echo "<br>";
      OpenTable();
			echo "<center><b>" . _USERALREADYEXISTS . "</b><br><br>"
	    ."" . _GOBACK . "";
			CloseTable();
			include("footer.php");
      	return;
    	} else {
        $user_regdate = date("M d, Y");
        $sql = "insert into " . $user_prefix . "_users ";
        $sql .= "(user_id,name,username,user_email,femail,user_website,user_regdate,user_icq,user_aim,user_yim,user_msnm,user_from,user_occ,user_interests,user_viewemail,user_avatar,user_sig,user_password,newsletter,broadcast,popmeson) ";
        $sql .= "values (NULL,'$add_name','$add_uname','$add_email','$add_femail','$add_url','$user_regdate','$add_user_icq','$add_user_aim','$add_user_yim','$add_user_msnm','$add_user_from','$add_user_occ','$add_user_intrest','$add_user_viewemail','$add_avatar','$add_user_sig','$add_pass','$add_newsletter','1','0')";
        $result = $db->sql_query($sql);
        if (!$result) {
            return;
        }
    }
     //FIX:DOMSNITT 
    // START: HACK - ADVANCED USER MANAGER - Fixed on OWN
		//Header("Location: ".$admin_file.".php?op=adminMain");
		 Header("Location: ".$admin_file.".php?op=advancedUserManager&map;viewmode=".$viewmode."&amp;sortorder=".$sortorder."&amp;start=".$start."");
		// END: HACK - ADVANCED USER MANAGER
		//END-OF-FIX
    break;
    //FIX:DOMSNITT
    // START: HACK - ADVANCED USER MANAGER
		case "modifyLastVisit":
			modifyLastVisit($user_id, $username, $user_lastvisit);
			break;
		case "modifyLastVisitSave":
			global $admin_file, $db, $user_prefix;
			$newlastvisit = mktime(intval($hour), intval($min), intval($sec), intval($month), intval($day), intval($year));
			$db->sql_query("update " . $user_prefix . "_users set user_lastvisit='$newlastvisit' where user_id='$user_id'");
			Header("Location: ".$admin_file.".php?op=advancedUserManager");
			break;
		case "aumInactiveRegList":
			InactiveRegList($viewmode, $sortorder, $start);
			break;
		case "aumActivateTempUser":
			ActivateTempUser($user_id, $username, $viewmode, $sortorder, $start);
			break;
		case "aumActivateTempUserConfirm":
			ActivateTempUserConfirm($user_id, $username, $viewmode, $sortorder, $start);
			break;
		case "aumResendEmail":
			ResendEmail($user_id, $username, $viewmode, $sortorder, $start);
			break;
		case "aumResendEmailConfirm":
			ResendEmailConfirm($user_id, $username, $viewmode, $sortorder, $start);
			break;
		case "aumDelInactiveRegUser":
			DeleteTempUser($user_id, $username, $viewmode, $sortorder, $start);
			break;
		case "aumDelInactiveRegUserConfirm":
			DeleteTempUserConfirm($user_id, $username, $viewmode, $sortorder, $start);
			break;
		case "aumViewInactiveRegUser":
			ViewInactiveRegUser($user_id, $username, $viewmode, $sortorder, $start);
			break;
		case "aumInactiveRegUserManager":
			global $admin_file, $bgcolor2, $db, $prefix;
			include("header.php");
			GraphicAdmin();
			OpenTable();
			echo "<center><b>"._USERADMIN."</b></center>";
			CloseTable();
			echo "<br />";
			OpenTable();
			ListInactivatedReg();
			menu();
			echo "<br>";
			if ($select == (""._AUM_ACTIVATEMARKED.""))
			{
				$mark_list = (!empty($mark)) ? $mark : 0;
				if (isset($mark_list) && !is_array($mark_list))
				{
					// Set to empty array instead of '0' if nothing is selected.
					$mark_list = array();
				}

				for ($i=0; $i<count($mark_list); $i++)
				{
					$result = $db->sql_query("SELECT * from ". $prefix . "_users_temp WHERE user_id = '".intval($mark_list[$i])."'");
					$row = $db->sql_fetchrow($result);
					$user_id = intval($row['user_id']);
					$username = $row['username'];
					$user_email = $row['user_email'];
					$user_password = $row['user_password'];
					$user_regdate = $row['user_regdate'];
					$time = $row['time'];
					
					/*		
					$db->sql_query("INSERT INTO ".$user_prefix."_users (user_id, username, user_email, user_password, user_avatar, user_regdate, user_lang) VALUES (NULL, '$row[username]', '$row[user_email]', '$row[user_password]', 'gallery/blank.gif', '$row[user_regdate]', '$language')"); */
					$query="INSERT INTO ".$user_prefix."_users (user_id, username, user_email, user_password, user_avatar, user_avatar_type, user_regdate, user_lang,usertype,gradyear,company,designation,name,specialization) VALUES (NULL, '$row[username]', '$row[user_email]', '$row[user_password]', 'gallery/blank.gif', 3, '$row[user_regdate]', '$language','$row[usertype]',$row[gradyear],'$row[company]','$row[designation]','$row[fullname]','$row[specialization]')";						
					//toLog($query);
					$db->sql_query($query);
 	    
 	    
					
					
					
					$db->sql_query("DELETE FROM ".$user_prefix."_users_temp WHERE user_id='$user_id'");
					echo "<b>".$row['username'].":</b> "._AUM_ACTIVATIONSUCCESS."";
				}; // end of $i-for loop
			}
			else if ($select == (""._AUM_ACTIVATEALL.""))
			{
				$result = $db->sql_query("SELECT * from ". $prefix . "_users_temp");
				$numrows = $db->sql_numrows($result);
				for ($i=0; $i<$numrows; $i++)
				{
					$row = $db->sql_fetchrow($result);
					$user_id = intval($row['user_id']);
					$username = $row['username'];
					$user_email = $row['user_email'];
					$user_password = $row['user_password'];
					$user_regdate = $row['user_regdate'];
					$time = $row['time'];
					/*$db->sql_query("INSERT INTO ".$user_prefix."_users (user_id, username, user_email, user_password, user_avatar, user_regdate, user_lang) VALUES (NULL, '$row[username]', '$row[user_email]', '$row[user_password]', 'gallery/blank.gif', '$row[user_regdate]', '$language')");*/
					$query="INSERT INTO ".$user_prefix."_users (user_id, username, user_email, user_password, user_avatar, user_avatar_type, user_regdate, user_lang,usertype,gradyear,company,designation,name,specialization) VALUES (NULL, '$row[username]', '$row[user_email]', '$row[user_password]', 'gallery/blank.gif', 3, '$row[user_regdate]', '$language','$row[usertype]',$row[gradyear],'$row[company]','$row[designation]','$row[fullname]','$row[specialization]')";						
					//toLog($query);
					$db->sql_query($query);
 	    			
					
					
					$db->sql_query("DELETE FROM ".$user_prefix."_users_temp WHERE user_id='$user_id'");
					echo "<b>".$row['username'].":</b> "._AUM_ACTIVATIONSUCCESS."";
				}; // end of $i-for loop
			}
			else if ($select == (""._AUM_RESENDMARKED.""))
			{
				$mark_list = (!empty($mark)) ? $mark : 0;
				if (isset($mark_list) && !is_array($mark_list))
				{
					// Set to empty array instead of '0' if nothing is selected.
					$mark_list = array();
				}

				for ($i=0; $i<count($mark_list); $i++)
				{
					$result = $db->sql_query("SELECT * from ". $prefix . "_users_temp WHERE user_id = '".intval($mark_list[$i])."'");
					$row = $db->sql_fetchrow($result);
					$user_id = intval($row['user_id']);
					$username = $row['username'];
					$user_email = $row['user_email'];
					$user_password = $row['user_password'];
					$user_regdate = $row['user_regdate'];
					//$check_num = intval($row['check_num']);
					$check_num = $row['check_num'];
					$time = $row['time'];
					$finishlink = "$nukeurl/modules.php?name=$module_name&op=activate&username=$username&check_num=$check_num";
					$message = ""._WELCOMETO." $sitename!\n\n"._YOUUSEDEMAIL." ($user_email) "._TOREGISTER." $sitename.\n\n "._TOFINISHUSER."\n\n $finishlink\n\n "._FOLLOWINGMEM."\n\n"._UNICKNAME." $username\n"._UPASSWORD." $user_password"."(Hash)";
					$subject = ""._ACTIVATIONSUB."";
					$from=$adminmail;
					mail($user_email, $subject, $message, "From: $from\nX-Mailer: PHP/" . phpversion());
					echo "<b>$username:</b> "._AUM_RESENDMAILSUCCESS."<br>";
				};
			}
			else if ($select == (""._AUM_RESENDALL.""))
			{
				$result = $db->sql_query("SELECT * from ". $prefix . "_users_temp");
				$numrows = $db->sql_numrows($result);
				for ($i=0; $i<$numrows; $i++)
				{
					$row = $db->sql_fetchrow($result);
					$user_id = intval($row['user_id']);
					$username = $row['username'];
					$user_email = $row['user_email'];
					$user_password = $row['user_password'];
					$user_regdate = $row['user_regdate'];
					//$check_num = intval($row['check_num']);
					$check_num = $row['check_num'];
					$time = $row['time'];
					$finishlink = "$nukeurl/modules.php?name=$module_name&op=activate&username=$username&check_num=$check_num";
					$message = ""._WELCOMETO." $sitename!\n\n"._YOUUSEDEMAIL." ($user_email) "._TOREGISTER." $sitename.\n\n "._TOFINISHUSER."\n\n $finishlink\n\n "._FOLLOWINGMEM."\n\n"._UNICKNAME." $username\n"._UPASSWORD." $user_password"."(Hash)";
					$subject = ""._ACTIVATIONSUB."";
					mail($user_email, $subject, $message, "From: $from\nX-Mailer: PHP/" . phpversion());
					echo "<b>$username:</b> "._AUM_RESENDMAILSUCCESS."<br>";
				}; // end of $i-for loop
			}
			else if ($select == (""._AUM_REMOVEMARKED.""))
			{
				$mark_list = (!empty($mark)) ? $mark : 0;
				if (isset($mark_list) && !is_array($mark_list))
				{
					// Set to empty array instead of '0' if nothing is selected.
					$mark_list = array();
				}

				for ($i=0; $i<count($mark_list); $i++)
				{
					$result = $db->sql_query("SELECT * from ". $prefix . "_users_temp WHERE user_id = '".intval($mark_list[$i])."'");
					$row = $db->sql_fetchrow($result);
					$username = $row['username'];
					$db->sql_query("DELETE FROM ".$user_prefix."_users_temp WHERE user_id='$user_id'");
					echo "<b>".$row['username'].":</b> "._AUM_REMOVEPENDINGUSERSUCCESS."<br>";
				}; // end of $i-for loop
			}
			else if ($select == (""._AUM_REMOVEALL.""))
			{
				$db->sql_query("TRUNCATE ".$user_prefix."_users_temp");
				echo ""._AUM_REMOVEPENDINGUSERSUCCESS."<br>";
			}
			else if ($select == (""._AUM_VIEWMARKED.""))
			{
				$mark_list = (!empty($mark)) ? $mark : 0;
				if (isset($mark_list) && !is_array($mark_list))
				{
					// Set to empty array instead of '0' if nothing is selected.
					$mark_list = array();
				}

				echo "<table cellpadding='1' cellspacing='1' border='0' width='100%'>"
					."<tr><td></td><td width='100%' style='border: 1px solid;' bgcolor='$bgcolor2'>"._AUM_TEMPUSER_INFO."</td></tr>";
				for ($i=0; $i<count($mark_list); $i++)
				{
					$result = $db->sql_query("SELECT * from ". $prefix . "_users_temp WHERE user_id = '".intval($mark_list[$i])."'");
					$row = $db->sql_fetchrow($result);
					$user_id = intval($row['user_id']);
					$username = $row['username'];
					$user_email = $row['user_email'];
					$user_password = $row['user_password'];
					$user_regdate = $row['user_regdate'];
					$check_num = $row['check_num'];
					echo "<tr><td nowrap='nowrap' align='right' style='border: 1px solid;' bgcolor='$bgcolor2'><b>"._AUM_USERID.": </td><td width='100%'>".$user_id."<td></tr>"
						."<tr><td nowrap='nowrap' align='right'><b>"._AUM_USERNAME.": </td><td width='100%'>".$username."<td></tr>"
						."<tr><td nowrap='nowrap' align='right'><b>"._AUM_USEREMAIL.": </td><td width='100%'>".$user_email."<td></tr>"
						."<tr><td nowrap='nowrap' align='right'><b>"._AUM_USERPASSWORD.": </td><td width='100%'>".$user_password."<td></tr>"
						."<tr><td nowrap='nowrap' align='right'><b>"._AUM_USERREGDATE.": </td><td width='100%'>".$user_regdate."<td></tr>"
						."<tr><td nowrap='nowrap' align='right' style='border-bottom: 1px solid;'><b>"._AUM_CHECKSUM.": </td><td width='100%' style='border-bottom: 1px solid;'>".$check_num."<td></tr>"
						."<tr><td>&nbsp;</td><td>&nbsp;</td>";
				};
				echo "</table>";
			}
			else if ($select == (""._AUM_VIEWALL.""))
			{
				echo "<table cellpadding='1' cellspacing='1' border='0' width='100%'>"
					."<tr><td></td><td width='100%' style='border: 1px solid;' bgcolor='$bgcolor2'>"._AUM_TEMPUSER_INFO."</td></tr>";
				$result = $db->sql_query("SELECT * from ". $prefix . "_users_temp");
				$numrows = $db->sql_numrows($result);
				for ($i=0; $i<$numrows; $i++)
				{
					$row = $db->sql_fetchrow($result);
					$user_id = intval($row['user_id']);
					$username = $row['username'];
					$user_email = $row['user_email'];
					$user_password = $row['user_password'];
					$user_regdate = $row['user_regdate'];
					$check_num = $row['check_num'];
					echo "<tr><td nowrap='nowrap' align='right' style='border: 1px solid;' bgcolor='$bgcolor2'><b>"._AUM_USERID.": </td><td width='100%'>".$user_id."<td></tr>"
						."<tr><td nowrap='nowrap' align='right'><b>"._AUM_USERNAME.": </td><td width='100%'>".$username."<td></tr>"
						."<tr><td nowrap='nowrap' align='right'><b>"._AUM_USEREMAIL.": </td><td width='100%'>".$user_email."<td></tr>"
						."<tr><td nowrap='nowrap' align='right'><b>"._AUM_USERPASSWORD.": </td><td width='100%'>".$user_password."<td></tr>"
						."<tr><td nowrap='nowrap' align='right'><b>"._AUM_USERREGDATE.": </td><td width='100%'>".$user_regdate."<td></tr>"
						."<tr><td nowrap='nowrap' align='right' style='border-bottom: 1px solid;'><b>"._AUM_CHECKSUM.": </td><td width='100%' style='border-bottom: 1px solid;'>".$check_num."<td></tr>"
						."<tr><td>&nbsp;</td><td>&nbsp;</td>";
				};
				echo "</table>";
			};			
			echo "<center>"._GOBACK."</center>";
			echo "<br>";
			CloseTable();
			include("footer.php");
			break;
		case "viewUser":
			advancedUserMangerViewUser($chng_uid);
			break;
		case "aumMailDomainFilter":
			aumMailDomainFilter();
			break;
		case "aumMDFilterAdd":
			global $db, $prefix, $admin_file;
			$db->sql_query("INSERT INTO ".$prefix."_aum_mfilter VALUES (NULL, '$mdomain')");
			Header("Location: ".$admin_file.".php?op=aumMailDomainFilter");
			break;
		case "aumMDFilterDelete":
			global $db, $prefix, $admin_file;
			if ($delete == (""._REMOVEMARKED.""))
			{ // remove marked items
				$mark_list = (!empty($mfid_check)) ? $mfid_check : 0;
				if (isset($mark_list) && !is_array($mark_list))
				{
					// Set to empty array instead of '0' if nothing is selected.
					$mark_list = array();
				}

				for ($i=0; $i<count($mark_list); $i++)
				{
					$mfid = intval($mark_list[$i]);
					$db->sql_query("DELETE FROM ".$prefix."_aum_mfilter WHERE mfid='$mfid'");
				}; // end of $i-for loop

			}
			else if ($delete == (""._REMOVEALL.""))
			{ // remove all
				$db->sql_query("TRUNCATE ".$prefix."_aum_mfilter");
			};
			Header("Location: ".$admin_file.".php?op=aumMailDomainFilter");
			break;
		case "aumDUPConfig":
			aumDUPConfig();
			break;
		case "aumDUPConfigSave":
			aumDUPConfigSave($allowSchedule, $duptime, $allowSendMail, $duration, $mbtext);
			break;
		case "aumPruneQRemove":
			aumPruneQRemove();
			break;
		case "aumUserTempRemove":
			aumUserTempRemove();
			break;
		case "aumDeadUserList":
			aumDeadUserList();
			break;
		case "aumDeadUserRemove":
			global $user_prefix, $db, $prefix, $nukeurl, $sitename, $adminmail, $subscription_url, $admin_file;
			include("header.php");
			GraphicAdmin();
			OpenTable();
			echo "<center><b>"._USERADMIN."</b></center>";
			CloseTable();
			echo "<br />";
			OpenTable();
			ListInactivatedReg();
			menu();
			CloseTable();
			echo "<br>";
			OpenTable();
			echo "<br>";
			if ($delete == (""._REMOVEMARKED.""))
			{
				$mark_list = (!empty($mark)) ? $mark : 0;
				if (isset($mark_list) && !is_array($mark_list))
				{
					// Set to empty array instead of '0' if nothing is selected.
					$mark_list = array();
				}
			}
			else if ($delete == (""._REMOVEALL.""))
			{
				$mark_list = (!empty($mark_all)) ? $mark_all : 0;
				if (isset($mark_list) && !is_array($mark_list))
				{
					// Set to empty array instead of '0' if nothing is selected.
					$mark_list = array();
				}
			};
			echo "<table width='80%' cellpadding='1' cellspacing='1' align='center' style='border-top: 1px $bgcolor2 solid; border-bottom: 1px $bgcolor2 solid;'>"
				."<tr><td bgcolor='$bgcolor2' nowrap='nowrap' width='100%'>&nbsp;"._USERNAME."&nbsp;</td>"
				."<td nowrap='nowrap' bgcolor='$bgcolor2'>"._AUM_RESULT."</td></tr>";
			for ($i=0; $i<count($mark_list); $i++)
			{
				$result0 = $db->sql_query("SELECT username from ". $user_prefix . "_users WHERE user_id = '".intval($mark_list[$i])."'");
				$row0 = $db->sql_fetchrow($result0);
				$del_uid = $row0['username'];

				$result = $db->sql_query("SELECT user_id from " . $user_prefix . "_users where username='$del_uid'");
				$row = $db->sql_fetchrow($result);
				$del_user_id = intval($row['user_id']);
				$db->sql_query("UPDATE " . $user_prefix . "_bbposts SET poster_id = '1', post_username = '$del_uid' WHERE poster_id = '$del_user_id'");
				$db->sql_query("UPDATE " . $user_prefix . "_bbtopics SET topic_poster = '1' WHERE topic_poster = '$del_user_id'");
				$db->sql_query("UPDATE " . $user_prefix . "_bbvote_voters SET vote_user_id = '1' WHERE vote_user_id = '$del_user_id'");
				$db->sql_query("delete from " . $user_prefix . "_users where username='$del_uid'");
				$db->sql_query("delete from " . $user_prefix . "_bbuser_group where user_id='$del_user_id'");
				$result2 = $db->sql_query("SELECT group_id FROM " . $user_prefix . "_bbgroups WHERE group_moderator = '$del_user_id'");
				$row2 = $db->sql_fetchrow($result2);
				$del_group_id = intval($row2['group_id']);
				if (intval($del_group_id) > 0)
				{
					$db->sql_query("delete from " . $user_prefix . "_bbgroups where group_id='$del_group_id'");
					$db->sql_query("delete from " . $user_prefix . "_bbauth_access where group_id='$del_group_id'");
				}
				$db->sql_query("delete from " . $user_prefix . "_bbtopics_watch where user_id='$del_user_id'");
				$db->sql_query("delete from " . $user_prefix . "_bbbanlist where ban_userid='$del_user_id'");
				$result3 = $db->sql_query("SELECT privmsgs_id FROM " . $user_prefix . "_bbprivmsgs WHERE privmsgs_from_userid = '$del_user_id' OR privmsgs_to_userid = '$del_user_id'");
				while ( $row_privmsgs = $db->sql_fetchrow($result3) )
				{
					$mark_list[] = $row_privmsgs['privmsgs_id'];
				}
				$delete_sql_id = implode(', ', $mark_list);
				$db->sql_query("delete from " . $user_prefix . "_bbprivmsgs_text where privmsgs_text_id IN ($delete_sql_id)");
				$db->sql_query("delete from " . $user_prefix . "_bbprivmsgs where privmsgs_id IN ($delete_sql_id)");

				echo "<tr><td width='100%' nowrap='nowrap'>".$del_uid."</td><td>"._AUM_DELETED."</td></tr>";
			};
			echo "</table>";
			echo "<br><center><a href=".$admin_file.".php?op=aumDeadUserList'>"._AUM_GOBACK."</a>";
			CloseTable();
			include("footer.php");
			break;
		case "aumPruneQList":
			aumPruneQList();
			break;
		case "aumPruneQListDelete":
			global $user_prefix, $db, $prefix, $nukeurl, $sitename, $adminmail, $subscription_url, $admin_file;
			include("header.php");
			GraphicAdmin();
			OpenTable();
			echo "<center><b>"._USERADMIN."</b></center>";
			CloseTable();
			echo "<br />";
			OpenTable();
			ListInactivatedReg();
			menu();
			CloseTable();
			echo "<br>";
			OpenTable();
			$user_id = intval($user_id);
			echo "<center><b>"._AUM_RESULT."</b></center>";
			echo "<table width='95%' cellpadding='1' cellspacing='1' align='center' style='border-top: 1px $bgcolor2 solid; border-bottom: 1px $bgcolor2 solid;'>"
				."<tr><td bgcolor='$bgcolor2' nowrap='nowrap' width='100%'>&nbsp;"._USERNAME."&nbsp;</td>"
				."<td nowrap='nowrap' bgcolor='$bgcolor2'>"._AUM_RESULT."</td></tr>";
			if ($user_id && ($delete==""))
			{
				$row = $db->sql_fetchrow($db->sql_query("SELECT username FROM ".$user_prefix."_users WHERE user_id='$user_id' AND user_id <> 1"));
				$username = $row['username'];
				$db->sql_query("DELETE FROM ".$prefix."_aum_pruneq WHERE user_id='$user_id' AND user_id <> 1");
				echo "<tr>"
					."<td nowrap='nowrap'>".$username."</td>"
					."<td nowrap='nowrap'>"._AUM_DELETED."</td>"
					."</tr>";
			}
			else
			{
				if ($delete == (""._REMOVEMARKED.""))
				{
					$mark_list = (!empty($mark)) ? $mark : 0;
					if (isset($mark_list) && !is_array($mark_list))
					{
						// Set to empty array instead of '0' if nothing is selected.
						$mark_list = array();
					}
				}
				else if ($delete == (""._REMOVEALL.""))
				{
					$mark_list = (!empty($mark_all)) ? $mark_all : 0;
					if (isset($mark_list) && !is_array($mark_list))
					{
						// Set to empty array instead of '0' if nothing is selected.
						$mark_list = array();
					}
				};

				for ($i=0; $i<count($mark_list); $i++)
				{
					$user_id = intval($mark_list[$i]);
					$row = $db->sql_fetchrow($db->sql_query("SELECT username FROM ".$user_prefix."_users WHERE user_id='$user_id' AND user_id <> 1"));
					$username = $row['username'];
					$db->sql_query("DELETE FROM ".$prefix."_aum_pruneq WHERE user_id='$user_id' AND user_id <> 1");
					echo "<tr><td width='100%' nowrap='nowrap'>".$username."</td><td>"._AUM_DELETED."</td></tr>";
				};
			};
			echo "</table>";
			echo "<center><a href='".$admin_file.".php?op=aumPruneQList'>"._AUM_GOBACK."</a>";
			CloseTable();
			include("footer.php");
			break;
// END: HACK - ADVANCED USER MANAGER
//END-OF-FIX
    

}

} else {
	include("header.php");
	GraphicAdmin();
	OpenTable();
	echo "<center><b>"._ERROR."</b><br><br>You do not have administration permission for module \"$module_name\"</center>";
	CloseTable();
	include("footer.php");
}

//FIX:DOMSNITT   
	/***
 	 * Function: To Log
 	 */
 	function toLog($msg)
 	{
 	  if (!$DBFile = fopen("PortalDebug.txt", "a")) {
      echo "Cannot open file ($DBGFileName)";
      exit;
  	 }
 	 // Write $somecontent to our opened file.
   if (fwrite($DBFile, "\n".$msg) === FALSE) {
       echo "Cannot write to file ($DBGFileName)";
       exit;
   }
    fclose($DBFile);
  }
//END-OF-FIX

?>