<?php
class build{

//tables
static function tabler($r,$head='',$keys='',$frame=''){$i=0; $td=''; $tr='';
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
static function tabs($r,$id='tab1',$c=''){
$b=0; $mnu=''; $ret=''; $sp=span(' ','space');
if($r)foreach($r as $k=>$v){$b++;
    $dsp=$b==1?'block':'none'; $cs=$b==1?'active':'';
    $mnu.=span(btj('tabs',[$id,$b]),$k,$cs).$sp;
    $ret.=div($v,$c,'div'.$id.$b,'display:'.$dsp);}
return div($mnu,'tabs','mn'.$id).$ret;}

static function mkli($r,$ul='ul'){$ret='';
foreach($r as $v){if(substr($v,0,1)=='-')$v=substr($v,1); if($v=trim($v))$ret.=li($v);}
return tag($ul,[],$ret);}

//scroll
static function scroll($d,$max=10,$w='',$h='',$id=''){$h=is_numeric($h)?$h.'px':$h;
$s=$w?'width:'.$w.'px; ':''; $s.='max-height:'.($h?$h:'420px').';';
$c=strlen($d)>$max?'scroll':''; return div($d,$c,$id,$s);}
}
?>