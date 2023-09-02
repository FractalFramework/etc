<?php
class test{

    

function changemode($n){
$r=['username','password','/public_html/','ftp.something.org'];
$path="public";
$mod=intval($n,8);
$ci=ftp_connect($r[3]);
$login_result=ftp_login($ci,$r[0],$r[1]);
if(ftp_site($ci,'CHMOD '.$mod.' '.$r[2].$path)!==false)$ret=true; else $ret=false;
ftp_close($ci);
return $ret;}


static function md($p){$ret='';
    [$a,$b]=vals($p,['a','b']);
    $d='
[title:h1]

[hello:b]

text
[hola:i]

hey hey [hey:code] hey [hey:i]';
    $d1=conn::call(['txt'=>$d,'','']);//conn2html
    eco($d1);
    $d2=conn::call(['txt'=>$d,'parser'=>'conn::markdown','nop'=>1]);//conn2md
    eco($d2);
    $d4=conv::md2conn($d2);
    eco($d4);
}

static function call($p){
//return self::md($p);
}

}