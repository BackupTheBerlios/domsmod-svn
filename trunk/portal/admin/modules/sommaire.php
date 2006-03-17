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
/************************************************************************/

/*************************************************************************/
/*                    Module Copyright � Information                     */
/*              Module Sommaire param�trable for PHP-Nuke.               */
/*                            - 26 Mai  2004 -                           */
/*                                                                       */
/* Nom du Module: Sommaire param�trable                                  */
/* Version du Module: 2.1.1                                              */
/*                                                                       */
/* Description du Module:                                                */
/*       Bloc Sommaire param�trable : affichage par cat�gories, avec de  */
/*       nombreuses possibilit�s de pr�sentation :                       */
/*       - Menu dynamique (cat�gories affich�es/cach�es avec un clic     */
/*       - Ajout manuel d'une icone 'NEW' devant les cat�gories          */
/*       - Ajout manuel d'une icone 'NEW' devant les liens/modules       */
/*       - Ajout automatique d'une icone 'NEW' devant les modules de     */
/*         base, avec la d�tection des nouveaut�s du site, et choix de   */
/*         la dur�e des "nouveaut�s".                                    */
/*       - Possibilit� de mettre un lien ou une cat�gorie en gras        */
/*       - Contenu des cat�gories peut �tre affich� en listbox           */
/*       - Choix du style des liens/modules (classe css)                 */
/*       - Affichage possible des cat�gories avec uniquement une image   */
/*       - Affichage possible des liens/modules avec uniquement une image*/
/*       - Barre horizontale pour s�parer 2 cat�gories ou 2 liens (v2.1) */
/*       - Titre de cat�gorie centr�                                     */
/*       - Couleur de fond diff�rente pour chaque cat�gorie              */
/*       - Image sur les cat�gories et les modules                       */
/*       - Ajout de liens externe (n'importe quelle url)                 */
/*       - Affichage d'une ic�ne dans le sommaire si le membre a des     */
/*         Messages Priv�s non lus.                                      */
/*       - Masquer ou non aux visiteurs les modules r�serv�s aux membres */
/*       - Choisir le style (dans style.css) des noms de cat�gories      */
/*       - Mettre un fichier FLASH .swf � la place du nom de cat�gorie   */
/*         (FLASH impl�ment� par MAC06 - magetmac06@hotmail.com)         */
/*                                                                       */
/* License: GNU/GPL                                                      */
/* Nom de l'Auteur: marcoledingue                                        */
/* Email de l'Auteur : marcoledingue@free.fr                             */
/*************************************************************************/
global $admin, $keysommaire, $deletecat, $db, $prefix, $sql, $upgrade_test, $bgcolor1, $zetheme;

if (!eregi("admin.php", $_SERVER['PHP_SELF'])) {
die ("You can't access this file directly..."); 
} 
$aid = trim($aid);
$result = $db->sql_query("select name, radminsuper from ".$prefix."_authors where aid='$aid'");
list($name, $radminsuper) = $db->sql_fetchrow($result);
if ($radminsuper!=1) {
    echo "Acc&egrave;s refus&eacute;";
}
$zetheme=get_theme();
$urlofimages="images/sommaire";
//$urlofimages="themes/$zetheme/images/sommaire";

?>
<script language="Javascript">
	function sommaireadminshowhide(zenom, numero) {
		if (numero==1) {
			document.getElementById(zenom).style.display='';
		}
		else if (numero==0) {
			document.getElementById(zenom).style.display='none';
	 	}
	 }
	function sommairechangecatimgnew(zeimage) {
		var reg= new RegExp("<?php echo "$urlofimages";?>/admin/new.gif","gi");
		if (reg.test(zeimage.src)) {zeimage.src="<?php echo "$urlofimages";?>/admin/new_gray.gif";}
		else {zeimage.src="<?php echo "$urlofimages";?>/admin/new.gif";}
	}
<?php//cette fonction permet de masquer les input box de l'url externe et du texte de l'url.?>
	function disab (cetobjet,valeur,formlink,formlinktext,linkvaleur,linktextvaleur) {
			if (valeur=='SEP') {
				cetobjet.selectedIndex=0;
			}
			if (valeur=='Lien externe') {
				 formlink.disabled=false;
				 if (linkvaleur=='') {
					 formlink.value="http://";
					 formlinktext.value="";
				 }
				 else {
					 formlink.value=linkvaleur;
					 formlinktext.value=linktextvaleur;
				 }
				 formlinktext.disabled=false;
				 formlink.style.backgroundColor="#FFFFFF";
				 formlink.style.borderStyle="solid";
				 formlinktext.style.backgroundColor="#FFFFFF";
				 formlinktext.style.borderStyle="solid";
			}
			else {
			 formlink.disabled=true;
			 formlink.value="";
			 formlink.style.backgroundColor="<?php echo $bgcolor1;?>";
			 formlink.style.borderStyle="none";
			 formlinktext.disabled=true;
			 formlinktext.value="";
			 formlinktext.style.backgroundColor="<?php echo $bgcolor1;?>";
			 formlinktext.style.borderStyle="none";
			}
		}
<?php // permet d'afficher ou non l'image correspondant au 'target_blank' pour le lien consid�r�?>
	function targetblank(pointeur,valeur) {
		testehttp = valeur.slice(0,7 );
		testeftp = valeur.slice(0,6);
		http='http://';
		ftp='ftp://';
		if(testehttp == http || testeftp == ftp) {
			pointeur.src="<?php echo "$urlofimages";?>/admin/targetblank.gif";
			pointeur.alt="<?php echo""._SOMTARGETBLANK.""?>";
			pointeur.title="<?php echo""._SOMTARGETBLANK.""?>";
		}
		else {
			pointeur.src="<?php echo "$urlofimages";?>/admin/targetnone.gif";
			pointeur.alt="<?php echo""._SOMTARGETNONE.""?>";
			pointeur.title="<?php echo""._SOMTARGETNONE.""?>";
		}
	}
<?php // on va v�rifier que la valeur de poids est correcte (fonction appel�e quand on change la valeur du poids)?>
	function check_numeric (my_element, old_value) {
		var text_value = my_element.value;
		if (text_value.length >0) {
			if (isNaN(text_value)) {
				alert ("<?php echo ""._SOMMSGNOTNUM."";?>");
				my_element.value = old_value;
			}
		}
		else {
			alert ("<?php echo ""._SOMMSGVOID.""?>");
			my_element.value = old_value;
		}
	}
<?php // Fonction permettant d'afficher le popup pour les options suppl�mentaires?>
	function envoiedit(keysommaire, z) {
		var reg= new RegExp("[&]","gi");
		var seg= new RegExp("[\?]","gi");
		var modulename = document.forms.form_sommaire.elements["sommaireformingroup["+keysommaire+"]["+z+"]"].value;		
		var lienname = document.forms.form_sommaire.elements["sommaireformmodulelinktext["+keysommaire+"]["+z+"]"].value;
		lienname = lienname.replace(reg,"[SOMSYMBOLEet]");
		lienname = lienname.replace(seg,"[SOMSYMBOLEinterro]");
		var image = document.forms.form_sommaire.elements["sommaireformmoduleimage["+keysommaire+"]["+z+"]"].value;
		//var lienlien = document.forms.form_sommaire.elements["sommaireformmodulelink["+keysommaire+"]["+z+"]"].value;
		//var gras = document.forms.form_sommaire.elements["sommaireformmodulegras["+keysommaire+"]["+z+"]"].value;
		//var new = document.forms.form_sommaire.elements["sommaireformmodulenew["+keysommaire+"]["+z+"]"].value;
		var catname = document.forms.form_sommaire.elements["sommaireformname["+keysommaire+"]"].value;
		catname = catname.replace(reg,"[SOMSYMBOLEet]");
		catname = catname.replace(seg,"[SOMSYMBOLEinterro]");
		var catimage = document.forms.form_sommaire.elements["sommaireformimage["+keysommaire+"]"].value;
		var categoryclass = document.forms.form_sommaire.elements["sommaireformeachcategoryclass["+keysommaire+"]"].value;
		var lienclass = document.forms.form_sommaire.elements["sommaireformmoduleclass["+keysommaire+"]["+z+"]"].value;
		var new_days = document.forms.form_sommaire.elements["sommaireformmodulenew_days["+keysommaire+"]["+z+"]"].value;
		var zeurl="admin.php?op=sommaire&go=edit&modulename="+modulename+"&lienname="+lienname+"&image="+image+"&catname="+catname+"&catimage="+catimage+"&categoryclass="+categoryclass+"&lienclass="+lienclass+"&new_days="+new_days+"&keysommaire="+keysommaire+"&z="+z;
		window.open(zeurl,'sommaire_editlink','location=no, width=600, height=250, menubar=no, status=no, scrollbars=no, menubar=no');
		//alert(zeurl);
	}
</script>
<?php


$zetheme=get_theme();

function index() {

global $db, $sql, $prefix, $bgcolor1, $bgcolor2, $bgcolor3, $bgcolor4, $textcolor1, $keysommaire, $deletecat, $upgrade_test, $urlofimages; 

include("header.php"); 
GraphicAdmin();
OpenTable(); 

//on va regarder tous les fichiers dans /images/sommaire pour en faire la liste
	$handle=@opendir("$urlofimages"); 
	$compteur=0;
	while ($tempo = @readdir($handle)) {
		$file[$compteur]= $tempo;
		$compteur++;
	}
	@closedir($handle);
// --> OK, la liste des fichiers est dans $file (utile plus bas pour faire la liste d�roulante des images).

//on va regarder tous les fichiers dans /images/sommaire/categories pour en faire la liste
	$handle=@opendir("$urlofimages/categories"); 
	$compteur=0;
	while ($tempo = @readdir($handle)) {
		$file2[$compteur]= $tempo;
		$compteur++;
	}
	@closedir($handle);
// --> OK, la liste des fichiers est dans $file2 (utile plus bas pour faire la liste d�roulante des images des modules).


// on va mettre la liste des modules dans la variable $modules
$sql = "SELECT title FROM ".$prefix."_modules ORDER BY title ASC";
$modulesaffiche= $db->sql_query($sql);
$compteur=0;
while ($tempo = $db->sql_fetchrow($modulesaffiche)) {
	$modules[$compteur]= $tempo['title'];
	$compteur++;
}

// on va mettre les donn�es de la table nuke_sommaire_categories dans les variables ad�quates.
	$sql2= "SELECT id, groupmenu, module, url, url_text, image, new, new_days, class, bold FROM ".$prefix."_sommaire_categories ORDER BY id ASC";
	$result2= $db->sql_query($sql2);
	
	$compteur=0;
	$row2=$db->sql_fetchrow($result2); //on r�cup�re la premi�re ligne de la table, et on affecte aux variables.
	$categorie=$row2['groupmenu'];
	$moduleinthisgroup[$categorie][$compteur]=$row2['module'];
	$linkinthisgroup[$categorie][$compteur]=$row2['url'];
	$linktextinthisgroup[$categorie][$compteur]=$row2['url_text'];
	$imageinthisgroup[$categorie][$compteur]=$row2['image'];
	$newinthisgroup[$categorie][$compteur]=$row2['new'];
	$new_days=$new_daysinthisgroup[$categorie][$compteur]=$row2['new_days'];
	$firstclass=$classofthismodule[$categorie][$compteur]=$row2['class'];
	$grasofthismodule[$categorie][$compteur]=$row2['bold'];
	$idofthismodule[$categorie][$compteur]=$row2['id'];
	$compteur2=$categorie; 
//		echo "{$moduleinthisgroup[$categorie][$compteur]}<br>{$linkinthisgroup[$categorie][$compteur]}<br>{$linktextinthisgroup[$categorie][$compteur]}<br>{$imageinthisgroup[$categorie][$compteur]}<br>";
	
	while ($row2 = $db->sql_fetchrow($result2)) { //ensuite on fait la m�me chose pour toutes les autres lignes.
		$categorie=$row2['groupmenu'];
		if ($compteur2==$categorie) { //permet de savoir si on a chang� de cat�gorie (groupmenu diff�rent) : dans ce cas on remet le 2�me compteur � 0.
			$compteur++;
		}
		else {
			$compteur=0;
		}
		$moduleinthisgroup[$categorie][$compteur]=$row2['module'];
		$linkinthisgroup[$categorie][$compteur]=$row2['url'];
		$linktextinthisgroup[$categorie][$compteur]=$row2['url_text'];
		$imageinthisgroup[$categorie][$compteur]=$row2['image'];
		$newinthisgroup[$categorie][$compteur]=$row2['new'];
		$new_daysinthisgroup[$categorie][$compteur]=$row2['new_days'];
		$classofthismodule[$categorie][$compteur]=$row2['class'];
		$grasofthismodule[$categorie][$compteur]=$row2['bold'];
		$idofthismodule[$categorie][$compteur]=$row2['id'];
		$compteur2=$categorie;
//		echo "{$moduleinthisgroup[$categorie][$compteur]}<br>{$linkinthisgroup[$categorie][$compteur]}<br>{$linktextinthisgroup[$categorie][$compteur]}<br>{$imageinthisgroup[$categorie][$compteur]}<br>";
	}
// --> OK, les variables ont pris la valeur ad�quate de la table nuke_sommaire_categories


echo "<div align=\"center\" class=\"title\">"._SOMADMINTITLE."</div>";
CloseTable();
echo"<br>";
OpenTable();
echo "<head><style type=\"text/css\">"
.".texte 	{ COLOR: $textcolor1; FONT-SIZE: 10px; FONT-FAMILY: Verdana, Helvetica}"
.".red {COLOR: #FF0000; FONT-SIZE: 10px; FONT-FAMILY: Verdana, Helvetica; FONT-WEIGHT: bold}"
."INPUT 		{BORDER-TOP-COLOR: #000000; BORDER-LEFT-COLOR: #000000; BORDER-RIGHT-COLOR: #000000; BORDER-BOTTOM-COLOR: #000000; BORDER-TOP-WIDTH: 1px; BORDER-LEFT-WIDTH: 1px; FONT-SIZE: 10px; BORDER-BOTTOM-WIDTH: 1px; FONT-FAMILY: Verdana,Helvetica; BORDER-RIGHT-WIDTH: 1px}"
.".disabled { background-color: $bgcolor1; border-style: none}"
."</style></head>";

// on r�cup�re la table nuke_sommaire
    $sql = "SELECT groupmenu, name, image, lien, hr, center, bgcolor, invisible, class, new, bold, listbox, dynamic FROM ".$prefix."_sommaire ORDER BY groupmenu ASC";
	$result = $db->sql_query($sql);
	if (!$result) {die("<div class=\"red\" align=\"center\" style=\"font-size:16px\"><strong><br>"._SOMNOTABLEPB."<br></strong></div>");}
	

	echo""
	."<br><div class=\"red\" align=\"center\"><br>"._SOMATTNSUPPRCAT."<br></div>";
	
	echo ""
	."<form action=\"admin.php?op=sommaire&go=send\" method=\"post\" name=\"form_sommaire\">"
	."<table align=\"center\"><tr><td colspan=\"2\">"
	."<table align=\"center\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" bordercolor=$bgcolor1><tr><td bgcolor=\"#000000\">"
	."<table width=\"720\" align=\"center\" cellspacing=\"1\" cellpadding=\"4\"  bordercolor=\"$bgcolor1\">"
	."<tr align=\"center\"><td bgcolor=\"$bgcolor2\" ><strong>"._SOMWEIGHT."</strong></td><td bgcolor=\"$bgcolor2\" ><strong>"._SOMCATEGORIES."</strong></td><td bgcolor=\"$bgcolor2\" ><strong>"._SOMACTION."</strong></td></tr>";

	
// on va afficher le tableau d'administration : une ligne pour chaque cat�gorie rentr�e dans la table, + une derni�re ligne pour ajouter une cat�gorie.
	$keysommaire=0;
	if (!$result) {echo "<tr><td colspan=4>"._SOMNOTABLEPB."</td></tr>";}
	while ($row = $db->sql_fetchrow($result)) {  // on �crit une ligne du formulaire avec les donn�es de nuke_sommaire pour chaque ligne de nuke_sommaire
		$groupmenu[$keysommaire] = $row['groupmenu'];
		$catname[$keysommaire] = $row['name'];
		$image[$keysommaire] = $row['image'];
		$lien[$keysommaire] = $row['lien'];
		$hr[$keysommaire] = $row['hr'];
		$center[$keysommaire] = $row['center'];
		$categoriebgcolor[$keysommaire] = $row['bgcolor'];
		$invisible[$keysommaire] = $row['invisible'];
		$categoryclass[$keysommaire] = $row['class'];
		$new[$keysommaire]= $row['new'];
		$bold[$keysommaire]= $row['bold'];
		$listbox[$keysommaire] = $row['listbox'];
		$dynamic[$keysommaire] = $row['dynamic'];
//		$key99=0;
		
		if ($groupmenu[$keysommaire]==99) { //quand on est � la derni�re cat�gorie de la table (99 - cat�gorie vide), on affiche une nouvelle ligne du tableau
			echo "<tr align=\"center\"><td bgcolor=\"$bgcolor1\" colspan=3><strong><br>"._SOMNEWCATEGORY."<br><br></strong></td></tr>";
			$key99=$groupmenu[$keysommaire];
			$keyadd = $groupmenu[$keysommaire-1]; // pour incr�menter : $groupmenu[$keysommaire] n'existe pas, puisque on a affich� toutes les lignes de nuke_sommaire!
			$keyadd = $keyadd+1;
			$groupmenu[$keysommaire]=$keyadd;
		}
		echo""
			."<tr align=\"center\">"
			."<td bgcolor=\"$bgcolor2\" rowspan=\"2\" >"
			."<input type=\"text\" name=\"sommaireformgroupmenu[$keysommaire]\" size=\"2\" maxlength=2 value=\"$groupmenu[$keysommaire]\" onchange='check_numeric(this,$groupmenu[$keysommaire])'><br></td>"
			."<td bgcolor=\"$bgcolor3\"><table align=\"left\" cellspacing=\"0\" cellpadding=\"0\" bgcolor=\"$bgcolor3\">";
			
			$newcolor = ( $new[$keysommaire]=="on" ) ? "new.gif" : "new_gray.gif" ;
			echo "<tr height=8><td></td></tr><tr align=\"center\"><td></td><td><strong>"._SOMCATNAME."</strong></td><td></td><td><strong>"._SOMIMGNAME."</strong></td><td colspan=2><strong>"._SOMCATLINK."</strong></td><td>&nbsp;<strong>"._SOMBOLD."</strong></td><td>&nbsp;<img id=\"somcatnew$keysommaire\" src=\"".$urlofimages."/admin/$newcolor\"></td></tr><tr height=\"8\"><td></td></tr><tr align=\"center\">";		
		echo"<input type=\"Hidden\" name=\"sommaireformkeysommaire\" value=\"$keysommaire\">" //utile pour la fonction send : on sait � quelle ligne on fait r�f�rence
			."<input type=\"Hidden\" name=\"sommaireformgroupmenu[99]\" value=\"99\">"//utile car la requ�te sql efface toutes les donn�es et n'�crit dans nuke_sommaire que les donn�es entr�es dans le formulaire.
			."<td bgcolor=\"$bgcolor3\" align=\"right\">";
		
// si l'image de cat�gorie indiqu�e dans la DB est "noimg" (--> pas d'image!), on affiche l'image 'null.gif', qui est une image transparente.
		$zeimgname = ($image[$keysommaire]=="noimg" || $image[$keysommaire]=='') ? "admin/null.gif" : $image[$keysommaire];
			echo "<img src=\"".$urlofimages."/".$zeimgname."\" name=\"catimage".$keysommaire."\">";
		
// fonction jscript permettant de changer l'image affich�e (en fonction de la valeur indiqu�e dans la listbox 'image dans cette cat�gorie')
		echo "<script language=\"Javascript\">"
			."function change".$keysommaire."(valeur) {"
			."var url=\"".$urlofimages."/\";"
			."if (valeur==\"noimg\") {"
			."valeur=\"admin/null.gif\";"
			."}"
			."document.images.catimage".$keysommaire.".src=url+valeur;"
			."}</script>"

			."&nbsp;</td>"
			."<td bgcolor=\"$bgcolor3\">"
			."<input type=\"text\" name=\"sommaireformname[$keysommaire]\" size=\"20\" maxlength=150 value=\"$catname[$keysommaire]\"></td>"
			."<td>&nbsp;</td><td bgcolor=\"$bgcolor3\">&nbsp;"
			
			."<select name=\"sommaireformimage[$keysommaire]\" onchange=\"change".$keysommaire."(this.value)\">";

			$selected = ($image[$keysommaire]=="noimg") ? "selected" : "" ;
			echo "<option value=\"noimg\" $selected>"._SOMNOIMG."</option>";

		for ($i=0;$i<count($file);$i++) { //on cr�e une entr�e dans la listbox pour chaque image pr�sente dans le r�pertoire /images/sommaire
			if ($file[$i] != "." && $file[$i] != ".." && $file[$i] != "categories" && $file[$i] != "admin") {
				if ($file[$i]==$image[$keysommaire]) {
					echo "<option value =\"$file[$i]\" selected>$file[$i]</option>";
				}
				else {
					echo "<option value =\"$file[$i]\" >$file[$i]</option>";
				}
			}
		}
		
		echo "</select></td>"
			."<td bgcolor=\"$bgcolor3\" align=\"right\">";
			
		$testehttp=strpos($lien[$keysommaire],"http://");
		$testeftp=strpos($lien[$keysommaire],"ftp://");
		$testehttps=strpos($lien[$keysommaire],"https://");
		$affichetblank = ($testehttp===0 || $testeftp===0 || $testehttps===0) ? "targetblank" : "none"; //permet d'afficher l'image "ouvrir dans une nouvelle fen�tre" si le lien commence par http:// ou ftp://
		$alttblank = ($testehttp===0 || $testeftp===0 || $testehttps===0) ? ""._SOMTARGETBLANK."" : ""._SOMTARGETNONE.""; //permet d'afficher l'image "ouvrir dans une nouvelle fen�tre" si le lien commence par http:// ou ftp://
		echo "<img src=\"".$urlofimages."/admin/".$affichetblank.".gif\" name=\"targetblank$keysommaire\" alt=\"".$alttblank."\" title=\"".$alttblank."\" width=15>";
			
		echo"&nbsp;</td><td bgcolor=\"$bgcolor3\" align=\"left\">"
		."<input type=\"text\" name=\"sommaireformlien[$keysommaire]\" size=\"20\" value=\"$lien[$keysommaire]\" onchange='targetblank(document.images.targetblank$keysommaire,this.value)'></td>";
		
		$checked = ( $bold[$keysommaire]<>"" ) ? "checked" : "" ;//on coche la case par d�faut si c'est indiqu� dans la DB
		echo "<td><input type=\"checkbox\" name=\"sommaireformbold[$keysommaire]\" $checked></td>";
		$checked = ( $new[$keysommaire]<>"" ) ? "checked" : "" ;
		echo "<td><input type=\"checkbox\" name=\"sommaireformnew[$keysommaire]\" $checked onchange=\"sommairechangecatimgnew(document.images['somcatnew$keysommaire'])\"></td>"
		."</tr>"
		."<tr height=8><td></td></tr><tr><td bgcolor=\"$bgcolor3\" align=\"left\" colspan=10><strong>"._SOMMISEENPAGE."</strong>&nbsp;:&nbsp;"; //v2.1 colspan was 6
		$checked = ($hr[$keysommaire]=="on") ? "checked" : "" ;
		echo "<input type=\"checkbox\" name=\"sommaireformhr[$keysommaire]\" $checked>&nbsp;"._SOMHR."&nbsp;&nbsp;&nbsp;";
		$checked = ($center[$keysommaire]=="on") ? "checked" : "" ;
		echo "<input type=\"checkbox\" name=\"sommaireformcenter[$keysommaire]\" $checked>&nbsp;"._SOMCENTER."&nbsp;&nbsp;&nbsp;";
		$checked = ($listbox[$keysommaire]=="on") ? "checked" : "" ;
		echo "<input type=\"checkbox\" name=\"sommaireformlistbox[$keysommaire]\" $checked>&nbsp;"._SOMLISTBOX."&nbsp;&nbsp;&nbsp;";
		echo "<input type=\"text\" name=\"sommaireformbgcolor[$keysommaire]\" size=8 value=\"$categoriebgcolor[$keysommaire]\">&nbsp;"._SOMBGCOLOR."&nbsp;&nbsp;&nbsp;</td>"
			."</tr><tr height=8><td></td></tr></table></td>"
			."<td bgcolor=\"$bgcolor2\" rowspan=2>";
		if ($key99<>99){
			echo"<div class=\"red\"><a href=\"admin.php?op=sommaire&go=deletecat&deletecat=$groupmenu[$keysommaire]&catname=$catname[$keysommaire]\" title=\""._SOMSUPPR."\" onclick=\"if (confirm('"._SOMJSSAVEBEFORE."')) {document.forms.form_sommaire.submit();};\"><img src=\"".$urlofimages."/admin/trash.gif\" border=0></a></div>";
		}	
		echo "</td>"
			."</tr><tr><td bgcolor=\"$bgcolor1\" >";
		
// maintentant, on va afficher les modules inscrits dans la cat�gorie actuelle
		
// combien y a-t-il de modules dans cette cat�gorie ?
		$nbmodules = $nombremodules = count($moduleinthisgroup[$groupmenu[$keysommaire]]);
		$nombremodules=$nombremodules+5; // on en ajoute 5, qui vont �tre vides
		
		echo "<table align=\"center\"><td></td><td align =\"center\">"._SOMCATCONTENT."</td><td width=\"3\"></td><td align=\"center\">"._SOMLINKURL."</td><td width=\"3\"></td><td align=\"center\">"._SOMLINKTEXT."</td><td width=\"3\"></td><td align=\"center\">"._SOMIMAGE."</td><td align=\"center\">"._SOMBOLD."</td><td></td></tr>";
		echo "<tr><td colspan=10 height=4></td></tr>";
		
		for ($z=0;$z<$nombremodules;$z++) {
			$formpointeur=$keysommaire."_".$z."";
			
			// permet d'afficher le middot pour les champs vides ajout�s (quand nombremodules a �t� augment� de 1 ou 2)
			if ($imageinthisgroup[$groupmenu[$keysommaire]][$z]=='' || $imageinthisgroup[$groupmenu[$keysommaire]][$z]=='middot.gif') {
				$afficheimageinthiscategorie="admin/middot.gif";
			}
			else {
				$afficheimageinthiscategorie="categories/".$imageinthisgroup[$groupmenu[$keysommaire]][$z];
			}
			echo "<tr id=\"span$formpointeur\"><td valign=\"center\"><img src=\"".$urlofimages."/$afficheimageinthiscategorie\" name=\"image$formpointeur\">"
				// on va changer l'image affich�e devant le nom du module...
				."<script language=\"Javascript\">"
				."function changeimage$formpointeur(cedoc,valeur) {"
					."if (valeur==\"middot.gif\") {"
					."url =\"".$urlofimages."/admin/\";"
					."}"
					."else {"
					."var url=\"".$urlofimages."/categories/\";"
					."}"
					."document.images.image$formpointeur.src=url+valeur;"
				."}"
				."</script>";

			echo "</span></td><td align=\"center\">";
	// ces 2 variables vont servir � envoyer � la fonction jscript 'disab' la valeur de l'url et de son texte.
			$linkvalue=$linkinthisgroup[$groupmenu[$keysommaire]][$z];
			$linktextvalue=$linktextinthisgroup[$groupmenu[$keysommaire]][$z];

//echo "{$moduleinthisgroup[$groupmenu[$keysommaire]][$z]}<br>";
$zz=$z+1;

if ($z==$nombremodules-1) { // si on est � la derni�re listbox, on affiche le message demandant d'envoyer les modifs.
	$hideok =  1;
	$sommairezenom = "sommairespan$keysommaire";
}
else {
	$hideok =  1;
	$sommairezenom = "span".$keysommaire."_".$zz."";
}
	// si on s�lectionne 'Lien externe' dans la liste des modules, cela va afficher les inputbox.
			echo "<select name=\"sommaireformingroup[$keysommaire][$z]\" onchange='disab(this,this.value,this.form.elements[\"sommaireformmodulelink[$keysommaire][$z]\"],this.form.elements[\"sommaireformmodulelinktext[$keysommaire][$z]\"],\"$linkvalue\",\"$linktextvalue\"); sommaireadminshowhide(\"$sommairezenom\",$hideok)'>";
			echo "<option value=\"Aucun\">";
			$selected = ($moduleinthisgroup[$groupmenu[$keysommaire]][$z]=="SOMMAIRE_HR") ? "selected" : "" ;
			echo "<option value=\"SOMMAIRE_HR\" $selected>*"._SOMMAIREHR."*";
			$selected = ($moduleinthisgroup[$groupmenu[$keysommaire]][$z]=="Lien externe") ? "selected" : "" ;
			echo "<option value=\"Lien externe\" $selected>*"._SOMEXTLINK."*";
			echo "<option value=\"SEP\">������������������";
			for ($i=0;$i<count($modules);$i++) {
				$selected = ($modules[$i]==$moduleinthisgroup[$groupmenu[$keysommaire]][$z]) ? "selected" : "" ;
				echo "<option value=\"$modules[$i]\" $selected>$modules[$i]";
				//echo"{$moduleinthisgroup[$groupmenu[$keysommaire]][$z]}<br>";
			}
			echo "</select></td>";
			//echo "<td></td>";
			
			if ($moduleinthisgroup[$groupmenu[$keysommaire]][$z]=="Lien externe") { // si 'Lien externe' est indiqu� dans la DB, on affiche les inputbox, sinon on les masque par d�faut
				echo "<td align=\"center\">";
				$testehttp=strpos($linkinthisgroup[$groupmenu[$keysommaire]][$z],"http://");
				$testeftp=strpos($linkinthisgroup[$groupmenu[$keysommaire]][$z],"ftp://");
				$testehttps=strpos($linkinthisgroup[$groupmenu[$keysommaire]][$z],"https://");
				if ($testehttp===0 || $testeftp===0 || $testehttps===0) { //permet d'afficher l'image "ouvrir dans une nouvelle fen�tre" si le lien commence par http:// ou ftp://
					echo "<img src=\"".$urlofimages."/admin/targetblank.gif\" name=\"targetblank$formpointeur\" alt=\""._SOMTARGETBLANK."\" title=\""._SOMTARGETBLANK."\">";
				}
				else {// si le lien ne commence pas par http ou ftp, on met l'image targetnone.gif
					echo "<img src=\"".$urlofimages."/admin/targetnone.gif\" name=\"targetblank$formpointeur\" alt=\""._SOMTARGETNONE."\" title=\""._SOMTARGETNONE."\">";
				}
				echo "</td><td align=\"center\">"
				."<input type=\"text\" name=\"sommaireformmodulelink[$keysommaire][$z]\" value=\"".$linkinthisgroup[$groupmenu[$keysommaire]][$z]."\" size=20 onChange='targetblank(document.images.targetblank$formpointeur,this.value)'>"
				."</td><td></td><td>"
				."<input type=\"text\" name=\"sommaireformmodulelinktext[$keysommaire][$z]\" size=15 value=\"".$linktextinthisgroup[$groupmenu[$keysommaire]][$z]."\" ></td>";
			}

			else { // si "Lien externe" n'est pas s�lectionn� par d�faut
				echo"<td><img src=\"".$urlofimages."/admin/none.gif\" name=\"targetblank$formpointeur\" alt=\"\" title=\"\"></td>";
				echo"<td align=\"center\">"
				."<input type=\"text\" class=\"disabled\" name=\"sommaireformmodulelink[$keysommaire][$z]\" value=\"".$linkinthisgroup[$groupmenu[$keysommaire]][$z]."\" size=20 disabled onChange='targetblank(document.images.targetblank$formpointeur,this.value)' >"
				."</td><td></td><td>"
				."<input type=\"text\" class=\"disabled\" name=\"sommaireformmodulelinktext[$keysommaire][$z]\" size=15 disabled value=\"".$linktextinthisgroup[$groupmenu[$keysommaire]][$z]."\"></td>";
			}

//echo"{$linkinthisgroup[$groupmenu[$keysommaire]][$z]}<br>{$linktextinthisgroup[$groupmenu[$keysommaire]][$z]}<br>";

			echo "<td></td><td align=\"center\">"
				."<select name=\"sommaireformmoduleimage[$keysommaire][$z]\" onChange='changeimage$formpointeur(this.document,this.value)'>"
				."<option value='middot.gif' >"._SOMNOIMG." ( <strong>&middot;</strong> )</option>";
			for ($i=0;$i<count($file2);$i++) {
				if ($file2[$i] != "." && $file2[$i] != "..") {
					if ($file2[$i]==$imageinthisgroup[$groupmenu[$keysommaire]][$z]) {
						echo "<option value =\"$file2[$i]\" selected>$file2[$i]</option>";
					}
					else {
						echo "<option value =\"$file2[$i]\" >$file2[$i]</option>";
					}
				}
			}
			echo "</select></td>";
			
//echo "{$imageinthisgroup[$groupmenu[$keysommaire]][$z]}<br>";

		$checked = ( $grasofthismodule[$groupmenu[$keysommaire]][$z]<>"" ) ? "checked" : "" ;
		echo "<td align=\"center\"><input type=\"checkbox\" name=\"sommaireformmodulegras[$keysommaire][$z]\" $checked></td>";
		$checked = ( $newinthisgroup[$groupmenu[$keysommaire]][$z]<>"" ) ? "checked" : "" ;
		$colornew = ($checked=="checked") ? "new" : "new_gray";
		echo "<td align=\"center\"><input type=\"checkbox\" name=\"sommaireformmodulenew[$keysommaire][$z]\" $checked onchange=\"sommairechangecatimgnew(document.images['somnew$formpointeur'])\"><img name=\"somnew$formpointeur\" src=\"".$urlofimages."/admin/$colornew.gif\"></td>";
		echo "<td>";
		if ($z<$nbmodules) {
	//		echo "[<a href='javascript:envoiedit(document.forms.form_sommaire.elements[\"sommaireformingroup[".$keysommaire."][".$z."]\"].value,\"b\",\"c\",\"d\",\"e\",\"f\",\"g\")' title=\"More options\">+</a>]";
	//		echo "[<a href='javascript:envoiedit(document.forms.form_sommaire.elements[\"sommaireformingroup[".$keysommaire."][".$z."]\"].value, document.forms.form_sommaire.elements[\"sommaireformmodulelink[".$keysommaire."][".$z."]\"].value, document.forms.form_sommaire.elements[\"sommaireformmodulelinktext[".$keysommaire."][".$z."]\"].value, document.forms.form_sommaire.elements[\"sommaireformmoduleimage[".$keysommaire."][".$z."]\"].value, document.forms.form_sommaire.elements[\"sommaireformmodulegras[".$keysommaire."][".$z."]\"].value, document.forms.form_sommaire.elements[\"sommaireformmodulenew[".$keysommaire."][".$z."]\"].value, ".$idofthismodule[$groupmenu[$keysommaire]][$z].",\"".$catname[$keysommaire]."\", document.forms.form_sommaire.elements[\"sommaireformimage[".$keysommaire."]\"].value, \"".$groupmenu[$keysommaire]."\", ".$keysommaire.", ".$z.")' title=\""._SOMMOREOPTIONS."\">+</a>]";
			echo "[<a href='javascript:envoiedit(".$keysommaire.", ".$z.")' title=\""._SOMMOREOPTIONS."\">+</a>]";
		}
		echo "</td>";
		echo "</tr>";

		if ($z>$nbmodules) { // pour n'afficher qu'une seul liste d�roulante vide, on cache les autres.
			echo "<script language=\"JavaScript\">"
			."sommaireadminshowhide(\"span$formpointeur\",0);"
			." </script>";
			}
	
	$inputmoduleclass = ($classofthismodule[$keysommaire][$z]=="") ? $firstclass : $classofthismodule[$keysommaire][$z];
	echo "<input type=\"hidden\" name=\"sommaireformmoduleclass[$keysommaire][$z]\" value=\"".$inputmoduleclass."\">";
	$inputnewdays= ($new_daysinthisgroup[$keysommaire][$z]=="") ? $new_days : $new_daysinthisgroup[$keysommaire][$z];
	echo "<input type=\"hidden\" name=\"sommaireformmodulenew_days[$keysommaire][$z]\" value=\"".$inputnewdays."\">";
	
	//echo "<br>{$new_daysinthisgroup[$keysommaire][$z]}<br>";
	
	} //end for : on a affich� tous les modules/liens de cette cat�gorie

	echo "<tr id=\"sommairespan$keysommaire\"><td></td><td colspan=8>"._SOMSENDTOHAVEMORE."</td></tr>";//affiche le message demandant d'envoyer les modifs.
	echo "</table>";
	echo"</td></tr>";
	
	echo "<script language=\"JavaScript\">"
	."sommaireadminshowhide(\"sommairespan$keysommaire\",0);"
	." </script>";

	
	echo "<input type=\"hidden\" name=\"sommaireformeachcategoryclass[$keysommaire]\" value=\"$categoryclass[$keysommaire]\">";
	
	$keysommaire++;	
} //end while : on a affich� toutes les cat�gories.


$radio1=($invisible[0]==1) ? "checked" : "";
$radio2=($invisible[0]==2 || $invisible[0]==4) ? "checked" : ""; //gestion des groupes : si 4==>icone 'interdit' avec gestion groupes
$radio3=($invisible[0]==3 || $invisible[0]==5) ? "checked" : "";//gestion des groupes : si 5==>modules invisibles avec gestion groupes

$radionew=($new_days==-1) ? "" : "checked";
$disablenewdays=($new_days==-1) ? "disabled" : "";
$new_days_value = ($new_days==-1) ? "" : $new_days;

$checkdynamic = ($dynamic[0]=="on") ? "checked" : "" ;

	echo "</table></td></tr></table>"
		."<br></td></tr>"
		."<tr><td colspan=\"2\"><br><div  align=\"center\"><strong>"._SOMGENERALOPTIONS." :</strong></div><br><br>"
		."<table cellpadding=\"0\" cellspacing=\"0\" align=\"center\"><tr><td><strong>"._SOMDISPLAYMEMBERSONLYMODULES." :</strong></td><td width=\"50\"></td><td><strong>"._SOMDISPLAYCLASSES."</strong></td></tr>"
		."<tr><td><input type=\"radio\" name=\"sommaireformradio\" value=\"1\" $radio1>"._SOMDISPLAYMODULENORMAL."</td>"
		."<td></td><td><input type=\"text\" name=\"sommaireformclass\" size=\"15\" value=\"$categoryclass[0]\">&nbsp;"._SOMCATEGORIESCLASS."</td></tr>"
		."<tr><td><input type=\"radio\" name=\"sommaireformradio\" value=\"2\" $radio2>"._SOMDISPLAYMODULEWITHICON." <img src=\"".$urlofimages."/admin/interdit.gif\"> "._SOMDISPLAYMODULEWITHICONFORVISTORS."</td>"
		."<td></td><td><input type=\"text\" name=\"sommaireformclassformodules\" size=\"15\" value=\"".$firstclass."\">&nbsp;"._SOMMODULESCLASS."</td></tr>"
		."<tr><td><input type=\"radio\" name=\"sommaireformradio\" value=\"3\" $radio3>"._SOMDISPLAYMODULEINVISIBLE."</td></tr>"
		."<tr><td colspan=3><input type=\"checkbox\" name=\"sommaireformnew_type\" $radionew onchange='if (this.form.elements[\"sommaireformnew_days\"].disabled==true){this.form.elements[\"sommaireformnew_days\"].disabled=false;}else{this.form.elements[\"sommaireformnew_days\"].disabled=true;}'><strong>"._SOMAUTODETECTNEW."</strong>&nbsp;("._SOMSINCE." <input type=\"text\" name=\"sommaireformnew_days\" value=\"".$new_days_value."\" size=2 $disablenewdays> "._SOMNBDAYS.")"
		."<input type=\"hidden\" name=\"sommaireformfirstnew_days\" value=\"".$new_days."\"><input type=\"hidden\" name=\"sommaireformfirstclass\" value=\"".$firstclass."\"></td></tr>"
		."<tr><td colspan=3><input type=\"checkbox\" name=\"sommaireformdynamic\" $checkdynamic><strong>"._SOMDYNAMICMENU."</strong><br><br></td></tr></table></td></tr>"
		."<tr><td width=\"50%\" align=\"center\"><input type='reset' value=\""._SOMCANCEL."\"></td><td width=\"50%\" align=\"center\"><input type=\"submit\" value=\""._SOMPOST."\"></td></tr>"
		."</table>"
		."</form>";
	
	echo""
		."<br><br>"._SOMREMARKS.""._SOMMAIREREMARKSTWO.""
		."<br><div align=\"center\"><a href=\"http://marcoledingue.free.fr/modules.php?name=Content&pa=list_pages_categories&cid=1\" style=\"FONT-SIZE:16px\" target=\"_blank\"><strong>FAQ</strong></a><br><br>version 2.1.1 - &copy; <a href=\"mailto:marcoledingue@free.fr?body=Read the FAQ before asking me questions!!\">marcoledingue</a></div>";
		
	CloseTable(); 
	include("footer.php");
}


function send() { // fonction appel�e quand on clique 'OK' sur le formulaire
	global $sommaireformkeysommaire, $sommaireformgroupmenu, $sommaireformname, $sommaireformimage, $sommaireformlien, $sommaireformingroup, $sommaireformmoduleimage, $sommaireformmodulelink, $sommaireformmodulelinktext, $sommaireformcenter, $sommaireformhr, $sommaireformbgcolor,$sommaireformradio, $sommaireformclass, $sommaireformbold, $sommaireformnew , $sommaireformlistbox, $sommaireformeachcategoryclass, $sommaireformmodulegras, $sommaireformmodulenew, $sommaireformnew_type, $sommaireformnew_days, $sommaireformmodulenew_days, $sommaireformfirstnew_days, $sommaireformmoduleclass, $sommaireformclassformodules, $sommaireformfirstclass, $sommaireformdynamic, $db, $prefix, $sql;
//	global $sommaireformmoduleimage0_0, $sommaireformmoduleimage0_1, $sommaireformmoduleimage0_2, $sommaireformmoduleimage1_0, $sommaireformmoduleimage1_1, $sommaireformmoduleimage1_2;
	$sommaireformnew_days=($sommaireformnew_type=="on") ? $sommaireformnew_days : "-1" ;
	
 //si les valeurs de 'groupmenu' (Poids) entr�es dans le formulaire ne sont pas des nombres de 0 � 98, --> die
	for ($i=0; $i<=$sommaireformkeysommaire; $i++) {
		if ((!ereg("([0-9]{1,2})",$sommaireformgroupmenu[$i])) OR ($sommaireformgroupmenu[$i]==99)) {
			include("header.php");
			GraphicAdmin();
			OpenTable();
			echo"<div align=\"center\">";
			echo ""._SOMINVALIDWEIGHT."&nbsp;'$sommaireformname[$i]'&nbsp;($sommaireformgroupmenu[$i])";
			echo "<br>"._SOMMUSTBENUM."";
			echo "</div>";
			CloseTable();
			include("footer.php");
			return;
		}
	 // si 2 cat�gories ont le m�me groupmenu (poids) --> die
		for($j=0; $j<=$sommaireformkeysommaire; $j++) {
			if ($i<>$j) {
				if ($sommaireformgroupmenu[$i]==$sommaireformgroupmenu[$j]) {
					include("header.php");
					GraphicAdmin();
					OpenTable();
					echo"<div align=\"center\">";
					echo ""._SOMCATS."&nbsp;'$sommaireformname[$i]'&nbsp;"._SOMAND."&nbsp;'$sommaireformname[$j]'&nbsp;"._SOMSAMEWEIGHT."&nbsp;($sommaireformgroupmenu[$i])";
					echo "<br>"._SOMMODIFWEIGHT."";
					echo "<br>NB :&nbsp;"._SOMMUSTBENUM."";
					echo "</div>";
					CloseTable();
					include("footer.php");
					return;
				}
			}
		}
	}
	
// sinon, on ins�re les donn�es dans les tables nuke_sommaire et nuke_sommaire_categories.
// d'abord, on va effacer les donn�es de ces 2 tables !
	$db->sql_query("DELETE FROM ".$prefix."_sommaire");
	$db->sql_query("DELETE FROM ".$prefix."_sommaire_categories");

//d�tection de nuke v.7 : y a-t-il une gestion des groupes?
global $user_prefix;
$sql="SELECT * FROM ".$prefix."_modules LIMIT 1";
$result=$db->sql_query($sql);
$row=$db->sql_fetchrow($result);
echo Mysql_error();
if(isset($row['mod_group'])){
	$sql2="SELECT * FROM ".$user_prefix."_users LIMIT 1";
	$result2=$db->sql_query($sql2);
	$row2=$db->sql_fetchrow($result2);
	echo Mysql_error();
	$gestiongroupe=(isset($row2['points'])) ? 1 : 0 ;
}
else {
	$gestiongroupe=0;
}

// � chaque ligne du formulaire, on fait une requ�te pour ins�rer les donn�es.
	for ($i=0; $i<=$sommaireformkeysommaire; $i++) {
		for ($j=0; $j<count($sommaireformingroup[$i]); $j++) {
			$zeclass = ($sommaireformfirstclass != $sommaireformclassformodules) ? $sommaireformclassformodules : $sommaireformmoduleclass[$i][$j] ;
			$zeclass = ($zeclass=="") ? $sommaireformclassformodules : $zeclass ; //si la classe est vide, alors on remplit avec la classe par d�faut.
			$zenew_days = ($sommaireformfirstnew_days != $sommaireformnew_days) ? $sommaireformnew_days : $sommaireformmodulenew_days[$i][$j] ;//si on n'a pas chang� le nb jours dans l'admin, on recopie les valeurs pr�c�dentes.
			$zenew_days = ($zenew_days=="") ? $sommaireformnew_days : $zenew_days ; //si le nb de jour est vide, alors on remplit avec le nb de jours par d�faut.
			if ($sommaireformingroup[$i][$j] =="Lien externe") { //si il y a un lien, on ins�re les donn�es du lien
				$sql="INSERT INTO ".$prefix."_sommaire_categories (groupmenu, module, url, url_text, image, new, new_days, class, bold) VALUES ('$sommaireformgroupmenu[$i]', '".$sommaireformingroup[$i][$j]."', '".$sommaireformmodulelink[$i][$j]."', '".$sommaireformmodulelinktext[$i][$j]."', '".$sommaireformmoduleimage[$i][$j]."', '".$sommaireformmodulenew[$i][$j]."', '".$zenew_days."', '".$zeclass."', '".$sommaireformmodulegras[$i][$j]."')";
				$db->sql_query($sql);
				echo (MySql_error());
			}
			elseif ($sommaireformingroup[$i][$j] =="SOMMAIRE_HR") { 
				$sql="INSERT INTO ".$prefix."_sommaire_categories (groupmenu, module, url, url_text, image, new, new_days, class, bold) VALUES ('$sommaireformgroupmenu[$i]', '".$sommaireformingroup[$i][$j]."', '', '' , '', '".$sommaireformmodulenew[$i][$j]."', '".$zenew_days."',  '".$zeclass."', '".$sommaireformmodulegras[$i][$j]."')";
				$db->sql_query($sql);
				echo (MySql_error());
			}
			else if ($sommaireformingroup[$i][$j] !="Aucun") { //sinon, (si il y a un module) on ins�re le nom du module, et pas de lien.
				$sql="INSERT INTO ".$prefix."_sommaire_categories (groupmenu, module, url, url_text, image, new, new_days, class, bold) VALUES ('$sommaireformgroupmenu[$i]', '".$sommaireformingroup[$i][$j]."', '', '' , '".$sommaireformmoduleimage[$i][$j]."', '".$sommaireformmodulenew[$i][$j]."', '".$zenew_days."',  '".$zeclass."', '".$sommaireformmodulegras[$i][$j]."')";
				$db->sql_query($sql);
				echo (MySql_error());
			}
		// --> si 'Aucun' est s�lectionn� dans les modules, on n'ins�re aucune donn�e !
		}
		
// si la cat�gorie ne contient aucune donn�e (compl�tement vide), alors on ne l'ins�re pas dans la DB.
		if ($sommaireformname[$i]=='' && $sommaireformimage[$i]=="noimg" && $sommaireformlien[$i]=='' && $sommaireformhr[$i]=='' && $sommaireformcenter[$i]=='' && $sommaireformbgcolor[$i]=='') {
		
		}
		else {
			$zeclass = ($sommaireformeachcategoryclass[0]!=$sommaireformclass) ? $sommaireformclass : $sommaireformeachcategoryclass[$i] ;// si la class a �t� chang�e via l'admin, on indique cette classe pour toutes les cat�gories, sinon on recopie le nom de la classe utilis�e auparavant.
			$zeclass = ($zeclass=="") ? $sommaireformclass : $zeclass ; //si la classe est vide, alors on remplit avec la classe par d�faut.
			if ($gestiongroupe==1 && $sommaireformradio==2) {
				$invisible=4;
			}
			elseif ($gestiongroupe==1 && $sommaireformradio==3) {
				$invisible=5;
			}
			else {
				$invisible=$sommaireformradio;
			}
			
			$sql="INSERT INTO ".$prefix."_sommaire VALUES ('$sommaireformgroupmenu[$i]', '$sommaireformname[$i]', '$sommaireformimage[$i]', '$sommaireformlien[$i]', '$sommaireformhr[$i]', '$sommaireformcenter[$i]', '$sommaireformbgcolor[$i]', '$invisible', '$zeclass', '$sommaireformbold[$i]', '$sommaireformnew[$i]', '$sommaireformlistbox[$i]', '$sommaireformdynamic')";
			$db->sql_query($sql);
			echo (MySql_error());
		} //end for 2
	}// end for 1 : toutes les cat�gories et leur contenu sont rentr�es dans la DB
	
// ensuite, on ins�re la cat�gorie 99.
	$sql="INSERT INTO ".$prefix."_sommaire VALUES ('$sommaireformgroupmenu[99]', NULL, NULL, NULL, NULL,NULL,NULL,NULL,NULL, NULL, NULL, NULL, NULL)";
	$db->sql_query($sql);
//	echo "<br>$sommaireformgroupmenu[99]&nbsp;";
	include("header.php"); 
	GraphicAdmin();
	OpenTable();
	echo (MySql_error());
	echo "<div align=\"center\">"._SOMSUCCESS."</div>";
	echo "<br><br><br><div align=\"center\">[<a href=\"admin.php?op=sommaire\">"._SOMBACKADMIN."</a>]</div>";
	CloseTable();
	include("footer.php"); 
}

function edit() {
global $keysommaire, $z, $modulename, $lienname, $lienlien, $image, $new_days, $categoryclass, $lienclass, $catname, $catimage, $bgcolor1, $bgcolor3, $bgcolor2, $bgcolor4, $zetheme, $sommaireeditposted, $somcategoryclass, $somlienclass, $somnew_days, $db, $prefix, $urlofimages;
	if ($sommaireeditposted!="ok") {
		if ($catimage<>"noimg" && !eregi(".swf",$catimage) && $som_center<>"on") {
			$catimagesize = getimagesize("".$urlofimages."/$catimage");//l� on va r�cup�rer la largeur de l'image de la cat�gorie, pour aligner les modules avec le titre de la cat�gorie.
			if ($image<>"middot.gif") {
				$moduleimagesize = getimagesize("".$urlofimages."/categories/$image");
			}
			else {
				$moduleimagesize[0]=5;
			}
			$imagesize =$catimagesize[0]-$moduleimagesize[0];
			
			if ($imagesize<0) {
				$imagesize=0;
			}
		}
		else {
			$imagesize=0;
			$catimage="admin/null.gif";
		}
		$catname = ereg_replace("\[SOMSYMBOLEet\]","&",$catname);
		$lienname = ereg_replace("\[SOMSYMBOLEet\]","&",$lienname);
		$catname = ereg_replace("\[SOMSYMBOLEinterro\]","?",$catname);
		$lienname = ereg_replace("\[SOMSYMBOLEinterro\]","?",$lienname);
		include("themes/$zetheme/theme.php");
		echo "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">
		<html><head><title>"._SOMEDITLINKTITLE."</title>
		<LINK REL=\"StyleSheet\" HREF=\"themes/$zetheme/style/style.css\" TYPE=\"text/css\"></head>
		<body>
		<form action=\"admin.php?op=sommaire&go=edit\" method=\"post\">
		<input type=\"hidden\" name=\"sommaireeditposted\" value=\"ok\">
		<table cellspacing=2 cellpadding=3 align=\"center\">
		<tr class=\"title\"><td colspan=3 align=\"center\" bgcolor=\"$bgcolor2\" >"._SOMMOREOPTIONS."</td></tr>
		<tr height=6><td></td></tr><tr>
		<td align=\"left\" bgcolor=\"$bgcolor3\"><img src=\"".$urlofimages."/$catimage\">&nbsp;$catname</td>
		<td align=\"left\" bgcolor=\"$bgcolor3\">"._SOMCLASS." : <input type=\"text\" name=\"somcategoryclass\" value=\"$categoryclass\" size=10></td>
		</tr><tr height=3><td></td></tr>
		<tr bgcolor=\"$bgcolor1\">";
		$displayimage= ($image=="middot.gif") ? "<strong>&middot;</strong>" : "<img src=\"".$urlofimages."/categories/$image\">";
		if ($modulename=="Lien externe") {
			echo "<td bgcolor=\"$bgcolor1\"><img src=\"".$urlofimages."/admin/none.gif\" width=\"$imagesize\" height=\"1\">".$displayimage."&nbsp;$lienname</td>";
		}
		elseif ($modulename=="SOMMAIRE_HR") {
			echo "<td bgcolor=\"$bgcolor1\"><img src=\"".$urlofimages."/admin/none.gif\" width=\"$imagesize\" height=\"1\"><hr></td>";
		}
		else {
			echo "<td bgcolor=\"$bgcolor1\"><img src=\"".$urlofimages."/admin/none.gif\" width=\"$imagesize\" height=\"1\">".$displayimage."&nbsp;$modulename</td>";
		}
		$disabled=($modulename=="SOMMAIRE_HR") ? "disabled" : "" ;
		echo "<td bgcolor=\"$bgcolor1\">"._SOMCLASS." : <input type=\"text\" name=\"somlienclass\" value=\"$lienclass\" size=10></td>
		<td>"._SOMSINCE." <input type=\"text\" name=\"somnew_days\" value=\"$new_days\" $disabled size=2> "._SOMNBDAYS."
		<input type=\"hidden\" name=\"keysommaire\" value=\"$keysommaire\"><input type=\"hidden\" name=\"z\" value=\"$z\">";
		
		echo "</td></tr><tr><td height=10></td></tr><tr><td align=\"center\" colspan=3><input type=\"submit\"></td></tr><tr><td height=15></td></tr>
		<tr><td colspan=3>"._SOMATTENTIONMOREOPTIONS."</td></tr></table></form>
		</body>
		</html>";
		
	}
	else{
	?>
	<script language="Javascript">
	opener.document.forms.form_sommaire.elements["sommaireformmoduleclass[<?php echo $keysommaire;?>][<?php echo $z;?>]"].value="<?php echo $somlienclass;?>";
	opener.document.forms.form_sommaire.elements["sommaireformmodulenew_days[<?php echo $keysommaire;?>][<?php echo $z;?>]"].value="<?php echo $somnew_days;?>";
	opener.document.forms.form_sommaire.elements["sommaireformeachcategoryclass[<?php echo $keysommaire;?>]"].value="<?php echo $somcategoryclass;?>";
	</script>
	<?php
		echo "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">
		<html><head><title>"._SOMEDITLINKTITLE."</title>
		<LINK REL=\"StyleSheet\" HREF=\"themes/$zetheme/style/style.css\" TYPE=\"text/css\"></head>
		<body>";
		//echo "key:$keysommaire - z:$z - $somlienclass - $somnew_days - $somlienid - $somcategoryclass<br>";
		echo "<br><br><div align=\"center\"><span  class=\"title\">"._SOMMOREOPTIONSUCCESS."</span><br>"._SOMSENDTOVALIDATE."<br><br><br><br><br><br><div align=\"center\" class=\"title\">[<a href=\"javascript:window.close()\">"._SOMCLOSE."</a>]</div>";
		echo"</body></html>";
	}
}

function deletecat() { //pour supprimer une cat�gorie (fonction appel�e par le clic sur "supprimer" dans une ligne du formulaire)
	global $deletecat, $keysommaire, $confirm, $catname, $db, $prefix;
	if ($confirm<>"YES") {
		include ("header.php");
		GraphicAdmin();
		echo"<br>";
		OpenTable();
		$catname=htmlspecialchars($catname);
		echo"<div align=\"center\">"._SOMWARNINGDELETECAT." <i>$catname</i> ?<br><br>";
		echo"[ <a href=\"admin.php?op=sommaire\">"._SOMNO."</a> | <a href=\"admin.php?op=sommaire&go=deletecat&deletecat=$deletecat&confirm=YES\">"._SOMYES."</a> ]"
		."</div>";
		CloseTable();
		include("footer.php");
	}
	else {
		$confirm="NO";
		$db->sql_query("DELETE FROM ".$prefix."_sommaire WHERE groupmenu='$deletecat'");
		$db->sql_query("DELETE FROM ".$prefix."_sommaire_categories WHERE groupmenu='$deletecat'");
		echo (MySql_error());
		index();
	}
}

switch($go) { 

default: 
index(); 
break; 

case "send":
send();
break;

case "deletecat":
deletecat();
break;

case "edit":
edit();
break;
}


?>