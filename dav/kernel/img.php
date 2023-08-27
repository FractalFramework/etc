<?php
class img{
    
static function b64img($u){
if(substr($u,0,21)=='data:image/png;base64'){$d=substr($u,22); $xt='.png';}
elseif(substr($u,0,22)=='data:image/jpeg;base64'){$d=substr($u,23); $xt='.jpg';}
$f=unid($d).$xt; putfile('img/'.$f,base64_decode($d));
return $f;}

function imgthumb($f){
$fa='img/full/'.$f; $fc='img/mini/'.$f;
if(!is_file($fc) && is_file($fa))self::thumb($fa,$fc,170,170,0);
//elseif(is_file($fc))unlink($fc);//maintenance
return $fc;}

function getim($f,$w=240,$h=180){$er=1;
if(substr($f,0,4)!='http')return;
if(strpos($f,'?'))$f=struntil($f,'?');
$xt=xt($f); if(!$xt)$xt='.jpg';
$nm=unid($f,10); $h=$h?$h:$w;
$fa='img/full/'.$nm.$xt; mkdir_r($fa);
$fb='img/mini/'.$nm.$xt; mkdir_r($fb);
if(is_file($fa))return $nm.$xt;
$ok=@copy($f,$fa); if(!$ok){$d=@file_get_contents($f); if($d)$er=putfile($fa,$d);}
if($ok or !$er)if(filesize($fa)){
    [$wa,$ha]=getimagesize($fa); if($wa>$w or $ha>$h)self::thumb($fa,$fb,$w,$h,0);
    return $nm.$xt;}}

//force LH, cut and center
function scale($w,$h,$wo,$ho,$s){$hx=$wo/$w; $hy=$ho/$h; $yb=0; $xb=0;
if($s==2){$xb=($wo/2)-($w/2); $yb=($ho/2)-($h/2); $wo=$w; $ho=$h;}
elseif($hy<$hx && $s){$xb=0; $yb=($ho-($h*$hx))/2; $ho=$ho/($hy/$hx);}//reduce_h
elseif($hy>$hx && $s){$xb=($wo-($w*$hy))/2; $wo=$wo/($hx/$hy);}//reduce_w
elseif($hy<$hx){$xb=($wo-($w*$hy))/2; $wo=$wo/($hx/$hy);}//adapt_h
elseif($hy && $hx){$xb=0; $ho=$ho/($hy/$hx);}//adapt_w
return [round($wo),round($ho),round($xb),round($yb)];}

function thumb($in,$out,$w,$h,$s){$xa=0; $ya=0;
$w=$w?$w:170; $h=$h?$h:100; [$wo,$ho,$ty]=getimagesize($in);
[$wo,$ho,$xb,$yb]=self::scale($w,$h,$wo,$ho,$s);
if(is_file($in))if(fsize($in)>5000)return;
$img=imagecreatetruecolor($w,$h);
if($ty==2){$im=imagecreatefromjpeg($in);
    imagecopyresampled($img,$im,$xa,$ya,$xb,$yb,$w,$h,$wo,$ho);
    imagejpeg($img,$out,100);}
elseif($ty==1){$im=imagecreatefromgif($in); self::alpha($img);
    imagecopyresampled($img,$im,$xa,$ya,$xb,$yb,$w,$h,$wo,$ho);
    imagegif($img,$out);}
elseif($ty==3){$im=imagecreatefrompng($in); self::alpha($img);
    imagecopyresampled($img,$im,$xa,$ya,$xb,$yb,$w,$h,$wo,$ho);
    imagepng($img,$out);}
return $out;}

function alpha($img){//imagefilledrectangle($im,0,0,$w,$h,$wh);
$c=imagecolorallocate($img,255,255,255); imagecolortransparent($img,$c);
imagealphablending($img,false);
imagesavealpha($img,true);}

}