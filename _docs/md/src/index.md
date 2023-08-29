`index.php` call `/public/index.php`, where things begin.

    //we put the gets in a ses, joinable by `get()`
    $g=gets();

    //the defaut `$a` is set at `home`.
    //that mean the first operation will be with `home`
    get('a','home');//default app

    //so we have modified `$g`
    $g=ses::gets();

    //here we init the software, with global parameters
    boot::call();

    //here we build the css from the json `styles`
    //and it will be named like that
    //following some global parameters
    css::build('styles');

    //here we prepare `::head` with vars from the json `headers`
    head::json('cnfg/headers');

    //we add a jscode, to inform the current state of the navigator
    head::add('jscode','state='.json_encode($g).';');

    //here we display the headers
    echo head::run();

    //now is the software
    //module is the basic thing called in every circumstances
    $ret=module::call();

    //we maybe will have to use some popups
    $ret.=tag('div',['class'=>'popup'],"").n();

    //display the errors and notifications during the execution
    if(ses('dev'))echo div(rdiv(ses::$er),'small').n();

    //display the final result
    echo tagb('body',$ret);

    //not useful
    //echo '</html>';

