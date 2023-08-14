<?php
namespace App\core;
use App\controllers\maincontroller;

/**
 * root principal
 */
class main{
    public function start(){
        session_start();
        $uri=$_SERVER['REQUEST_URI'];
        if(!empty($uri) && $uri!='/' && $uri[-1]==='/'){
            $uri=substr($uri,0,-1);
            http_response_code(301);
            header('Location:'.$uri);
        }
    }
}