<?php
class build{

//tables
static function tabler($r,$h='',$keys='',$frame=''){$i=0; $td=''; $tr='';
if(is_array($h)){array_unshift($r,$h); $h=1;}
if(is_array($r))foreach($r as $k=>$v){$td=''; $i++; $tag=$i==1&&$h?'th':'td';
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
    $mnu.=span(btj('tabs',[$id,$b],$k),$cs).$sp;
    $ret.=div($v,$c,'div'.$id.$b,'display:'.$dsp);}
return div($mnu,'tabs','mn'.$id).$ret;}

//lists
static function playr($r,$c='',$o=''){$ret='';
if(is_array($r))foreach($r as $k=>$v){
    if(is_array($v))$ret.=li(btj('liul','this',$k,$c?'active':'').self::playr($v,$c,$o));
    else $ret.=li($o?$k.': '.$v:$v);}
return tag('ul',['class'=>$c?'on':'off'],$ret);}

static function tree($r,$c='',$o=''){
return div(self::playr($r,$c,$o),'topology');}

static function mkli($r,$ul='ul'){$ret='';
foreach($r as $v){if(substr($v,0,1)=='-')$v=substr($v,1); if($v=trim($v))$ret.=li($v);}
return tag($ul,[],$ret);}

//scroll
static function scroll($d,$max=10,$w='',$h='',$id=''){$h=is_numeric($h)?$h.'px':$h;
$s=$w?'width:'.$w.'px; ':''; $s.='max-height:'.($h?$h:'420px').';';
$c=strlen($d)>$max?'scroll':''; return div($d,$c,$id,$s);}

//csv
static function writecsv($f,$r){
file_put_contents($f,'');
if(($h=fopen($f,'r+'))!==false){
foreach($r as $k=>$v)fputcsv($h,$v); fclose($h);}}

static function readcsv($f){$rb=[];
if(($h=fopen($f,'r'))!==false){$k=0;
while(($r=fgetcsv($h,'',"\t"))!==false){$nb=count($r);
for($i=0;$i<$nb;$i++)$rb[$k][]=$r[$i]; $k++;} fclose($h);}
return $rb;}

static function csvfile($f,$r,$t=''){$t=ico('datas').($t?$t:$f);
$f='_datas/csv/'.$f.'.csv'; mkdir_r($f); self::writecsv($f,$r);
return lk('/'.$f,$t,'btn');}

//contents
static function etc($d,$n=200){$d=deln($d,' '); $d=strip_tags($d);
if(strlen($d)>$n){$e=strpos($d,' ',$n); $d=substr($d,0,$e?$e:$n).'...';} return $d;}

function btpages_nb($nbp,$pg){
$cases=5; $left=$pg-1; $right=$nbp-$pg; $r[1]=1; $r[$nbp]=1;
for($i=0;$i<$left;$i++){$r[$pg-$i]=1; $i*=2;}
for($i=0;$i<$right;$i++){$r[$pg+$i]=1; $i*=2;}
if($r)ksort($r);
return $r;}

function btpages($nbyp,$pg,$nbarts,$j){$ret=''; $nbp=''; $rp=[];
if($nbarts>$nbyp)$nbp=ceil($nbarts/$nbyp);
if($nbp)$rp=self::btpages_nb($nbp,$pg);
if($rp)foreach($rp as $k=>$v)$ret.=bj($j.',pg='.$k,$k,active($k,$pg));
if($ret)return div($ret,'nbp sticky');}

//editable
static function editable($r,$j,$h=[]){
    $pr=['contenteditable'=>'true','class'=>'editable','onblur'=>'editcell(this)'];
    $i=0; $td=[]; $tr=[]; 
    if($h){foreach($h as $k=>$v)$td[]=tagb('th',$v); $tr[]=tagb('tr',join('',$td));}
    if($r)foreach($r as $k=>$v){$td=[]; $i++;
        $td[]=tagb('td',$k);
        if(is_array($v))foreach($v as $ka=>$va)$td[]=tag('td',$pr+['id'=>$i.'-'.$ka],$va);
        else $td[]=tag('td',$pr+['id'=>$i.'-'],$v);
        $tr[]=tagb('tr',join('',$td));}
    $ret=tagb('table',tagb('tbody',join('',$tr)));
    $ret.=hidden('edtcom',$j);
return tag('div',['width'=>'100%','class'=>'scroll'],$ret);}

}
?>