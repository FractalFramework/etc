<?php

spl_autoload_register(function($a){
    if(is_file($f='dav/'.$a.'.php')){require($f); return;}
    $r=sesmk('scandir_b','src',0);
    if($r)foreach($r as $v)if(is_file($f='src/'.$v.'/'.$a.'.php')){require($f); return;}
});

//html
function n(){return "\n";}
function br(){return "<br />";}
function hr(){return "<hr />";}
function sep(){return "&nbsp;";}
function sti(){return "&#8239";}
function thin(){return "&thinsp;";}

function atj($d,$j){return $d.'('.implode_j($j).');';}
function bh($v,$h,$p=[]){return tag('a',['href'=>'/'.$h,'onclick'=>'return bh(this)']+$p,$v);}
function bj($v,$j,$p=[]){return tag('a',['onclick'=>'bj(this)','data-bj'=>$j,'title'=>$j]+$p,$v);}
function bt($v,$j,$pj=[],$c='',$p=[]){return tag('button',['onclick'=>atj($j,$pj),'class'=>$c]+$p,$v);}
function btj($v,$j,$pj=[],$c='',$p=[]){return tag('a',['onclick'=>atj($j,$pj),'class'=>$c]+$p,$v);}

function atr($r){$ret=''; if($r)foreach($r as $k=>$v)if($v)$ret.=' '.$k.'="'.$v.'"'; return $ret;}
function tag($b,$p,$d){return '<'.$b.atr($p).'>'.$d.'</'.$b.'>';}
function taga($b,$p){return '<'.$b.atr($p).' />';}
function tagb($b,$d){return '<'.$b.'>'.$d.'</'.$b.'>';}
function tagc($b,$c,$d){return '<'.$b.atr(['class'=>$c]).'>'.$d.'</'.$b.'>';}
function div($v,$c='',$d='',$s=''){return tag('div',['class'=>$c,'id'=>$d,'style'=>$s],$v);}
function span($v,$c='',$d='',$s=''){return tag('span',['class'=>$c,'id'=>$d,'style'=>$s],$v);}
function h3($v,$c=''){return tag('h3',['class'=>$c],$v);}

function input($d,$v,$s='',$p=[]){
if($p['type']??''){$vy=$p['type']; unset($p['type']);} else $vy='text';
return '<input'.atr(['type'=>$vy,'id'=>$d,'value'=>$v,'size'=>$s]+$p).' />';}
function inpdate($id,$v,$min='',$max='',$o=''){$vy=$o?'datetime-local':'date';//time
return input($id,$v,'',['type'=>$vy,'min'=>$min,'max'=>$max]);}//step=1
function inpmail($id,$v='',$p=[]){return taga('input',['type'=>'mail','id'=>$id,'value'=>$v,'size'=>'16','placeholder'=>'mail','maxlength'=>'100']+$p);}
function hidden($d,$v){return taga('input',['type'=>'hidden','id'=>$d,'value'=>$v]);}
function label($id,$t,$c='',$ida=''){return tag('label',['for'=>$id,'class'=>$c,'id'=>$ida],$t);}
function checkbox($id,$v,$t,$ck=''){$pr=['type'=>'checkbox','checked'=>$ck?'checked':''];
return input($id,$v,'',$pr).($t?label($id,$t,'small').' ':'');}
function radio($id,$r,$h){$rt=[];
if($r)foreach($r as $k=>$v){$ck=$v==$h?'checked':'';
$rt[]=taga('input',['type'=>'radio','id'=>$id,'value'=>$v,'checked'=>$ck]).label($id,$v,'small');}
return implode(' ',$rt);}

function textarea($id,$v,$cl='40',$rw='4',$p=[]){
return tag('textarea',['id'=>$id,'cols'=>$cl,'rows'=>$rw]+$p,$v);}
function divarea($id,$d,$c='',$s='',$p=[]){
return tag('div',['contenteditable'=>'true','id'=>$id,'class'=>$c,'style'=>$s]+$p,$d);}

function select($id,$r,$ck='',$o='',$js=''){$ret='';
$ra=['id'=>$id,'name'=>$id]; if($js)$ra['onchange']=$js;
if($r)foreach($r as $k=>$v){$rb=[];
    if($o)$k=is_numeric($k)?$v:$k;
    if($k==$ck)$rb['selected']='selected'; $rb['value']=$k;
    $ret.=tag('option',$rb,$v?$v:$k);}
    return tag('select',$ra,$ret);}

function datalist($id,$r,$v,$s=34,$t=''){$ret=''; $opt='';
$ret=tag('input',['id'=>$id,'name'=>$id,'list'=>'dt'.$id,'size'=>$s,'value'=>$v,'placeholder'=>$t],'',1);
foreach($r as $v)$opt.=tag('option',['value'=>$v],'',1);
$ret.=tag('datalist',['id'=>'dt'.$id],$opt);
return $ret;}

function submit($id,$v,$c=''){return input($id,$v,'',['type'=>'submit','class'=>$c]);}
function form($id,$d,$c='',$p=[]){return tag('form',['id'=>$id,'class'=>$c]+$p,$d);}

//filters
function deln($d,$o=''){return str_replace("\n",$o,$d??'');}
function delr($d,$o=''){return str_replace("\r",$o,$d??'');}
function delt($d,$o=''){return str_replace("\t",$o,$d??'');}
function delnl($d){return preg_replace('/(\n){2,}/',"\n\n",$d??'');}
function delsp($d){return preg_replace('/( ){2,}/',' ',$d??'');}

//gets
function gets(){$r=$_GET; foreach($r as $k=>$v)ses::$r['get'][$k]=urldecode($v); return ses::$r['get']??[];}
function posts(){$r=$_POST??[]; foreach($r as $k=>$v)ses::$r['post'][$k]=delr($v); return ses::$r['post']??[];}
function get($k,$v=''){return ses::$r['get'][$k]??ses::$r['get'][$k]=$v;}
function post($k){return ses::$r['post'][$k]??'';}
function get2($k){return filter_input(INPUT_GET,$k);}
function post2($k){return filter_input(INPUT_POST,$k);}
function cookie($d,$v=''){if($v)setcookie($d,$v,time()+(86400*30)); return $_COOKIE[$d]??'';}
function ses($d,$v=null){if(isset($v))$_SESSION[$d]=$v; return $_SESSION[$d]??'';}//assign
function sesz($d){if(isset($_SESSION[$d]))unset($_SESSION[$d]);}

function sesmk($v,$p='',$b=''){$rid=rid($v.$p);
if(!isset($_SESSION[$rid]) or $b or ses('dev'))$_SESSION[$rid]=$v($p);
return $_SESSION[$rid]??[];}

//vars
function arr($r,$n=''){$rb=[]; $n=$n?$n:count($r); for($i=0;$i<$n;$i++)$rb[]=$r[$i]??''; return $rb;}
function expl($d,$s,$n=2){$r=explode($s,$d); for($i=0;$i<$n;$i++)$rb[]=$r[$i]??''; return $rb;}
function vals($r,$ra){foreach($ra as $k=>$v)$rb[]=$r[$v]??''; return $rb;}
function valk($r,$ra){foreach($ra as $k=>$v)$rb[$v]=$r[$v]??''; return $rb;}

//arrays
function explode_k($d,$a,$b){$r=explode($b,$d); $rb=[];
foreach($r as $k=>$v){if($v){$ra=split_right($a,$v);
if(!empty($ra[0]))$rb[$ra[0]]=$ra[1]; else $rb[]=$ra[1];}} return $rb;}
function implode_k($r,$a,$b){$rb=[]; foreach($r as $k=>$v)if($v)$rb[]=$k.$a.$v;
if($rb)return implode($b,$rb);}
function implode_j($d){$rb=[]; if(!is_array($d))$r[]=$d; else $r=$d;
foreach($r as $k=>$v)if($v=='this' or $v=='event')$rb[]=$v; else $rb[]='\''.$v.'\'';
if($rb)return implode(',',$rb);}

//dir
function scandir_b($d){$r=scandir($d); unset($r[0]); unset($r[1]); return $r;}
function scandir_r($d,$r=[]){$dr=opendir($d);
while($f=readdir($dr))if($f!='..' && $f!='.' && $f!='_notes'){$df=$d.'/'.$f;
	if(is_dir($df))$r=scandir_r($df,$r); else $r[]=$df;}
return $r;}
function mkdir_r($u){$nu=explode('/',$u); if(count($nu)>10)return;
if(strpos($u,'Warning')!==false)return; $ret='';
foreach($nu as $k=>$v){$ret.=$v.'/'; if(strpos($v,'.'))$v='';
if(!is_dir($ret) && $v){if(!mkdir($ret))echo $v.':not_created ';}}}
function rmdir_r($dr){$dir=opendir($dr); if(!auth(6))return;
while($f=readdir($dir)){$drb=$dr.'/'.$f;
if(is_dir($drb) && $f!='..' && $f!='.'){rmdir_r($drb); if(is_dir($drb))rmdir($drb);}
elseif(is_file($drb)){unlink($drb); $drb.br();}} if(is_dir($dr))rmdir($dr);}

//str
function strto($v,$s){$p=mb_strpos($v??'',$s); return $p!==false?mb_substr($v,0,$p):$v;}
function struntil($v,$s){$p=mb_strrpos($v??'',$s); return $p!==false?mb_substr($v,0,$p):$v;}
function strfrom($v,$s){$p=mb_strpos($v??'',$s); return $p!==false?mb_substr($v,$p+mb_strlen($s)):$v;}
function strend($v,$s){$p=mb_strrpos($v??'',$s); return $p!==false?mb_substr($v,$p+mb_strlen($s)):$v;}function between($d,$a,$b,$na='',$nb='',$o=''){$pa=$na?mb_strrpos($d,$a):mb_strpos($d,$a);
    if($pa!==false){$pa+=mb_strlen($a); $pb=$nb?mb_strrpos($d,$b,$pa):mb_strpos($d,$b,$pa);
        if($pb!==false)return mb_substr($d,$pa,$pb-$pa); elseif($o)return mb_substr($d,$pa); else return '';}}
function split_one($s,$v,$n=''){if($n)$p=mb_strrpos($v,$s); else $p=mb_strpos($v,$s);
if($p!==false)return [mb_substr($v,0,$p),mb_substr($v,$p+1)]; else return [$v,''];}
function split_right($s,$v,$n=''){if($n)$p=mb_strrpos($v,$s); else $p=mb_strpos($v,$s);
if($p!==false)return [mb_substr($v,0,$p),mb_substr($v,$p+1)]; else return ['',$v];}

//dates
function mkday($d='',$p=''){return date($p?$p:'ymd.Hi',is_numeric($d)?$d:time());}
function sqldate(){return date('Y-m-d H:i:s');}//%A%d%B%G%T
function time_ago($dt){$dy=time()-$dt; if($dy<86400){$fuseau=3;
$h=intval(date('H',$dy))-$fuseau; $i=intval(date('i',$dy)); $s=intval(date('s',$dy));
$nbh=$h>1?$h.' h ':''; $nbi=$i>0?$i.' min ':''; return $nbh.$nbi;} else return mkday('',$dt);}

#core
function rdiv($r){
return implode('',array_map('div',$r));}

//tables
function tabler($r,$head='',$keys='',$frame=''){$i=0; $td=''; $tr='';
if(is_array($head)){array_unshift($r,$head); $head=1;}
if(is_array($r))foreach($r as $k=>$v){$td=''; $i++; $tag=$i==1&&$head?'th':'td';
    if($keys)$td.=tagb($tag,$k);
    if(is_array($v))foreach($v as $ka=>$va)$td.=tagb($tag,$va);
    else $td.=tagb($tag,$k).tagb($tag,$v);
    if($td)$tr.=tagb('tr',$td);}//ats('valign','top')
$ret=tagb('table',tagb('tbody',$tr));
if($frame)$ret=tag('div',['width'=>'100%','height'=>'400px','overflow'=>'auto','scrollbar-width'=>'thin'],$ret);
return $ret;}

//ses
function voc($d){$r=sesmk('json::call','lang/voc',0); return $r[$d]??'';}
function ico($d){$r=sesmk('json::call','lang/ico',0); return $r[$d]??'';}

//ops
function rid($p,$n=6){return substr(md5($p),2,$n);}
function randid($p=''){return $p.substr(microtime(),2,7);}//uniqid()

#store
class ses{static $r=[]; static $er=[]; static $n=0; 
static function k($k,$v){return self::$r[$k]=$v;}
static function r($k){return self::$r[$k]??'';}
static function z($k){unset(self::$r[$k]);}
static function er($v){return self::$er[]=$v;}
static function usr($k){return self::$r['usr'][$k]??'';}
static function cnfg($k){return self::$r['cnfg'][$k]??'';}
static function gets(){return self::$r['get']??'';}}

//ses
function auth($n){return ses('auth')>=$n?1:0;}
function cnfg($d){return ses::cnfg($d);}

//exec
function exc($d){return shell_exec($d);}
function chmodf($f){return shell_exec('chmod +x '.$f);}

//dev
function p($r){print_r($r);}
function pr($r){echo '<pre>'.print_r($r,true).'</pre>';}
function eco($d){
if(is_array($d))$d='<pre>'.print_r($d,true).'</pre>';
elseif(is_object($d))$d=var_dump($d,true);
echo textarea('',htmlspecialchars_decode($d),44,12);}
function er($d){return ses::$er[]=$d;}
function trace(){pr(debug_backtrace());}