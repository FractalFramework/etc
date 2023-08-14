<?php
use app\models\postmodels;
abstract class postcontroller extends controller{
    $postmodel=new postmodel();
    $post=$postmodel->findall();
    print_r($post);
}