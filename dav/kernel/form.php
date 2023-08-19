<?php
class form{

/*static function build($r){$rt=[]; //$rk=array_keys(uns($r,0));
foreach($r as $k=>$v){$k=str::normalize($k,1); $d='';
['type'=>$ty,'value'=>$va,'label'=>$lbl,'opt'=>$o]=$v;
switch($ty){
	case('input'):$d=input($k,$va,20,$lbl,$o); break;
	case('inputnb'):$d=input($k,$va,8,$lbl,1,'',$o); break;
	case('textarea'):$d=textarea($k,$va,40,10,$lbl,$o); break;
	case('select'):$d=select($k,$o,$va,1); break;
	case('checkbox'):$d=checkbox($k,$o,$va,1); break;
	case('radio'):$d=radio($k,$o,$va,1); break;
	case('hidden'):$d=hidden($k,$va); break;
	case('bar'):$d=bar($k,$va); break;
	case('submit'):$d=bj($va,langp($lbl),'btsav'); break;
	//case('submit'):$d=input($k,langp($lbl),'','','submit'); break;
	}
$rt[$k]['field']=$d;
if($lbl && $ty!='submit')$rt[$k]['label']=label($k,$lbl);}
return $rt;}

//['p1'=>['input','label','url',0],'p2'=>['radio','choice1','one',['one','two']],['submit','ok','popup|form||','idform']]
static function call($rp,$j='',$mode=''){
$ra=['type','value','label','opt'];
foreach($rp as $k=>$v)$rp[$k]=array_combine($ra,$v);
$r=self::build($rp);
if(!$j)return implode('',array_column($r,'field'));
else return self::pao($r,$j,$mode);}
*/

static function build($r){$rt=[];
foreach($r as $k=>$v){
	[$id,$ty,$va]=$v; $rid=unid($id);
	$rp=['placeholder'=>$id];
	if($ty=='text' or $ty=='long')$d=textarea($rid,$va,40,4,$rp);
	elseif($ty=='json')$d=textarea($rid,$va?$va:'{}',40,4,$rp);
	elseif($ty=='int')$d=inpnb($rid,$va);
	elseif($ty=='date' or $ty=='time')$d=inpdate($rid,$va?$va:sqldate(),1);
	else $d=input($rid,$va,'',$rp);
	$rt[]=div($d.label($id,$id,'btn'));}
return join('',$rt);}

static function call($ra,$r=[]){$rt=[];
//$ra=['id','type','value','opt'];
//foreach($r as $k=>$v)$rt[$k]=array_combine($ra,$v);
foreach($ra as $k=>$v)$rt[]=[$k,$v,$r[$k]??''];
return self::build($rt);}
}