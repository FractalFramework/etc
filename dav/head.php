<?php
/*
head::json('cnfg/headers');//json defs
echo head::run();
*/

class head{static $r=[]; static $rid='';
    static $js_location='/dav';
    static $css_location='/public';
    static function add($k,$v){self::$r[][$k]=$v;}
    static function json($a){self::$r=json::call($a);}
    static function ra($r){foreach($r as $k=>$v)self::$r[][$k]=$v;}
    static function meta($d,$v,$c=''){return taga('meta',[$d=>$v,'content'=>$c])."\n";}
    static function csslink($d){return taga('link',['href'=>$d,'rel'=>'stylesheet'])."\n";}
    static function jslink($d){return tag('script',['src'=>$d],'')."\n";}
    static function csscode($d){return tag('style',['type'=>'text/css'],$d)."\n";}
    static function jscode($d){return tag('script',['type'=>'text/javascript'],$d)."\n";}
    static function css($d){$c=self::$rid;
    return taga('link',['href'=>self::$css_location.'/css/'.$d.'.css'.$c,'rel'=>'stylesheet'])."\n";}
    static function js($d){$c=self::$rid; $b=ses('dev');
    return tag('script',['src'=>self::$js_location.'/js/'.$d.'.js'.$c],'')."\n";}
    static function link($d,$v){return taga('link',['rel'=>$d,'href'=>$v])."\n";}
    static function relod($v){echo self::jscode('window.css_location="'.$v.'"');}

    static function build(){$r=self::$r; $rt=[]; if(ses('dev'))self::$rid='?'.randid();
    if($r)foreach($r as $k=>$v){$va=current($v); $ka=key($v); $rt[]=match($ka){
    'css'=>self::css($va),'js'=>self::js($va),
    'csslink'=>self::csslink($va),'jslink'=>self::jslink($va),
    'csscode'=>self::csscode($va),'jscode'=>self::jscode($va),
    'name'=>self::meta('name',$va[0],$va[1]),'code'=>$va."\n",
    'meta'=>self::meta($va[0],$va[1],$va[2]),'link'=>self::link($va[0],$va[1]),
    'tagb'=>tagb($va[0],$va[1])."\n",'taga'=>taga(key($va),current($va))."\n",
    default=>self::meta($ka,$va[0],$va[1])};}
    return implode('',$rt);}

    static function html($lg='fr'){return '<!DOCTYPE html>'."\n".'<html lang="'.$lg.'" xml:lang="'.$lg.'">'."\n";}
    static function run($lg='fr'){return self::html($lg).tagb('head',self::build())."\n";}
    static function page($d,$lg='fr'){return self::run($lg).tagb('body',$d).'</html>';}
    static function call($r=[]){if($r)self::$r=array_merge($r,self::$r); return self::build();}
    static function get(){return self::build();}}