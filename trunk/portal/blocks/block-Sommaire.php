<?php

/********************************************************************/
/*                       Sommaire Param�trable                      */
/*                                                                  */
/*                      par marcoledingue@free.fr                   */
/*                                                                  */
/*                          v.2.1.1 - 26/05/2004                    */
/********************************************************************/

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
/************************************************************************/


if (eregi("block-Sommaire.php", $_SERVER['PHP_SELF'])) {
    Header("Location: index.php");
    die();
}

global $db, $admin, $user, $prefix, $user_prefix, $cookie, $def_module;

$gestiongroupe = 1; // mettre 0 permet de forcer Sommaire Param�trable � ne pas g�rer les groupes. (gain de 1 requ�te SQL)
$detectPM=1; // mettre 0 pour d�sactiver la d�tection des Messages Priv�s. (gain de 1 requ�te SQL)
$detectMozilla = (eregi("Mozilla",$_SERVER['HTTP_USER_AGENT']) && !eregi("MSIE",$_SERVER['HTTP_USER_AGENT']) && !eregi("Opera",$_SERVER['HTTP_USER_AGENT']) && !eregi("Konqueror",$_SERVER['HTTP_USER_AGENT'])) ? 1 : 0 ;


// on r�cup�re le module en page d'accueil (index) et on va tester si on doit faire la gestion des groupes.
// (requ�tes regroup�es pour optimiser les appels � la DB).
$sql="SELECT t1.invisible, t2.main_module FROM ".$prefix."_sommaire AS t1, ".$prefix."_main AS t2 limit 1";
$result = $db->sql_query($sql);
$row = $db->sql_fetchrow($result);
$main_module = $row['main_module'];
$type_invisible=$row['invisible'];
if ($gestiongroupe==1) {
	$gestiongroupe = ($row['invisible']=="4" || $row['invisible']=="5") ? 1 : 0 ;
}
else {
	$gestiongroupe=0;
}

//on va tester si le visiteur est un admin et/ou un membre
$is_admin = (is_admin($admin)) ? 1 : 0 ;
$is_user = (sommaire_is_user($user,$gestiongroupe)) ? 1 : 0 ; //cf. fonction sommaire_is_user() en bas
global $userpoints; // d�fini dans la fonction sommaire_is_user
$userpoints=intval($userpoints); //juste au cas o� ;)


$ThemeSel = sommaire_get_theme($is_user); // r�cup�re le th�me du membre : �vite une requ�te.
//$pathicon = "themes/$ThemeSel/images/sommaire";
$path_icon = "images/sommaire";
$imgnew="new.gif";


///////////// on r�cup�re les infos pour savoir si le user a des messages priv�s non lus /////////////////
if ($is_user==1 && $detectPM==1) {
	global $uid;
	$uid=intval($uid); // on s�curise l'appel � la BDD
 	$newpms = $db->sql_fetchrow($db->sql_query("SELECT COUNT(*) FROM $prefix"._bbprivmsgs." WHERE privmsgs_to_userid='$uid' AND (privmsgs_type='5' OR privmsgs_type='1')")); //2 requetes SQL
}
// voil�, si $newpms[0]>0 --> il y a des PMs non lus //

///// on r�cup�re la table des groupes si on g�re les groupes ////
if ($gestiongroupe==1 && $is_user==1) {
	$sql="SELECT id, points FROM ".$prefix."_groups";
	$result=$db->sql_query($sql);
	while ($row = $db->sql_fetchrow($modulesaffiche)) {
		$pointsneeded[$row['id']]=$row['points'];
	}
}
///// ok, on connait le nb de points n�cessaires pour faire partie de chaque groupe /////


//////// on va mettre la liste des modules dans la variable $modules /////////////////////
if ($gestiongroupe==1) {
	$sql = "SELECT title, custom_title, view, active, mod_group FROM ".$prefix."_modules WHERE active='1' AND inmenu='1' ORDER BY custom_title ASC";
}
else {
	$sql = "SELECT title, custom_title, view, active FROM ".$prefix."_modules WHERE active='1' AND inmenu='1' ORDER BY custom_title ASC";
}
	$modulesaffiche= $db->sql_query($sql);
	$compteur=0;
	while ($tempo = $db->sql_fetchrow($modulesaffiche)) {
		$module[$compteur]= $tempo['title'];
		$customtitle[$compteur] = $tempo['custom_title'];
		$view[$compteur] = $tempo['view'];
		$active[$row['title']] = $tempo['active'];
		$mod_group[$compteur] = ($gestiongroupe==1) ? $tempo['mod_group'] : "";
		$compteur++;
	}
/////// ok, on a les infos de la table modules //////////////

//// on va r�cup�rer le module par d�faut dans le th�me (s'il existe)
if (file_exists("themes/$ThemeSel/module.php")) {
	include("themes/$ThemeSel/module.php");
	$is_active = ($active[$default_module]!=0) ? 1 : 0 ; // permet de savoir si le Default Module est actif.
	if ($is_active==1 AND file_exists("modules/$default_module/index.php")) {
		$main_module = $default_module;
	}
}


$total_actions="";
$flagmenu = 0;  // flag qui est mis automatiquement � "1" quand il y a un module dans la rubrique 99
				// --> permet d'afficher 1 seule fois la barre horizontale.
	// on va mettre les donn�es de la table nuke_sommaire_categories dans les variables ad�quates.
	$sql2= "SELECT groupmenu, module, url, url_text, image, new, new_days, class, bold FROM ".$prefix."_sommaire_categories ORDER BY id ASC";
	$result2= $db->sql_query($sql2);
	$compteur=0;
	$totalcompteur=0;
	$row2=$db->sql_fetchrow($result2); //on r�cup�re la premi�re ligne de la table, et on affecte aux variables.
	$categorie=$row2['groupmenu'];
	$moduleinthisgroup[$categorie][$compteur]=$row2['module'];
	$linkinthisgroup[$categorie][$compteur]=$row2['url'];
	$linktextinthisgroup[$categorie][$compteur]=$row2['url_text'];
	$imageinthisgroup[$categorie][$compteur]=$row2['image'];
	$newinthisgroup[$categorie][$compteur]=$row2['new'];
	$newdaysinthisgroup[$categorie][$compteur]=$row2['new_days'];
	$classinthisgroup[$categorie][$compteur]=$row2['class'];
	$grasinthisgroup[$categorie][$compteur]=$row2['bold'];
	$totalcategorymodules[$totalcompteur]=$row2['module']; //utile quand groupmenu=99 -->cette variable liste tous les modules affich�s dans des cat�gories
	$compteur2=$categorie;
	$total_actions="sommaire_showhide('sommaire-".$row2['groupmenu']."','nok','sommaireupdown-".$row2['groupmenu']."');";
	$totalcompteur=1;
	//	echo "{$moduleinthisgroup[$categorie][$compteur]}<br>{$linkinthisgroup[$categorie][$compteur]}<br>{$linktextinthisgroup[$categorie][$compteur]}<br>{$imageinthisgroup[$categorie][$compteur]}<br>";
	while ($row2 = $db->sql_fetchrow($result2)) { //ensuite on fait la m�me chose pour toutes les autres lignes.
		$categorie=$row2['groupmenu'];
		$totalcategorymodules[$totalcompteur]=$row2['module'];
		$totalcompteur++;
		
		if ($compteur2==$categorie) { //permet de savoir si on a chang� de cat�gorie (groupmenu diff�rent) : dans ce cas on remet le 2�me compteur � 0.
			$compteur++;
		}
		else {
			$total_actions=$total_actions."sommaire_showhide('sommaire-".$row2['groupmenu']."','nok','sommaireupdown-".$row2['groupmenu']."');";
			$compteur=0;
		}
		$moduleinthisgroup[$categorie][$compteur]=$row2['module'];
		$linkinthisgroup[$categorie][$compteur]=$row2['url'];
		$linktextinthisgroup[$categorie][$compteur]=$row2['url_text'];
		$imageinthisgroup[$categorie][$compteur]=$row2['image'];
		$newinthisgroup[$categorie][$compteur]=$row2['new'];
		$newdaysinthisgroup[$categorie][$compteur]=$row2['new_days'];
		$classinthisgroup[$categorie][$compteur]=$row2['class'];
		$grasinthisgroup[$categorie][$compteur]=$row2['bold'];
		$compteur2=$categorie;
	//	echo "{$moduleinthisgroup[$categorie][$compteur]}<br>{$linkinthisgroup[$categorie][$compteur]}<br>{$linktextinthisgroup[$categorie][$compteur]}<br>{$imageinthisgroup[$categorie][$compteur]}<br>";
	}
// --> OK, les variables ont pris la valeur ad�quate de la table nuke_sommaire_categories


$content ="
<!-- Sommaire realise grace au module Sommaire Parametrable v.2.1.1 - �marcoledingue - marcoledingue .-:@at@:-. free.fr -->
";
?>
<script type="text/javascript" language="JavaScript">
function sommaire_envoielistbox(page) {
	var reg= new RegExp('(_sommaire_targetblank)$','g');
	if (reg.test(page)) {
		page=page.replace(reg,"");
		window.open(page,'','menubar=yes,status=yes, location=yes, scrollbars=yes, resizable=yes');
	}else if (page!="select") {
			top.location.href=page;
	}
}				
function sommaire_ouvre_popup(page,nom,option) {
	window.open(page,nom,option);
}
</script>
<?

	$dynamictest=0;
	// Ensuite, on charge la table nuke_sommaire //
    $sql = "SELECT groupmenu, name, image, lien, hr, center, bgcolor, invisible, class, bold, new, listbox, dynamic FROM ".$prefix."_sommaire ORDER BY groupmenu ASC";
    $result = $db->sql_query($sql);
	$content.="<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">";
	$classpointeur=0;
    while ($row = $db->sql_fetchrow($result)) {  // on va afficher chaque cat�gorie, puis les modules correspondants//
		$som_groupmenu = $row['groupmenu'];
		$som_name = ereg_replace("&amp;nbsp;","&nbsp;",$row['name']);
		$som_image = $row['image'];
		$som_lien = $row['lien'];
		$som_hr = $row['hr'];
		$som_center = $row['center'];
		$som_bgcolor = $row['bgcolor'];
		$invisible[$classpointeur] = $row['invisible'];
		$categoryclass[$classpointeur] = $row['class'];
		$som_bold = $row['bold'];
		$som_new = $row['new'];
		$som_listbox = $row['listbox'];
		$som_dynamic = $row['dynamic'];
		if ($som_dynamic=="on" && $dynamictest!=1 && $detectMozilla!=1) {
			$dynamic=1;
			?>
			<script type="text/javascript" language="JavaScript">
			function sommaire_showhide(tableau, trigger, somimagename) {
				if (document.getElementById(tableau).style.display == "none" && trigger!="nok") {
					document.getElementById(tableau).style.display = "block";
					document.images[somimagename].src="<?echo $path_icon;?>/admin/up.gif";
				}
				else {
					var reg= new RegExp("<?echo $path_icon;?>/admin/up.gif$","gi");
					if (reg.test(document.images[somimagename].src)) {
						document.images[somimagename].src="<?echo $path_icon;?>/admin/down.gif";
					}
					document.getElementById(tableau).style.display = "none";
				}
			}
			</script>
			<?
		}
		$dynamictest=1;
		
		if ($som_hr == "on") {
			$content.="<tr><td><hr></td></tr>";
		}

		if ($som_groupmenu <> 99) {
			
			if ($dynamic==1 && $detectMozilla!=1 && $moduleinthisgroup[$som_groupmenu]['0'] && $som_listbox!="on") { // si on a des liens/modules dans cette cat�gorie (cat�gorie non vide), et que ce n'est pas une listbox
				$reenrouletout=ereg_replace("sommaire_showhide\(\'sommaire-$som_groupmenu\',\'nok\'\,\'sommaireupdown-$som_groupmenu\');","",$total_actions);
				$action_somgroupmenu="onclick=\"$reenrouletout sommaire_showhide('sommaire-$som_groupmenu','ok','sommaireupdown-$som_groupmenu')\" style=\"cursor:pointer\""; // menu dynamique
			}
			else {
			$action_somgroupmenu="";
			}
			$content.="
						<tr height=\"4\" bgcolor=\"$som_bgcolor\"><td></td></tr>
						";
			$content.="<tr $action_somgroupmenu><td bgcolor=\"$som_bgcolor\" >";
			
			if ($som_center=="on") {
				$content.="<div align=\"center\">";
			}
			if ($som_lien<>"") {
				$testepopup=strpos($som_lien,"javascript:window.open(");
				if ($testepopup===0) {
					$som_lien = str_replace("window.open","sommaire_ouvre_popup",$som_lien);
					$content.="<a href=\"$som_lien\"";
				}
				else {
				$content.="<a href=\"$som_lien\"";
				$testehttp=strpos($som_lien,"http://");
				$testehttps=strpos($som_lien,"https://");
				$testeftp=strpos($som_lien,"ftp://");
				if ($testehttp===0 || $testeftp===0 || $testehttps===0) {
					$content.=" target=\"_blank\"";
				}
				$content.=">";
				}
			}

			if ($som_image<> "noimg") {
/************************************************************************************/
/*                 Modifications par MAC06  17/07/2003                              */
/*                  http://visiondesign.free.fr                                     */
/*                     magetmac06@hotmail.com                                       */
/*  Les modifs permettent d'inserer soit un swf (Flash), soit une image normale.    */
/*  Les images et les swf doivent etre plac�s dans "images/sommaire/".              */
/************************************************************************************/
				if (eregi(".swf",$som_image)) { //////////////////// support des fichiers FLASH - par MAC06 //////////////////////////
					$content .= "<OBJECT classid=\"clsid:D27CDB6E-AE6D-11cf-96B8-444553540000\" width=\"179\" height=\"20\" id=\"$som_groupmenu\"><PARAM NAME=movie VALUE=\"$path_icon/$som_image\"><PARAM NAME=quality VALUE=high><EMBED src=\"$path_icon/$som_image\" quality=high WIDTH=\"160\" HEIGHT=\"20\" TYPE=\"application/x-shockwave-flash\" wmode=\"transparent\"></EMBED></OBJECT><br>";
        		}
				else {
				$fermebalise= ($som_lien!="") ? "</a>" : "" ;
					$content.="<img src=\"$path_icon/$som_image\" border=\"0\">".$fermebalise."&nbsp;";
				}
			}

			 // gestion multilingue : si le nom de cat�gorie commence par 'LANG:_' alors c'est multilingue, donc on va afficher ce qui a �t� inscrit dans le fichier de langue.
			if (strpos($som_name,"LANG:_")===0) {
				$som_name = str_replace("LANG:","",$som_name);
				eval( "\$som_name = $som_name;");
			}//fin gestion multilingue
			
			if (eregi(".swf",$som_image) || $som_name=="" || $som_name==" " ||$som_name=="&nbsp;" ||$som_name=="&amp;nbsp;") { //////////////////// support des fichiers FLASH - par MAC06 -+- marcoledingue : ajout du second check, qui permet d'avoir des cat�gories avec un nom vide. //////////////////////////
			}
			else {
				if ($som_lien<>"") {
						
				 // gestion multilingue : si l'url de cat�gorie commence par 'LANG:_' alors c'est multilingue, donc on va afficher ce qui a �t� inscrit dans le fichier de langue.
					if (strpos($som_lien,"LANG:_")===0) {
						$som_lien = str_replace("LANG:","",$som_lien);
						eval( "\$som_lien = $som_lien;");
					}//fin gestion multilingue
					$testepopup=strpos($som_lien,"javascript:window.open(");
					if ($testepopup===0) {
						$som_lien = str_replace("window.open","sommaire_ouvre_popup",$som_lien);
						$content.="<a href=\"$som_lien\"";
					}
					else {
						$content.="<a href=\"$som_lien\"";
						$testehttp=strpos($som_lien,"http://");
						$testeftp=strpos($som_lien,"ftp://");
						$testehttps=strpos($som_lien,"https://");
						if ($testehttp===0 || $testeftp===0 ||$testehttps===0) {
							$content.=" target=\"_blank\"";
						}
					}
				$content.=">";
				}
				
				$bold1 = ($som_bold=="on") ? "<strong>" : "" ;
				$bold2 = ($som_bold=="on") ? "</strong>" : "" ;
				$new = ($som_new=="on") ? "<img src=\"$path_icon/admin/$imgnew\" border=0 title=\""._SOMNEWCONTENT."\">" : "" ;
				
				$content.="<font class=\"$categoryclass[$classpointeur]\">".$bold1."$som_name".$bold2."</font>".$new."";
			}
			
			if ($som_lien<>"") {
			$content.="</a>";
			}
			if ($dynamic==1 && $detectMozilla!=1 && $moduleinthisgroup[$som_groupmenu]['0']) {
				$zeimage = ($som_listbox=="on") ? "null.gif" :"down.gif" ;
				$content.="<img align=\"bottom\" id=\"sommaireupdown-$som_groupmenu\" name=\"sommaireupdown-$som_groupmenu\" src=\"$path_icon/admin/$zeimage\" border=0>";
			}
			if ($som_center=="on") {
				$content.="</div>";
			}
			$content.="</td></tr>\n";
			
		}
		$keyinthisgroup=0;
		
		if ($som_groupmenu<>99 && $moduleinthisgroup[$som_groupmenu]['0']) {
		if ($som_listbox=="on") {// on d�sactive le r�enroulage automatique si le menu est dynamique.
			$content.="<tr><td bgcolor=\"$som_bgcolor\"><span name=\"sommaire-$som_groupmenu\" id=\"sommaire-$som_groupmenu\"></span>";
			$aenlever="sommaire_showhide\('sommaire-".$som_groupmenu."','nok','sommaireupdown-".$som_groupmenu."'\);";
			$total_actions = ereg_replace("$aenlever", "" , $total_actions);
			
			$content.="<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"><tr><td>";
			
			$content.="<form action=\"modules.php\" method=\"get\" name=\"sommaireformlistbox\">"
					."<select name=\"somlistbox$keysommaire\" onchange=\"sommaire_envoielistbox(this.options[this.selectedIndex].value)\">"
					."<option value=\"select\">"._SOMSELECTALINK."";
		}
		else {
			$content.="<tr name=\"sommaire-$som_groupmenu\" id=\"sommaire-$som_groupmenu\"><td bgcolor=\"$som_bgcolor\">";
			$content.="<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">";
		}
		
		if ($som_image<>"noimg" && !eregi(".swf",$som_image) && $som_center<>"on") { ///////////////////////////support des fichiers FLASH - par MAC06 /////////////////////////
			$catimagesize = getimagesize("$path_icon/$som_image");//l� on va r�cup�rer la largeur de l'image de la cat�gorie, pour aligner les modules avec le titre de la cat�gorie.
		}
		else {
			$catimagesize[0]=0;
		}
		
		while ($moduleinthisgroup[$som_groupmenu][$keyinthisgroup]) { //on va checker si chaque module indiqu� dans la cat�gorie en cours est install� et activ�/visible //
			if ($grasinthisgroup[$som_groupmenu][$keyinthisgroup]=="on") { // va mettre le lien en gras si indiqu�.
				$gras1="<strong>";
				$gras2="</strong>";
			}
			else {
				$gras1 = $gras2 = "";
			}
			
			if ($som_listbox=="on") { // gestion des listbox
				if ($moduleinthisgroup[$som_groupmenu][$keyinthisgroup]=="Lien externe") {
					 // gestion multilingue : si le lien commence par 'LANG:_' alors c'est multilingue, donc on va afficher ce qui a �t� inscrit dans le fichier de langue.
					if (strpos($linkinthisgroup[$som_groupmenu][$keyinthisgroup],"LANG:_")===0) {
						$zelink_lang = str_replace("LANG:","",$linkinthisgroup[$som_groupmenu][$keyinthisgroup]);
						eval( "\$zelink_lang = $zelink_lang;");
						$linkinthisgroup[$som_groupmenu][$keyinthisgroup] = $zelink_lang;
					}//fin gestion multilingue
					$testehttp=strpos($linkinthisgroup[$som_groupmenu][$keyinthisgroup],"http://");
					$testeftp=strpos($linkinthisgroup[$som_groupmenu][$keyinthisgroup],"ftp://");
					$testehttps=strpos($linkinthisgroup[$som_groupmenu][$keyinthisgroup],"https://");
					$testepopup=strpos($linkinthisgroup[$som_groupmenu][$keyinthisgroup],"javascript:window.open(");
					if ($testehttp===0 || $testeftp===0 || $testehttps===0) {
						$zelink= "_sommaire_targetblank";
					}
					elseif ($testepopup===0) {
						$zelink=" target=\"popup_sommaire\"";
					}
					else {
						$zelink="";
					}
					// gestion multilingue : si le texte du lien commence par 'LANG:_' alors c'est multilingue, donc on va afficher ce qui a �t� inscrit dans le fichier de langue.
					$linklang=$linktextinthisgroup[$som_groupmenu][$keyinthisgroup];
					if (strpos($linklang,"LANG:_")===0) {
						$linklang = str_replace("LANG:","",$linklang);
						eval( "\$linklang = $linklang;");
						$linktextinthisgroup[$som_groupmenu][$keyinthisgroup]=$linklang;
					}//fin gestion multilingue
					$content.= "<option value=\"".$linkinthisgroup[$som_groupmenu][$keyinthisgroup]."".$zelink."\">".$linktextinthisgroup[$som_groupmenu][$keyinthisgroup]."";
				}
				elseif($moduleinthisgroup[$som_groupmenu][$keyinthisgroup]!="SOMMAIRE_HR") {
					for ($z=0;$z<count($module);$z++) { //pour chaque module activ� et visible on va regarder o� on l'affiche
						if ($module[$z]!=$main_module && (($is_admin===1 AND $view[$z] == 2) OR $view[$z] != 2) && $moduleinthisgroup[$som_groupmenu][$keyinthisgroup]==$module[$z]) {
							$isin = ($mod_group[$z]==0 || ($userpoints>0 && $userpoints>=$pointsneeded[$mod_group[$z]])) ? 1 : 0 ;
							if ($view[$z]==1 && $is_user==0 && ($invisible[0]==3 || $invisible[0]==5)) { //on n'affiche pas si c'est un visiteur et que l'on a coch� 'modules invisbles' dans l'admin du sommaire
							}
							elseif ($view[$z]==1 && $is_user==1 && $invisible[0]==5 && $isin==0) {//on n'affiche pas si c'est un membre, qui n'est pas dans le bon groupe et que l'on a coch� 'modules invisibles' dans l'admin du sommaire
							}
							else {// sinon OK, on affiche le module dans le drop-down.
							$customtitle2 = ($customtitle[$z] != "") ? $customtitle[$z] : ereg_replace("_", " ", $module[$z]);
							$content.="<option value=\"modules.php?name=".$module[$z]."\">".$customtitle2."";
							}
						}
					}
				}
			}
			elseif($moduleinthisgroup[$som_groupmenu][$keyinthisgroup]=="Lien externe" && !ereg("^modules.php\?name=", $linkinthisgroup[$som_groupmenu][$keyinthisgroup])) { // gestion des liens externes
					 // gestion multilingue : si le lien commence par 'LANG:_' alors c'est multilingue, donc on va afficher ce qui a �t� inscrit dans le fichier de langue.
				if (strpos($linkinthisgroup[$som_groupmenu][$keyinthisgroup],"LANG:_")===0) {
					$zelink_lang = str_replace("LANG:","",$linkinthisgroup[$som_groupmenu][$keyinthisgroup]);
					eval( "\$zelink_lang = $zelink_lang;");
					$linkinthisgroup[$som_groupmenu][$keyinthisgroup] = $zelink_lang;
				}//fin gestion multilingue
	
				$testepopup=strpos($linkinthisgroup[$som_groupmenu][$keyinthisgroup],"javascript:window.open(");
				if ($testepopup===0) {
							$linkinthisgroup[$som_groupmenu][$keyinthisgroup] = str_replace("window.open","sommaire_ouvre_popup",$linkinthisgroup[$som_groupmenu][$keyinthisgroup]);
							$zelink="";
							}
				else {
					$testehttp=strpos($linkinthisgroup[$som_groupmenu][$keyinthisgroup],"http://");
					$testeftp=strpos($linkinthisgroup[$som_groupmenu][$keyinthisgroup],"ftp://");
					$testehttps=strpos($linkinthisgroup[$som_groupmenu][$keyinthisgroup],"https://");
					
					if ($testehttp===0 || $testeftp===0 || $testehttps===0) {
						$zelink= " target=\"_blank\"";
					}
					else {
						$zelink="";
					}
				}
			// gestion multilingue : si le texte du lien commence par 'LANG:_' alors c'est multilingue, donc on va afficher ce qui a �t� inscrit dans le fichier de langue.
			$linklang=$linktextinthisgroup[$som_groupmenu][$keyinthisgroup];
			if (strpos($linklang,"LANG:_")===0) {
				$linklang = str_replace("LANG:","",$linklang);
				eval( "\$linklang = $linklang;");
				$linktextinthisgroup[$som_groupmenu][$keyinthisgroup]=$linklang;
			}//fin gestion multilingue
			
			$content.="<tr>";
			
			$new = ($newinthisgroup[$som_groupmenu][$keyinthisgroup]=="on") ? "<img src=\"$path_icon/admin/$imgnew\" border=0 title=\""._SOMNEWCONTENT."\">" : "" ;
			$imagedulien="<img src=\"$path_icon/categories/".$imageinthisgroup[$som_groupmenu][$keyinthisgroup]."\" border=0>";
			$lelien="<a href=\"".$linkinthisgroup[$som_groupmenu][$keyinthisgroup]."\"".$zelink.">";
			$letexte="<font class=\"".$classinthisgroup[$som_groupmenu][$keyinthisgroup]."\">".$linktextinthisgroup[$som_groupmenu][$keyinthisgroup]."</font>";
			
				if ($imageinthisgroup[$som_groupmenu][$keyinthisgroup]<>"middot.gif" && ($linktextinthisgroup[$som_groupmenu][$keyinthisgroup]=="" || $linktextinthisgroup[$som_groupmenu][$keyinthisgroup]==" " || $linktextinthisgroup[$som_groupmenu][$keyinthisgroup]=="&nbsp;" || $linktextinthisgroup[$som_groupmenu][$keyinthisgroup]=="&amp;nbsp;")) { //si le texte du lien est vide l'image va �tre clickable
					$content.="<td colspan=2>".$lelien."".$imagedulien."</a>".$new."";
					$content.="</td></tr>\n";
				}
				elseif ($imageinthisgroup[$som_groupmenu][$keyinthisgroup]<>"middot.gif") { //si le texte n'est pas vide
					$content.="<td width=\"$catimagesize[0]\" align=\"right\">".$imagedulien."</td><td>&nbsp;".$lelien."".$gras1."".$letexte."".$gras2."</a>".$new."";
					$content.="</td></tr>\n";
				}
				else { // si l'image utilis�e est le middot
					$content.="<td width=\"$catimagesize[0]\" align=\"right\"><strong><big>&middot;</big></strong></td><td>&nbsp;".$lelien."".$gras1."".$letexte."".$gras2."</a>".$new."";
					$content.="</td></tr>\n";
				}
			}
			elseif ($moduleinthisgroup[$som_groupmenu][$keyinthisgroup]=="SOMMAIRE_HR") {
				$content.="<tr><td colspan=2>";
				$content.="<hr>";
				$content.="</td></tr>\n";
			}
			else {// un module normal, ou bien un lien interne (lien externe vers une page sp�cifique d'un module du site)
				for ($z=0;$z<count($module);$z++) { //pour chaque module activ� et visible on va regarder o� on l'affiche
					if ($moduleinthisgroup[$som_groupmenu][$keyinthisgroup]=="Lien externe") { //si c'est un lien externe, il commence par 'modules.php?name=' ==>c'est un lien vers un module du site
						$temponomdumodule=split("&", $linkinthisgroup[$som_groupmenu][$keyinthisgroup]);
						$nomdumodule = ereg_replace("modules.php\?name=","",$temponomdumodule[0]);
						
						 // gestion multilingue : si le lien commence par 'LANG:_' alors c'est multilingue, donc on va afficher ce qui a �t� inscrit dans le fichier de langue.
						if (strpos($linkinthisgroup[$som_groupmenu][$keyinthisgroup],"LANG:_")===0) {
							$zelink_lang = str_replace("LANG:","",$linkinthisgroup[$som_groupmenu][$keyinthisgroup]);
							eval( "\$zelink_lang = $zelink_lang;");
							$linkinthisgroup[$som_groupmenu][$keyinthisgroup] = $zelink_lang;
						}//fin gestion multilingue
						// gestion multilingue : si le texte du lien commence par 'LANG:_' alors c'est multilingue, donc on va afficher ce qui a �t� inscrit dans le fichier de langue.
						$linklang=$linktextinthisgroup[$som_groupmenu][$keyinthisgroup];
						if (strpos($linklang,"LANG:_")===0) {
							$linklang = str_replace("LANG:","",$linklang);
							eval( "\$linklang = $linklang;");
							$linktextinthisgroup[$som_groupmenu][$keyinthisgroup]=$linklang;
						}//fin gestion multilingue
						
						$customtitle2 = $linktextinthisgroup[$som_groupmenu][$keyinthisgroup];
						$urldumodule = $linkinthisgroup[$som_groupmenu][$keyinthisgroup];
					}
					else {
						$nomdumodule =$moduleinthisgroup[$som_groupmenu][$keyinthisgroup];
						$customtitle2 = ($customtitle[$z] != "") ? $customtitle[$z] : ereg_replace("_", " ", $module[$z]);
						$urldumodule = "modules.php?name=$nomdumodule";
					}
					if (!($module[$z]==$main_module && $moduleinthisgroup[$som_groupmenu][$keyinthisgroup]!="Lien externe")) { //on n'affiche pas le module en homepage, sauf s'il est appel� par un lien externe
			    		if (($is_admin===1 AND $view[$z] == 2) OR $view[$z] != 2) { //si on n'est pas admin et que le module est r�serv� aux admins, il n'appara�t pas
							if ($nomdumodule==$module[$z]) {
								if ($dynamic==1 && $detectMozilla!=1 && ereg(addcslashes($urldumodule, '?&'), $_SERVER['REQUEST_URI'])) { // si la page visualis�e est le module[$z], alors on r�cup�re son groupmenu pour ne pas enrouler la cat�gorie par d�faut.
									$categorieouverte=$som_groupmenu;
								}
								
								if ($imageinthisgroup[$som_groupmenu][$keyinthisgroup]!="middot.gif") {
									$limage="<img src=\"$path_icon/categories/".$imageinthisgroup[$som_groupmenu][$keyinthisgroup]."\" border=\"0\">";
								}
								else {
									$limage="<strong><big>&middot;</big></strong>";
								}
								
								//gestion des groupes
								$isin=0;
								if ($is_user==1 && ($invisible[0]==5 || $invisible[0]==4) && $view[$z]==1){
									$isin = ($mod_group[$z]==0 || ($userpoints>0 && $userpoints>=$pointsneeded[$mod_group[$z]])) ? 1 : 0 ;
								}
								
								if($is_user==1 && $view[$z]==1 && $invisible[0]==4 && $isin==0) {// c'est un membre, qui n'est pas dans le groupe pouvant visualiser ce module
									$limage="<img src=\"$path_icon/admin/interdit.gif\" title=\""._SOMRESTRICTED."\">";
								}
								elseif ($is_user==0 && $view[$z]==1 && ($invisible[0]==2 || $invisible[0]==4)) {//visiteur non membre, ne peut pas visualiser un module r�serv� aux membres.
									$limage="<img src=\"$path_icon/admin/interdit.gif\" title=\""._SOMRESTRICTED."\">";
								}
								
								if ($is_user==1 && $view[$z]==1 && $invisible[0]==5 && $isin==0 && $is_admin==0) { //c'est un membre, mais pas dans le bon groupe pour voir le module.
								}
								elseif($is_user==0 && $view[$z]==1 && $invisible[0]==5 && $is_admin==0) { //c'est un visiteur, il doit �tre membre et faire partie d'un groupe pour voir le module.
								}
								elseif ($is_user==0 AND $view[$z]==1 AND $invisible[0]==3 && $is_admin==0) { //c'est un visiteur, il doit �tre membre pour voir le module (pas de gestion des groupes)
								}
								else {
									
									if (($newpms[0]) AND ($module[$z] =="Private_Messages")) {
										$disp_pmicon="<img src=\"images/blocks/email-y.gif\" height=\"10\" width=\"14\" alt=\""._SOMNEWPM."\" title=\""._SOMNEWPM."\">";
									}
									else {
										$disp_pmicon="";
									}
									////// ajout support NEW! automatique pour les modules de base.
									$new = ($newinthisgroup[$som_groupmenu][$keyinthisgroup]=="on") ? "<img src=\"$path_icon/admin/$imgnew\" border=0 title=\""._SOMNEWCONTENT."\">" : "" ;
									
									if ($nomdumodule=="Downloads" && $newdaysinthisgroup[$som_groupmenu][$keyinthisgroup]!="-1") {
										$where = (ereg("^cid=[0-9]*$",$temponomdumodule[2])) ? " WHERE $temponomdumodule[2]" : "";
										$sqlimgnew="SELECT date FROM ".$prefix."_downloads_downloads".$where." order by date desc limit 1";
										$resultimgnew=$db->sql_query($sqlimgnew);
										$rowimgnew = $db->sql_fetchrow($resultimgnew);
										if ($rowimgnew['date']) {
											ereg ("([0-9]{4})-([0-9]{1,2})-([0-9]{1,2}) ([0-9]{1,2}):([0-9]{1,2}):([0-9]{1,2})", $rowimgnew['date'], $datetime);
											$zedate = mktime($datetime[4],$datetime[5],$datetime[6],$datetime[2],$datetime[3],$datetime[1]);
											$now=time();
											if(intval(($now-$zedate)/86400) <= $newdaysinthisgroup[$som_groupmenu][$keyinthisgroup]) {
												$new="<img src=\"$path_icon/admin/$imgnew\" border=0 title=\""._SOMNEWCONTENT."\">";
											}
										}
									}
									elseif ($nomdumodule=="Web_Links" && $newdaysinthisgroup[$som_groupmenu][$keyinthisgroup]!="-1") {
										$where = (ereg("^cid=[0-9]*$",$temponomdumodule[2])) ? " WHERE $temponomdumodule[2]" : "";
										$sqlimgnew="SELECT date FROM ".$prefix."_links_links".$where." order by date desc limit 1";
										$resultimgnew=$db->sql_query($sqlimgnew);
										$rowimgnew = $db->sql_fetchrow($resultimgnew);
										if ($rowimgnew['date']) {
											ereg ("([0-9]{4})-([0-9]{1,2})-([0-9]{1,2}) ([0-9]{1,2}):([0-9]{1,2}):([0-9]{1,2})", $rowimgnew['date'], $datetime);  
											$zedate = mktime($datetime[4],$datetime[5],$datetime[6],$datetime[2],$datetime[3],$datetime[1]);
											$now=time();
											if(intval(($now-$zedate)/86400) <= $newdaysinthisgroup[$som_groupmenu][$keyinthisgroup]) { 
												$new="<img src=\"$path_icon/admin/$imgnew\" border=0 title=\""._SOMNEWCONTENT."\">";
											}
										}
									}
									elseif ($nomdumodule=="Content" && $newdaysinthisgroup[$som_groupmenu][$keyinthisgroup]!="-1") {
										$where = (ereg("^cid=[0-9]*$",$temponomdumodule[2])) ? " WHERE $temponomdumodule[2]" : "";
										$sqlimgnew="SELECT date FROM ".$prefix."_pages".$where." order by date desc limit 1";
										$resultimgnew=$db->sql_query($sqlimgnew);
										$rowimgnew = $db->sql_fetchrow($resultimgnew);
										if ($rowimgnew['date']) {
											ereg ("([0-9]{4})-([0-9]{1,2})-([0-9]{1,2}) ([0-9]{1,2}):([0-9]{1,2}):([0-9]{1,2})", $rowimgnew['date'], $datetime);  
											$zedate = mktime($datetime[4],$datetime[5],$datetime[6],$datetime[2],$datetime[3],$datetime[1]);
											$now=time();
											if(intval(($now-$zedate)/86400) <= $newdaysinthisgroup[$som_groupmenu][$keyinthisgroup]) { 
												$new="<img src=\"$path_icon/admin/$imgnew\" border=0 title=\""._SOMNEWCONTENT."\">";
											}
										}
									}
									elseif ($nomdumodule=="Reviews" && $newdaysinthisgroup[$som_groupmenu][$keyinthisgroup]!="-1") {
										$where = "";
										$sqlimgnew="SELECT date FROM ".$prefix."_pages".$where." order by date desc limit 1";
										$resultimgnew=$db->sql_query($sqlimgnew);
										$rowimgnew = $db->sql_fetchrow($resultimgnew);
										if ($rowimgnew['date']) {
											ereg ("([0-9]{4})-([0-9]{1,2})-([0-9]{1,2}) ([0-9]{1,2}):([0-9]{1,2}):([0-9]{1,2})", $rowimgnew['date'], $datetime);  
											$zedate = mktime($datetime[4],$datetime[5],$datetime[6],$datetime[2],$datetime[3],$datetime[1]);
											$now=time();
											if(intval(($now-$zedate)/86400) <= $newdaysinthisgroup[$som_groupmenu][$keyinthisgroup]) { 
												$new="<img src=\"$path_icon/admin/$imgnew\" border=0 title=\""._SOMNEWCONTENT."\">";
											}
										}
									}
									elseif ($nomdumodule=="Journal" && $newdaysinthisgroup[$som_groupmenu][$keyinthisgroup]!="-1") {
										$where = "";
										$sqlimgnew="SELECT mdate FROM ".$prefix."_journal".$where." order by mdate desc limit 1";
										$resultimgnew=$db->sql_query($sqlimgnew);
										$rowimgnew = $db->sql_fetchrow($resultimgnew);
										if ($rowimgnew['mdate']) {
											ereg ("([0-9]{1,2})-([0-9]{1,2})-([0-9]{4})", $rowimgnew['mdate'], $datetime);  
											$zedate = mktime(0,0,0,$datetime[1],$datetime[2],$datetime[3]);
											$now=time();
											if(intval(($now-$zedate)/86400) <= $newdaysinthisgroup[$som_groupmenu][$keyinthisgroup]) { 
												$new="<img src=\"$path_icon/admin/$imgnew\" border=0 title=\""._SOMNEWCONTENT."\">";
											}
										}
									}
									elseif ($nomdumodule=="News" && $newdaysinthisgroup[$som_groupmenu][$keyinthisgroup]!="-1") {
										$where = (ereg("^new_topic=[0-9]*$",$temponomdumodule[1])) ? " WHERE ".ereg_replace("new_","",$temponomdumodule[1])."" : "";
										$sqlimgnew="SELECT time FROM ".$prefix."_stories".$where." order by time desc limit 1";
										$resultimgnew=$db->sql_query($sqlimgnew);
										$rowimgnew = $db->sql_fetchrow($resultimgnew);
										if ($rowimgnew['time']) {
											ereg ("([0-9]{4})-([0-9]{1,2})-([0-9]{1,2}) ([0-9]{1,2}):([0-9]{1,2}):([0-9]{1,2})", $rowimgnew['time'], $datetime);  
											$zedate = mktime($datetime[4],$datetime[5],$datetime[6],$datetime[2],$datetime[3],$datetime[1]);
											$now=time();
											if(intval(($now-$zedate)/86400) <= $newdaysinthisgroup[$som_groupmenu][$keyinthisgroup]) { 
												$new="<img src=\"$path_icon/admin/$imgnew\" border=0 title=\""._SOMNEWCONTENT."\">"; 
											}
										}
									}
									
									if ($limage!="middot.gif" && ($customtitle2=="" || $customtitle2==" " || $customtitle2=="&nbsp;" || $customtitle2=="&amp;nbsp;")) { //si le texte du lien est vide l'image va �tre clickable
										$content.="<tr><td width=\"$catimagesize[0]\" align=\"right\"></td><td>&nbsp;<a href=\"".$urldumodule."\">".$limage."</a>".$new."";
										$content.="</td></tr>\n";
									}
									else {
										$width=" width=\"$catimagesize[0]\"";
										$content.="<tr><td".$width." align=\"right\">".$limage."";
										$content.="</td><td>".$disp_pmicon."";
										$content.="&nbsp;<a href=\"".$urldumodule."\"><font class=\"".$classinthisgroup[$som_groupmenu][$keyinthisgroup]."\">".$gras1."$customtitle2".$gras2."</font></a>".$new."";
										$content.="</td></tr>\n";
									}
								}
							}
							
						}
					}
				}// end for
	   		}// end else (pas lien externe et pas listbox)
			$keyinthisgroup++;
		}// end while
		if ($som_listbox=="on") {
			$content.="</select></form></td></tr>";
		}
		$content.="</table>";
		
		$content.="</td></tr>";
		$content.="<tr height=\"4\" bgcolor=\"$som_bgcolor\"><td></td></tr>";
		}//end if somgroupmenu<>99
	
	if ($som_groupmenu == 99 && $is_admin==1) { // si on est � la cat�gorie 99, on affiche tous les modules install�s/activ�s/visibles qui n'ont pas �t� affich�s dans les cat�gories.
		$content.="<tr><td>";
		for ($z=0;$z<count($module);$z++) {
			$customtitle2 = ereg_replace ("_"," ", $module[$z]);
			if ($customtitle[$z] != "") {
				$customtitle2 = $customtitle[$z];
			}
			if ($module[$z] != $main_module) {
 				if (($is_admin===1 AND $view[$z] == 2) OR $view[$z] != 2) {
					
					$incategories=0;
					for ($i=0;$i<count($totalcategorymodules);$i++) {
						if ($module[$z]==$totalcategorymodules[$i]) {
							$incategories=1;
						}
					}
					if ($incategories==0) {
						$flagmenu = $flagmenu+1;
						if ($flagmenu==1) {
							$content .="<hr><div align=\"center\">"._SOMMAIREADMINVIEWALLMODULES."</div><br>";   // si il y a des modules affich�s en rubrique 99, on affiche avant une ligne horizontale
						}
						if (($newpms[0]) AND ($module[$z]=="Private_Messages")) { // si PMs non lus, on affiche le logo mail
				 			$content .= "<strong><big>&middot;</big></strong><img src=\"images/blocks/email-y.gif\" height=\"10\" width=\"14\" alt=\""._SOMNEWPM."\" title=\""._SOMNEWPM."\"><a href=\"modules.php?name=$module[$z]\">$customtitle2</a><br>\n";
						}
						else {
							$content .= "<strong><big>&middot;</big></strong>&nbsp;<a href=\"modules.php?name=$module[$z]\">$customtitle2</a><br>\n";
						}
					}
				}
			}
		}//end for groupmenu=99
		$content.="</td></tr>";
	}//end if groupmenu=99
	}
	$content.="</table>";
	if ($dynamic==1 && $detectMozilla!=1) { // on va r�enrouler toutes les cat�gories, sauf celle contenant le module affich� sur la page
		$aenlever="sommaire_showhide\('sommaire-".$categorieouverte."','nok','sommaireupdown-".$categorieouverte."'\);";
		$total_actions = ereg_replace("$aenlever", "" , $total_actions);
		$content.="<script type=\"text/javascript\" language=\"JavaScript\">$total_actions;</script>";
	}


    /* If you're Admin you and only you can see Inactive modules and test it */
    /* If you copied a new module is the /modules/ directory, it will be added to the database */

if ($is_admin===1) {

	$key=count($module); // $key va permettre de se positionner dans $module[] pour rajouter des modules � la fin
	
	$content .= "<br><center><b>"._INVISIBLEMODULES."</b><br>";
	$content .= "<font class=\"tiny\">"._ACTIVEBUTNOTSEE."</font></center>";
	if (!($a == 1 AND $dummy != 1)) {
		$content.="<form action=\"modules.php\" method=\"get\" name=\"sommaireformlistboxinvisibles\">"
						."<select name=\"somlistboxinvisibles\" onchange=\"sommaire_envoielistbox(this.options[this.selectedIndex].value)\">"
						."<option value=\"select\">"._SOMSELECTALINK."";
		$sql = "SELECT title, custom_title FROM ".$prefix."_modules WHERE active='1' AND inmenu='0' ORDER BY title ASC";
		$result = $db->sql_query($sql);
		while ($row = $db->sql_fetchrow($result)) {
			$module[$key]=$row['title'];
			$key++;
		    $mn_title = $row['title'];
		    $custom_title = $row['custom_title'];
		    $mn_title2 = ereg_replace("_", " ", $mn_title);
		    if ($custom_title != "") {
				$mn_title2 = $custom_title;
		    }
		    if ($mn_title2 != "") {
				$content .= "<option value=\"modules.php?name=".$mn_title."\">".$mn_title2."";
				$dummy = 1;
		    } else {
				$a = 1;
		    }
		}
		$content.= "</select></form>\n";
	}
	else {
        $content .= "<br><strong><big>&middot;</big></strong>&nbsp;<i>"._NONE."</i><br>\n";
	}
	
	$content .= "<br><center><b>"._NOACTIVEMODULES."</b><br>";
	$content .= "<font class=\"tiny\">"._FORADMINTESTS."</font></center>";
	if (!($a == 1 AND $dummy != 1)) {
		$content.="<form action=\"modules.php\" method=\"get\" name=\"sommaireformlistboxinactifs\">"
				."<select name=\"somlistboxinactifs\" onchange=\"sommaire_envoielistbox(this.options[this.selectedIndex].value)\">"
				."<option value=\"select\">"._SOMSELECTALINK."";
		
		$sql = "SELECT title, custom_title FROM ".$prefix."_modules WHERE active='0' ORDER BY title ASC";
		$result = $db->sql_query($sql);
		while ($row = $db->sql_fetchrow($result)) {
			$module[$key]=$row['title'];
			$key++;
		    $mn_title = $row['title'];
		    $custom_title = $row['custom_title'];
		    $mn_title2 = ereg_replace("_", " ", $mn_title);
		    if ($custom_title != "") {
		    $mn_title2 = $custom_title;
		    }
		    if ($mn_title2 != "") {
				$content .= "<option value=\"modules.php?name=".$mn_title."\">".$mn_title2."";
			$dummy = 1;
		    } else {
			    $a = 1;
	            }
		}
		$content.= "</select></form>\n";
	}
	else {
    	    $content .= "<br><strong><big>&middot;</big></strong>&nbsp;<i>"._NONE."</i><br>\n";
	}
	
	
	$handle=opendir('modules');
	while ($file = readdir($handle)) {
	    if ( (!ereg("[.]",$file)) ) {
						// ajout d'un check pour diminuer le nombre de requets SQL : on ne checke QUE les modules qui ne sont pas 
			$trouve=0;  //dans  $module c'est � dire les modules qui ne sont pas "actifs" ET "visibles" (==> modules inactifs
			for ($i=0;$i<count($module);$i++) {
				if ($module[$i]==$file) {
				$trouve=1;
				}
	    	}
			if ($trouve<>1) {
				$modlist .= "$file ";
			}
		}
	}
	closedir($handle);
	$modlist = explode(" ", $modlist);
	sort($modlist);
	for ($i=0; $i < sizeof($modlist); $i++) {
	    if($modlist[$i] != "") {
			$sql = "SELECT mid FROM ".$prefix."_modules WHERE title='$modlist[$i]'";
			$result = $db->sql_query($sql);
			$row = $db->sql_fetchrow($result);
			$mid = $row['mid'];
			if ($mid == "") {
			    $db->sql_query("INSERT INTO ".$prefix."_modules VALUES (NULL, '$modlist[$i]', '$modlist[$i]', '0', '0', '1')");
			}
	    }
	}
}//end if admin


// permet de d�terminer si le visiteur est un membre, et r�cup�re ses points si on g�re les groupes (nuke>7)
function sommaire_is_user($user, $gestiongroupe) {
    global $prefix, $db, $user_prefix, $uid, $userpoints;
    if(!is_array($user)) {
        $user = base64_decode($user);
        $user = explode(":", $user);
        $uid = "$user[0]";
        $pwd = "$user[2]";
    } else {
        $uid = "$user[0]";
        $pwd = "$user[2]";
    }
    if ($uid != "" AND $pwd != "") {
		if ($gestiongroupe==0) {
        	$sql = "SELECT user_password FROM ".$user_prefix."_users WHERE user_id='$uid'";
		}
		else if ($gestiongroupe==1) {
			$sql = "SELECT user_password, points FROM ".$user_prefix."_users WHERE user_id='$uid'";
		}
		else {
		die("Probl�me!!");
		}
        $result = $db->sql_query($sql);
        $row = $db->sql_fetchrow($result);
        $pass = $row['user_password'];
        if($pass == $pwd && $pass != "") {
			$userpoints = ($gestiongroupe==1) ? $row['points'] : "";
            return 1;
        }
    }
    return 0;
}

//cette fonction a �t� reprise de mainfile.php : permet d'�viter un appel � la DB car on sait d�j� si is_user!
function sommaire_get_theme($is_user) {
    global $user, $cookie, $Default_Theme;
    if($is_user==1) {
        $user2 = base64_decode($user);
        $t_cookie = explode(":", $user2);
        if($t_cookie[9]=="") $t_cookie[9]=$Default_Theme;
        if(isset($theme)) $t_cookie[9]=$theme;
        if(!$tfile=@opendir("themes/$t_cookie[9]")) {
            $ThemeSel = $Default_Theme;
        } else {
            $ThemeSel = $t_cookie[9];
        }
    } else {
        $ThemeSel = $Default_Theme;
    }
    return($ThemeSel);
}

?>
