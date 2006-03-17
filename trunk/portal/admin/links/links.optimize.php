<?php
if (!eregi("admin.php", $_SERVER['PHP_SELF'])) { die ("Access Denied"); }
if ($radminsuper==1) {
    adminmenu("admin.php?op=optimize", "Optimize DB", "optimize.gif");
}

?>