<?php
class form{
	
static function tabler($r){}

static function build($r){$rt=[];
foreach($r as $k=>$v){
	[$id,$ty,$va]=$v; $rid=unid($id);
	$rp=['placeholder'=>$id];
	if($ty=='text' or $ty=='long')$d=textarea($rid,$va,40,4,$rp);
	elseif($ty=='json')$d=textarea($rid,$va?$va:'{}',40,4,$rp);
	elseif($ty=='int')$d=inpnb($rid,$va);
	elseif($ty=='date' or $ty=='time')$d=inpdate($rid,$va?$va:sqldate(),1);
	else $d=input($rid,$va,'32',$rp);
	$rt[]=div($d.' '.label($rid,$id,'btn'));}
return join('',$rt);}

//$ra=['id','type','value','opt'];
static function call($ra,$r=[]){$rt=[];
//foreach($r as $k=>$v)$rt[$k]=array_combine($ra,$v);
foreach($ra as $k=>$v)$rt[]=[$k,$v,$r[$k]??''];
return self::build($rt);}
}