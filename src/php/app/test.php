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
    $d1=conn::build(['txt'=>$d,'','']);//conn2html
    eco($d1);
    $d2=conn::build(['txt'=>$d,'parser'=>'conn::markdown','nop'=>1]);//conn2md
    eco($d2);
    $d4=conv::md2conn($d2);
    eco($d4);
}

static function jaja(){
	return ['one'=>1,'two'=>2,'three'=>3];
}

static function jajax(){
	$ret=div('one','','one');
	$ret.=div('two','','two');
	$ret.=div('three','','three');
	$ret.=div('','','cb');
	$ret.=bj(',|test,jaja|one,two,three',ico('ok'));
	return $ret;
}

static function call($p){
//return self::md($p);
//$ok=build::ftpchmod('src',777); return $ok?1:0;
return self::jajax();
}

}
?>