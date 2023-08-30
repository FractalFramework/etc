## Overview

This is a templater.

It not need anything else than itself to work.

    //we call the template
    $ra=json::call('views/index');

    //we call the variables
    $r=app::call($p);

    //we build the view
    $ret=view::com($ra,$r);`

More simple, `::call()` do all that :

`view::call($a,$r,0)` where `$a` is the name of the template, `$r` is the datatset, and `$o` let save the html if you want to use it with another templater, like Twig. At less you can build your html lke that :)

For your information, a templater is not a complex thing. It deleguate the render of the datas in an external process, the templater.

Actually, the templater consists only in that code :

    static function build($r,$ra,$rc){$ret='';
    foreach($r as $k=>$v){[$c,$p,$d]=$v;
        if(is_array($d))$d=self::build($d,$ra,$rc);
        else $d=str_replace($rc,$ra,$d);
        if($p)foreach($p as $ka=>$va)
            $p[$ka]=str_replace($rc,$ra,$va);
        $ret.=tag($c,$p,$d)."\n";}
    return $ret;}

It uses `tag()` function, which build the html.

The json used as definitions of the structure of the html, looks like this :

    [
        [
            "div",
            {"id":"content"},
            "{content}"
        ]
    ]

That create a `tag('div',['id'=>'content'],$content)`.
Which finally constructs the html : `<div id="content">$content</div>`.
Where `$content` is a variable.

So, to imbricate tags in tags, we have to replicate this structure instead of `$content`.

## Functions

- `file($a)` -- used in : `view::vars`, `view::trigger`
- `vars($r)` -- used in : `view::vars`, `main::read`
- `trigger($a)` -- used in : `view::vars`, `view::save`
- `save($a,$d)` -- used in : `view::vars`, `view::save_html`
- `save_html($a)` -- used in : `view::vars`, `view::call`, `main::read`
- `build($r,$ra,$rc)` -- used in : `view::vars`, `view::save_html`, `view::build`, `view::com`
- `com($r,$ra)` -- used in : `view::vars`, `view::call`, `main::read`
- `call($a,$ra)` -- used in : `posts::read`, `posts::stream`, `tracks::edit`, `tracks::read`, `tracks::stream`, `tracks::call`, `blocks::banner`, `blocks::nav`, `blocks::home`
