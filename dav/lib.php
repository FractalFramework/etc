<?php

spl_autoload_register(function($a){
    if(is_file($f='dav/kernel/'.$a.'.php')){require($f); return;}
    $r=sesmk('scandir_b','src',0);
    if($r)foreach($r as $v)if(is_file($f='src/'.$v.'/'.$a.'.php')){require($f); return;}
});

//html
function n(){return "\n";}
function br(){return "<br />";}
function hr(){return "<hr />";}
function sp(){return "&nbsp;";}
function st(){return "&#8239";}
function thin(){return "&thinsp;";}

function atr($r){$ret=''; if($r)foreach($r as $k=>$v)if($v)$ret.=' '.$k.'="'.$v.'"'; return $ret;}
function tag($b,$p,$d){return '<'.$b.atr($p).'>'.$d.'</'.$b.'>';}
function taga($b,$p){return '<'.$b.atr($p).' />';}
function tagb($b,$d){return '<'.$b.'>'.$d.'</'.$b.'>';}
function tagc($b,$c,$d){return '<'.$b.atr(['class'=>$c]).'>'.$d.'</'.$b.'>';}
function lk($v,$u,$c='',$p=[]){return tag('a',['href'=>$u,'class'=>$c]+$p,$v);}
function img($d,$p=[]){return taga('img',['src'=>$d]+$p);}
function div($v,$c='',$d='',$s=''){return tag('div',['class'=>$c,'id'=>$d,'style'=>$s],$v);}
function span($v,$c='',$d='',$s=''){return tag('span',['class'=>$c,'id'=>$d,'style'=>$s],$v);}
function block($v){return tagb('blockquote',$v);}
function h1($v){return tagb('h1',$v);}
function h2($v){return tagb('h2',$v);}
function h3($v){return tagb('h3',$v);}
function h4($v){return tagb('h4',$v);}
function li($v){return tagb('li',$v);}

function atj($d,$j){return $d.'('.implode_j($j).');';}
function bt($v,$j,$pj=[],$c='',$p=[]){return tag('button',['onclick'=>atj($j,$pj),'class'=>$c]+$p,$v);}
function btj($v,$j,$pj=[],$c='',$p=[]){return tag('a',['onclick'=>atj($j,$pj),'class'=>$c]+$p,$v);}
function bj($v,$j,$c='',$p=[]){return tag('a',['onclick'=>'bj(this)','data-bj'=>$j,'title'=>$j,'class'=>$c]+$p,$v);}
function bjtog($v,$j,$c='',$p=[]){return tag('a',['onclick'=>'bjtog(this)','data-bj'=>$j,'title'=>$j,'class'=>$c]+$p,$v);}
function bh($v,$h,$c='',$p=[]){return tag('a',['href'=>'/'.$h,'onclick'=>'return bh(this)','class'=>$c]+$p,$v);}

function input($d,$v,$s='',$p=[]){
if($p['type']??''){$vy=$p['type']; unset($p['type']);} else $vy='text';
return '<input'.atr(['type'=>$vy,'id'=>$d,'value'=>$v,'size'=>$s]+$p).' />';}
function hidden($d,$v){return taga('input',['type'=>'hidden','id'=>$d,'value'=>$v]);}
function label($id,$t,$c='',$idb=''){return tag('label',['for'=>$id,'class'=>$c,'id'=>$idb],$t);}
function inpsw($d,$v,$s='',$p=[]){return input($d,$v,$s,['type'=>'password','maxlength'=>'100','placeholder'=>'password']);}
function inpnb($id,$v,$min='',$max='',$st=1){return input($id,$v,'',['type'=>'number','name'=>$id,'min'=>$min,'max'=>$max,'step'=>$st]);}
function inpmail($id,$v='',$p=[]){return input($id,$v,16,['type'=>'mail','placeholder'=>'mail','maxlength'=>'100']+$p);}
function inpdate($id,$v,$o='',$min='',$max=''){return input($id,$v,'',['type'=>$o?'datetime-local':'date','min'=>$min,'max'=>$max]);}//'step'=>'1'
function inpclr($id,$v=''){return input($id,$v,'',['type'=>'color','name'=>$id]);}
function inptel($id,$v,$pl='06-01-02-03'){return input($id,$v,['type'=>'tel','name'=>$id,'placeholder'=>$pl,'pattern'=>"[0-9]{2}-[0-9]{2}-[0-9]{2}-[0-9]{2}",'required'=>'required']);}
function inprange($id,$v,$st=1,$min='',$max=''){return input($id,$v,'',['type'=>'range','name'=>$id,'min'=>$min,'max'=>$max,'step'=>$st]);}
function bar($id,$v=50,$st=10,$min=0,$max=100,$js='jumphtml',$s='240px'){$js.='(\''.$id.'\',this.value)';
$pr=['type'=>'range','name'=>$id,'min'=>$min,'max'=>$max,'step'=>$st,'onchange'=>$js,'style'=>'width:'.$s.'; height:5px;','title'=>'use mousewheel'];
return input($id,$v,'',$pr).label($id,$v,'txtx','lbl'.$id);}
function progress($v='',$max=100,$w=240,$t=''){return tag('progress',['value'=>$v,'max'=>$max,'style'=>'width:'.$w.'px'],$t);}

function checkbox($id,$v,$t,$ck=''){$pr=['type'=>'checkbox','checked'=>$ck?'checked':''];
return input($id,$v,'',$pr).($t?label($id,$t,'small').' ':'');}
function radio($id,$r,$h){$rt=[];
if($r)foreach($r as $k=>$v){$ck=$v==$h?'checked':'';
$rt[]=taga('input',['type'=>'radio','id'=>$id,'value'=>$v,'checked'=>$ck]).label($id,$v,'small');}
return implode(' ',$rt);}

function textarea($id,$v,$w='40',$h='4',$p=[]){
return tag('textarea',['id'=>$id,'cols'=>$w,'rows'=>$h]+$p,$v);}
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
function delbr($d,$o=''){return str_replace(['<br />','<br/>','<br>'],$o,$d??'');}
function deln($d,$o=''){return str_replace("\n",$o,$d??'');}
function delr($d,$o=''){return str_replace("\r",$o,$d??'');}
function delt($d,$o=''){return str_replace("\t",$o,$d??'');}
function delnl($d){return preg_replace('/(\n){2,}/',"\n\n",$d??'');}
function delsp($d){return preg_replace('/( ){2,}/',' ',$d??'');}
function delnbsp($d){return str_replace("&nbsp;",' ',$d??'');}
function nbsp($d){return str_replace(' ',"&nbsp;",$d??'');}
function delr_r($r){foreach($r as $k=>$v)$r[$k]=delr($v); return $r;}
function hed($d){if($d)return html_entity_decode($d);}

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

//files
function curl_get_contents($f,$post=[],$json=0){
$c=curl_init(); curl_setopt($c,CURLOPT_URL,$f); $er='';
curl_setopt($c,CURLOPT_HTTPHEADER,$json?['accept: application/json','content-type: application/json']:[]);
if(is_array($post))$post=http_build_query($post);
if($post){curl_setopt($c,CURLOPT_POST,TRUE); curl_setopt($c,CURLOPT_POSTFIELDS,$post);}
curl_setopt($c,CURLOPT_USERAGENT,$_SERVER['HTTP_USER_AGENT']);
curl_setopt($c,CURLOPT_RETURNTRANSFER,1); curl_setopt($c,CURLOPT_FOLLOWLOCATION,1);
curl_setopt($c,CURLOPT_SSL_VERIFYPEER,0); curl_setopt($c,CURLOPT_SSL_VERIFYHOST,0);
curl_setopt($c,CURLOPT_REFERER,host()); curl_setopt($c,CURLOPT_CONNECTTIMEOUT,2);
curl_setopt($c,CURLOPT_ENCODING,'UTF-8'); $enc=curl_getinfo($c,CURLINFO_CONTENT_TYPE);
$ret=curl_exec($c); if($ret===false)$er=curl_errno($c);
curl_close($c); if($er)er($er); else return $ret;}

function getfile($f){return curl_get_contents($f);}
function putfile($f,$d){$e=file_put_contents($f,$d,LOCK_EX); opcache($f);
if($e!==false)return 1;}

function ftime($f,$d=''){if(is_file($f))return date($d?$d:'ymd.His',filemtime($f));}
function fsize($f,$o=''){if(is_file($f))return round(filesize($f)/1024,1).($o?' Ko':'');}
function opcache($d){if(!cnfg('local'))opcache_invalidate($d);}

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
function day($d='',$p=''){return date($p?$p:'ymd.Hi',is_numeric($d)?$d:time());}
function sqldate(){return date('Y-m-d H:i:s');}//%A%d%B%G%T
function time_ago($dt){$dy=time()-$dt; if($dy<86400){$fuseau=3;
$h=intval(date('H',$dy))-$fuseau; $i=intval(date('i',$dy)); $s=intval(date('s',$dy));
$nbh=$h>1?$h.' h ':''; $nbi=$i>0?$i.' min ':''; return $nbh.$nbi;} else return day('',$dt);}

//detection
function xt($d,$o=0){return substr(strtolower(strrchr($d??'','.')),$o);}
function isimg($d){$d=xt($d); if(!$d)return; $r=['.jpg','.png','.gif','.jpeg','.webp'];
for($i=0;$i<5;$i++)if(mb_strpos($d,$r[$i])!==false)return $r[$i];}
function ishttp($d){return substr($d,0,4)=='http'?1:0;}

//roots
function imgroot($d){return ishttp($d)?$d:'/img/'.$d;}
function nohttp($f){if($f)return str_replace(['http://','https://','www.'],'',$f);}
function domain($f){$f=nohttp($f); $p=strpos($f??'','/'); return $p?substr($f,0,$p):$f;}//preplink
function host(){return 'http://'.$_SERVER['HTTP_HOST'];}
function hostname(){$ip=$_SERVER['REMOTE_ADDR']??'';
if(strstr($ip,' ')){$r=explode(' ',$ip); return $r[0];} else return gethostbyaddr($ip);}

#core
function rdiv($r){return implode('',array_map('div',$r));}
function walk($r,$fc){$rt=[]; foreach($r as $k=>$v)$rt[]=$fc($v); return $rt;}

//tables
function tabler($r,$head='',$keys='',$frame=''){$i=0; $td=''; $tr='';
if(is_array($head)){array_unshift($r,$head); $head=1;}
if(is_array($r))foreach($r as $k=>$v){$td=''; $i++; $tag=$i==1&&$head?'th':'td';
    if($keys)$td.=tagb($tag,$k);
    if(is_array($v))foreach($v as $ka=>$va)$td.=tagb($tag,$va);
    else $td.=tagb('th',$k).tagb($tag,$v);
    if($td)$tr.=tagb('tr',$td);}//ats('valign','top')
$ret=tagb('table',tagb('tbody',$tr));
if($frame)$ret=tag('div',['width'=>'100%','height'=>'400px','overflow'=>'auto','scrollbar-width'=>'thin'],$ret);
return $ret;}

//tabs
function tabs($r,$id='tab1',$c=''){
$b=0; $mnu=''; $ret=''; $sp=span(' ','space');
if($r)foreach($r as $k=>$v){$b++;
    $dsp=$b==1?'block':'none'; $cs=$b==1?'active':'';
    $mnu.=span(btj($k,'tabs',[$id,$b]),$cs).$sp;
    $ret.=div($v,$c,'div'.$id.$b,'display:'.$dsp);}
return div($mnu,'tabs','mn'.$id).$ret;}

function mkli($d,$ul='ul'){$ret=''; $r=explode("\n",$d);
foreach($r as $v){if(substr($v,0,1)=='-')$v=substr($v,1); $v=trim($v); $ret.=li($v);}
return tag($ul,[],$ret);}

//scroll
function scroll($d,$max=10,$w='',$h='',$id=''){$h=is_numeric($h)?$h.'px':$h;
$s=$w?'width:'.$w.'px; ':''; $s.='max-height:'.($h?$h:'420px').';';
$c=strlen($d)>$max?'scroll':''; return div($d,$c,$id,$s);}

//ses
function voc($d){$r=sesmk('json::call','lang/voc',0); return nbsp($r[$d]??$d);}
function ico($d){$r=sesmk('json::call','lang/ico',0); return span($r[$d]??'','ico');}
function icovoc($d,$b='',$c=''){return ico($d).thin().span(voc($b?$b:$d),$c);}

//ops
function rid($p=''){return $p.substr(microtime(),2,7);}
function unid($p,$n=6){return substr(md5($p),2,$n);}

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
?>