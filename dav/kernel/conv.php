<?php

class conv{
static $conn=['b'=>'b','i'=>'i','u'=>'u','small'=>'s','em'=>'b','strike'=>'k','center'=>'c','sup'=>'e','sub'=>'n'];
static $conb=['h1'=>'h1','h2'=>'h2','h3'=>'h3','h4'=>'h4','h5'=>'h5','h6'=>'h6','big'=>'h','blockquote'=>'q','ul'=>'list','ol'=>'numlist','table'=>'table'];
static $th='';

static function tags($tag,$atb,$d){
if(strpos($atb,'align="center"')!==false)$d='['.$d.':c]';
switch($tag){
case('a'):$u=between($atb,'href="','"'); //$ub=between($atb,'data-j="','"');
    if($d==domain($u))$d='';
    if($u==$d && $u)return '['.trim($u).']';
    if($u && substr($u,0,3)=='#nh')return '['.substr($u,3).':nb]';
    if($u && substr($u,0,3)=='#nb')return '['.substr($u,3).':nh]';
    if($u)return '['.trim($u).($d?'|'.trim($d):'').':url]'; break;
case('img'):$u=between($atb,'src="','"'); $b64='';
    $w=between($atb,'width="','"'); $h=between($atb,'height="','"');
    if(substr($u,0,10)=='data:image')$u=img::b64img($u);
    elseif(substr($u,0,4)=='http')$u=img::getim($u,'art',$w,$h='');
    elseif(substr($u,0,9)=='/img/mini')return '';
    //elseif(substr($u,0,9)=='/img/full')return $u;
    elseif(substr($u,0,4)!='http')$u=strend($u,'/');
    //if($w && $h)$u.='|'.$w.'-'.$h;
    return '['.$u.']'; break;//:img
case('table'):
    if(mb_substr($d,-1,1)=='¬')$d=mb_substr($d,0,-1);
    if(post('th')){$o='|1'; self::$th='';} else $o='';
    return '['.$d.$o.':table]';break;//.$o
case('big'):return '['.$d.':big]'; break;
case('center'):return '['.$d.':c]'; break;
case('aside'):return '['.$d.':aside]'; break;
case('tr'):if(mb_substr($d,-1,1)=='|')$d=trim(mb_substr($d,0,-1));
    $d=strip_tags($d); return $d?str_replace("\n",' ',$d)."\n":''; break;
case('th'):self::$th=1; $d=trim($d); return $d?str_replace('|','',trim($d)).'|':''; break;
case('td'):$d=trim($d); return $d?str_replace('|','',$d).'|':''; break;
case('font'):return $d; break;//font-size
case('li'):return trim($d)."\n"; break;
case('ul'):return '['.$d.':list]'."\n"; break;
case('div'):return $d."\n\n"; break;
case('hr'):return '[--]'; break;
case('p'):return $d."\n\n"; break;
case('embed'):$u=between($atb,'src="','"'); return '['.$u.']'; break;
case('iframe'):$u=between($atb,'src="','"'); return '['.$u.']'; break;}
$r=self::$conn; if($d && isset($r[$tag]))return '['.$d.':'.$r[$tag].']';
$r=self::$conb; if($d && isset($r[$tag]))return "\n\n".'['.$d.':'.$r[$tag].']'."\n\n";
return $d;}

static function cleanhtml($d){;
$r=['b','i','u','strike','ul','ol','li'];
foreach($r as $k=>$v){
$d=str_replace('</'.$v.'><'.$v.'>','',$d);
$d=str_replace('</'.$v.'> <'.$v.'>',' ',$d);}
return $d;}

static function cleanconn($d){
$d=str_replace('['."\n","\n".'[',$d);
$r=self::$conn+self::$conb;
foreach($r as $k=>$v){
$d=str_replace("\n".':'.$v.']',':'.$v.']'."\n",$d);
$d=str_replace(' :'.$v.']',':'.$v.'] ',$d);
$d=str_replace(':'.$v.'].','.:'.$v.']',$d);
$d=str_replace('[:'.$v.']','',$d);}
return $d;}

static function ecart($v,$a,$b){return substr($v,$a+1,$b-$a-1);}

static function recursearch($v,$ab,$ba,$tag){//pousse si autre balise similaire
$bb=strpos($v,'>',$ba); $d=self::ecart($v,$ab,$ba);
if(strpos($d,'<'.$tag)!==false){$bab=strpos($v,'</'.$tag,$ba+1);
    if($bab!==false)$ba=self::recursearch($v,$bb,$bab,$tag);}
return $ba;}

static function parse($v,$x=''){
$tag=''; $atb=''; $txt=''; $before='';
$aa=strpos($v,'<'); $ab=strpos($v,'>');//tag
if($aa!==false && $ab!==false && $ab>$aa){
$before=substr($v,0,$aa);//...<
$atb=self::ecart($v,$aa,$ab);//<...>
    $aa_end=strpos($atb,' ');
    if($aa_end!==false)$tag=substr($atb,0,$aa_end);
    else $tag=$atb;}
$ba=strpos($v,'</'.$tag,$ab); $bb=strpos($v,'>',$ba);//end
if($ba!==false && $bb!==false && $tag && $bb>$ba){
    $ba=self::recursearch($v,$ab,$ba,$tag);
    $bb=strpos($v,'>',$ba);
    $tagend=self::ecart($v,$ba,$bb);
    $txt=self::ecart($v,$ab,$ba);}
elseif($ab!==false)$bb=$ab;
else{$bb=-1;}
$after=substr($v,$bb+1);//>...
$tag=strtolower($tag);
//itération
if(strpos($txt,'<')!==false)$txt=self::parse($txt,$x);
if(!$x)//interdit l'imbrication
    $txt=self::tags($tag,$atb,$txt);
//sequence
if(strpos($after,'<')!==false)$after=self::parse($after,$x);
$ret=$before.$txt.$after;
return $ret;}

static function call($p){
$d=$p['txt']??'';
$d=delt($d);
$d=delsp($d);
$d=delr($d);
$d=deln($d,' ');
$d=str::clean_lines($d);
$d=self::cleanhtml($d);
$d=self::parse($d);
$d=self::cleanconn($d);
$d=delbr($d,"\n");
$d=str::clean_n($d);
$d=delsp($d);
$d=nbsp($d);
return $d;}

}