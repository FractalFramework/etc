<?php
class str{

static function acc($o=1){
$a=['À','Á','Â','Ã','Ä','Ç','È','É','Ê','Ë','Ì','Í','Î','Ï','Ñ','Ò','Ó','Ô','Õ','Ö','Ù','Ú','Û','Ü','Ý'];
$am=[,'à','á','â','ã','ä','å','ç','è','é','ê','ë','ì','í','î','ï','ð','ò','ó','ô','õ','ö','ù','ú','û','ü','ý','ÿ'];
$b=['à','á','â','ã','ä','ç','è','é','ê','ë','ì','í','î','ï','ñ','ò','ó','ô','õ','ö','ù','ú','û','ü','ý'];
$bm=[,'a','a','a','a','a','a','c','e','e','e','e','i','i','i','i','o','o','o','o','o','o','u','u','u','u','y','y'];
if($o){$a+=$am; $b+=$bm;}
return [$a,$b];}

static function eradic_acc($d){[$a,$b]=self::acc(1);
return str_replace($a,$b,$d);}

static function normalize_alpha($d,$o=''){if(!$d)return;
$r=[' ','-','&nbsp;',"'",'"','/',',',';',':','|','§','%','&','$','#','_','+','=','!','?','\n','\r','\\','~','(',')','[',']','{','}','«','»']; if($o)unset($r[$o]); return str_replace($r,'',$d);}

static function normalize_ext($d){if(!$d)return;
return str_replace(['.JPG','.JPEG','.jpeg','.GIF','.PNG'],['.jpg','.jpg','.jpg','.gif','.png'],$d);}

static function normalize($d,$o=''){if(!$d)return;
$d=self::normalize_alpha($d,$o); $d=self::normalize_ext($d); $d=self::eradic_acc($d); return $d;}

static function numentities($d){
$d=html_entity_decode(stripslashes($d),ENT_QUOTES,'UTF-8');
$r=preg_split('/(?<!^)(?!$)/u',$d); $ret='';
foreach($r as $c){$o=ord($c);
if((strlen($c)>1) || ($o <32 || $o > 126) || ($o >33 && $o < 40) || ($o >59 && $o < 63))
$c=mb_encode_numericentity($c,[0x0,0xffff,0,0xffff],'UTF-8');
$ret.=$c;}
return $ret;}

static function clean_acc($d){if(!$d)return;
$a=['»»',"’","‘",'“','”',"…","–","\t"];//,'«','»'//no detructive because of odd number
$b=['⇒',"'","'",'"','"',"...","-",''];//,'"','"'
if(substr_count($d,'«')==substr_count($d,'»')){$a+=['«','»']; $b+=['"','"'];}
foreach($a as $k=>$v)$d=str_replace([htmlentities($v),$v],$b[$k],$d);
return $d;}

static function clean_punctuation($d,$o=''){if(!$d)return;
if($o)$d=self::clean_acc($d);//avoid utf error
$n=mb_substr_count($d,'"'); $no=$n%2;
$r=mb_str_split($d); $n=count($r); $ia=2;
for($i=0;$i<$n;$i++){
if(($r[$i]??'')=='"'){$ia=$ia==2?1:2;
if($ia==1 && !$no && ($r[$i+1]??'')==' ')unset($r[$i+1]);
if($ia==2 && !$no && ($r[$i-1]??'')==' ')unset($r[$i-1]);}
if(($r[$i]??'')=='(' && ($r[$i+1]??'')==' ')unset($r[$i+1]);
if(($r[$i]??'')==')' && ($r[$i-1]??'')==' ')unset($r[$i-1]);
if(($r[$i]??'')=="," && ($r[$i-1]??'')==' ')unset($r[$i-1]);}
if($r)$d=implode('',$r); if($o==2)$d=self::nicequotes($d,1);
return $d;}

static function nicequotes($d,$o=''){if(!$d)return;
if($o)$d=self::clean_acc(delnbsp($d)); $nb=sp();
$n=mb_substr_count($d,'"'); $no=$n%2;
//$n=mb_substr_count($d,'"'); if($n%2)return $d;
$r=mb_str_split($d); $n=1; $rp=['&laquo;'.$nb,$nb.'&raquo;'];
if(!$no)foreach($r as $k=>$v)if($v=='"'){$n=$n==1?0:1; $r[$k]=$rp[$n];}
if($r)$d=implode('',$r); if($o)$d=self::add_nbsp($d);
return $d;}

static function add_nbsp($d){if(!$d)return;
$a=['( ',' )',' ,',' .',' ;',' :',' !',' ?','« ',' »','&laquo; ',' &raquo;','0 0','<<','>>'];
$b=['(',')',',','.',"&nbsp;;","&nbsp;:","&nbsp;!","&nbsp;?","«&nbsp;","&nbsp;»","«&nbsp;","&nbsp;»",'0&nbsp;0','"','"'];
return str_replace($a,$b,$d);}

static function mb_ucfirst($d,$e='utf-8'){//unused
return mb_strtoupper(mb_substr($d,0,1,$e),$e).mb_strtolower(mb_substr($d,1,mb_strlen($d,$e),$e));}

static function mb_uclet($d,$e='utf-8'){//unused
return mb_substr($d,0,1,$e).mb_strtolower(mb_substr($d,1,mb_strlen($d,$e),$e));}

static function lowcase($d){[$a,$b]=self::acc();
return str_replace($a,$b,$d);}

static function letcase($d){
$n=mb_strlen($d); $ret=''; $y=1; $o=0;
for($i=0;$i<$n;$i++){$c=mb_substr($d,$i,1);
if(!$y)$c=mb_strtolower($c); $ret.=$c;//if($i>0)$o=1; 
if($c==' ' or $c==" " or $c=="'" or $c=='"' or $c=='«' or $c=="&laquo;" or $c=='-' or $c=='[' or $c=='(')$y=1; else $y=0;}// or $c=="&nbsp;"
return $ret;}

static function lowercase($d){if(!$d)return;
//$d=hed($d); eco($d);
$r=explode(' ',$d); $rt=[];
foreach($r as $k=>$v)$rt[]=self::letcase($v);
return join(' ',$rt);}

static function clean_lines($d,$o=''){if(!$d)return '';
if($o)$d=self::clean_whitespaces($d);
$r=explode("\n",$d);
foreach($r as $k=>$v)$rb[]=self::trim($v);
return implode("\n",$rb);}

static function delspc($d){if($d)//erase \n
$d=preg_replace('/\s+/',' ',$d);
return delsp($d);}

static function clean_whitespaces($d){if(!$d)return;
$r=[' ',"&nbsp;","&#160;","&#xA0;","&thinsp;","&#8201;","&ensp;","&#8194","&emsp;","&#8195;","&#8192;","&#8193;","&#8200;","&#8239;","\t"];//&#3647;//bitcoin
foreach($r as $k=>$v)$d=str_replace([hed($v),$v],' ',$d);
return $d;}

static function trim($d,$o=''){
if($o)$d=self::clean_whitespaces($d);
return trim($d,'  ');}//&nbsp;//kill &

}