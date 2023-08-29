<?php
class test{

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