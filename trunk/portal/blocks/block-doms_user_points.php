<?php
if (eregi("block-doms_user_points.php", $PHP_SELF)) {
Header("Location: index.php");
die();
}
global $cookie, $prefix, $multilingual, $currentlang, $db;
// Change the below Variable for more number of users
$maxusers=15;
$sql="select username,points from ".$prefix."_users order by points desc LIMIT $maxusers";
$result = $db->sql_query($sql);
$count=0;
$content="<font class=\"content\">";
//$content =  $content . "<b>User Points</b><BR>";		
while ($row = $db->sql_fetchrow($result)){
	
	if(strcasecmp($row[username],"Anonymous")!=0 && $row[points]>0)
	{ 
		$content =  $content . "<img src=\"images/CZUser/li.gif\">" . " " . "<A href=\"modules.php?name=Your_Account&op=userinfo&username=$row[username]\">$row[username]: &nbsp;<b></A>$row[points]</b><BR>";		
	}
}
$content =  $content . "</font>";  



function rightPadSpacers($name)
{
	$max=10;
	$name=trim($name);
	$cur=strlen($name);  
  	for($i=$cur;$i<$max;$i++){
	  $name .=  "#";	 
	 }
	return $name;  
}

?> 