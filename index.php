<?php
#dav@2023 ©All rights reserved
ini_set('session.cookie_lifetime',0);
ini_set('session.use_only_cookies','on');
ini_set('session.use_strict_mode','on');
//ini_set('default_charset','utf-8');
ini_set('display_errors','1');
error_reporting(E_ALL);
session_start();
require('src/php/lib.php');
require('cnfg/'.nohttp(host()).'.php');
require('src/index.php');
sql::$qr=null;
?>