<?php
class secur{
static function call($a,$b){
    $r=json::call('cnfg/secur');
    $m=$r[$a][$b]??ses('auth');
    if(!auth($m))return div(voc('error'),'frame-red');}
}