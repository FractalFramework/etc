<?php
#dav@2023 © All rights reserved
ini_set('display_errors','1');
error_reporting(E_ALL);
//ini_set('default_charset','utf-8');
header('Content-Type: text/html; charset=utf-8');
session_start();
define('root',__DIR__);
require('dav/lib.php');
new sql(['localhost','root','dev','etc']);
require('public/index.php');
sql::$qr=null;