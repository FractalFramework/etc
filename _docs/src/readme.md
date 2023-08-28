dav's lib
© All rights reserved
release alpha

# simple and fast php project using dav's library

This package let create a simple website for publication of articles with comments.
It do not use any depandancie.
The Framework abilities are located in the dav's lib.

## Introduction

These stand-alone applications can be used independently of each other.

Many others are in the process of being published, stemming from the Philum (2002-2023) and Fractal (2015-2023) projects.

The challenge is to be able to offer a very light machine that can meet a wide range of simple requirements.

Other products have become too specialised for the general public.

Over the years we have developed very specific techniques, methodology, software architecture, protocols, habits and even indentation.

Please understand that in mathematics we don't use words but symbols, because operations are generalisations of cases of figures (noted ∀).

Here we will try to present all the aspects.
We hope that our work will help to get rid of Gafam products that are anti-creative :)

# Dav's lib

The general principle is to transfer settings to Json files.
We believe that everything (in the universe!) is just settings, and that applications located in the kernel do not need to be modified.

In general terms, we've been trying for many years now, and slowly, to ensure that code is untouchable, that it only produces arrays of variables, and that these can then be expressed in any way we want.

It is forbidden, for example, in dav libraries, to put html, alternations between html and php, hard text, annotations, or any other special feature.

## Generalities

We use short names of classes and methods, with no namespaces and no injections of depandancies.
The names of the methods is related to the class, and theses names are "classics".

So, the `::call()` is the point of enter in a class (seen by user), and it generally call a `::build()`.
And `::build()` generally call a `::play()`, who generally call an `::read()`.
Sometime we use a `::com()` instead of the `::call()` for internal queries (like ajax).

`::js()` will be reserved in the future pour injections of javascript.
`::admin()`, `::install()`, `::home()` and `::api()` are also reserved for futures improvments.

### Variables naming convention

You will be surprized, but we use short names of variables.
You will not be surprized if i say i was sometimes fired from jobs for using this very beautiful protocole :)

- historically, `$p` an `$o` were the two-only variables as strings for each methods in all the code (Philum). Later `$p` became the only-array-variable used for all the methods. Understand the methods are called from the user and from the system ; from the url and from Ajax.

- `$d` was a reason to fire me. Let me just say it mean "any *data*".
- `$k=>$v` currently become more used theses days. Finally. (*key*, *value*).
- `$n` is a *number*.
- `$i` is an *iteration* (you should know; iteration is your friend).
- `$a,$b,$c` is currently (in etc project) the base name of the *gets* `$g`, which is an array.
- `$e` is a result like `$ex` (*exists*) or `$er` (*error*).
- `$f` is a *file*
- `$g` is the *gets*
- `$h` is an *holder* or a placeholder, of the famous *height*, following the context.
- `$j` is the command for ajax. It following a strict protocole in itelf.
- `$l` is the *length*
- `$m` sometime used for the *max*
- `$o` all the time used for any *option*
- `$p` is the most-famous *parameter*, the array of all in the universe
- `$q` could be a query, but we use `$sq` for the array of the `sql::read()`, and `$sql` if it is a string
- `$r` most famous of all, this is the evident *array* in the code. You will understand. His littles brothers are numerous : `$rb`, `$rc` the second and third transformations of `$r` (`$rd`, `$re`...). `$ra` is used like the `$r` number zero, before the `$r`, or anything who must be known before use.
- `$ra` is the premisse. It's like the god egyptian Râ. 
- `$s` is a *splitter*
- `$t` is a *title*
- `$u` is an *urm*
- `$w` is the *width*
- `$x` will conduce to a closure
- `$z` we never uzed that

### Function naming convention

And now, we also add now variables for classical functions :
- `α()` the alpha function is the point of enter
- `φ()` the phi function is for iterative things (because you know i have discovered alone that 1+1/this=φ)
- `π()` the pi function is the builder, a constructor of the rality, when datas become information.
- `ψ()` the psi function is used to inject a modulation in the alogythm. It's the divine intervention of the thought.
- `ω()` omega functions are used to finalize a processus. Like if you send the work to the sea (the *views*).

### Array naming convention

It's sad to say but it could have a name for each types of existing arrays.
So we have gave a name for the most often used of them.
Understand the terms :
- key, value : alphanumerical
- num : numerical
- count : result of operation
- values : all the columns

- `a` is an associated array 
- `w` assume numerical keys
- `r` numerical keys, but also *fetch_bot* in sql
- `v` it's not an array, idiot, sql call only one variable
- `k` will stack the keys as if they are similar, and the value will count the duplicates
- `ra` num=>values (*fetch_num*)
- `rr` num=>values (*fetch_both*)
- `rv` num=>value
- `kv` key=>value
- `kk` key=>key=>count
- `vv` num=>[value1,value2]
- `kr` key=>num=>value
- `kkv` key=>key=>value
- `kkk` key=>key=>key=>count
- `kvv` key=>[value1,value2]
- `kkr` key=>key=>num=>value 
- `krr` key=>num=>array
- `kx` key=>array of explode value by "/"

### Ajax protocole

All the action on the page can be resolved from an ajax command (*com*).

`bj()` is the button to call an ajax command.
`bt()` call an html *button* and `btj()` a simple *javascript button*.
`bh()` we will see that after.

`bj()` need two parameters, usually, the first is `$t`and the second is `$j`.
`$j` is composed like that : `target,tg2|class,method|a=1,b=2|inp1,inp2`, where :

- The target is the place for the result. Several targets can be used, so the javascript will render an Json.
- The com is the command, directly of the *class*, with the method "*call*" by default. Differents ways are possible and used to secure the access to some classes.
- The parameters "in hard" are usefull and will be concatened in the final post.
- The inputs in the page can be from every type, the ajax motor will understand that.

Several styles of treatments of the results can be entrusted to javascript before to inject them in the page. That will appear later.

## css

These few lines of code build css sheets from Json definitions.

    {
        "body":{
            "background-color":"#444",
            "font-family":"arial",
            "color":"#ddd"
        },
        "a":{
            "cursor":"pointer"
        }
    }

## head

This buil the header, nd by extension all the html page with standards définitions located in a Json file.
The protocole is based on the View logic.

- Some parameters are simples tags [k=>v type of parameters]
- Some parameters are adapted tags [array of two parameters]
- Some parameters are simples strings [unique parameter]

This is enough to launch the classic headers, although they can be adapted.

    [
        {
            "tagb":["title","hello"]
        },
        {
            "link":["shortcut icon","/favicon.ico"]
        },
        {
            "css":"styles"
        },
        {
            "js":"lib"
        },
        {
            "js":"ajax"
        }
    ]

## json

Simply calls json definitions from a public/json directory (by default).

Used by some other libraries.

## lib

Lib is a suite of first-level functions, not encapsulated in a class, that can be accessed quickly and anywhere.

Calling the lib launches all the devices that make the software operational, including the autoload.

These are classic methods, made useful by the use of Php, which extend Php, or which add a little spice to the design of the code.

There are two levels of objects in the lib, those that are universal and those that are very specific to the dav library.

The latter have the sole aim of speeding up code composition, in particular by avoiding the need to write html.

This resolve all the html cases :

    function atr($r){$ret=''; if($r)foreach($r as $k=>$v)if($v)$ret.=' '.$k.'="'.$v.'"'; return $ret;}
    function tag($b,$p,$d){return '<'.$b.atr($p).'>'.$d.'</'.$b.'>';}

Ajax buttons are also dependent on javascript files.

This is also where you'll find the ses:: class, which is used to store data during programme execution, in particular errors, so that they can be presented at the end and displayed at the top of the page.

### Features

The lib contains classical functions as:
- motor html
- filters for treatment of strings
- gets and ses
- treatments of vars
- operations on directories and files
- operations on strings

In the Core (a level up) there is some constructors:
- build a table
- `voc()` and `ico()`, attached to a json base, give all the verbose for the software
- `auth()` and `cnfg()`, attached to a json base, give global parameters for the software
- constructors of unique id and random id
- the class of storage of vars during the exectution
- tools for the dev

## login

It's a simple class who resolve the moment of the authentification.
Login, logout, register, recognize, auth, etc.
We were the first to porpose, by laziness, to allow an unrecognized user to register, and to make him logged in as soon as the registration is completed. It's funny.

## sql

Woooo...

I know i know, you have never seen that.

We think the usage of quaries chould be extremely generalized and never scattered in the code.
It's a general principle of the dav's lib that everything should be centralized.

Generalization of the queries let approach yopur conception from the motor of an Api.
The Api can be queried in any way on any topic.

So the protocole is strict, multiple, complex, and it can be used in one or another level of complexity, or if you really want, with no complexity at all, usique `sql::rq()`.

`sql::call()` will use the basic dispositions for render a result with arrays's protocole, from a classic query.

`sql::read()` is our friend. It use the two protocoles, the one of the arrays, and the one of the construction of a prepared query from an array.

## Boot

The sql motor is loaded one time for ever. And closed and the end of the script.
The codes of connection to the database does not roam freely in the code.

`new sql(['localhost','root','dev','etc']);` where we have host, name, password and basename.

We can switch of basename during the script.

## Db

We can create and modify a database : 

    $db=['name'=>'var','role'=>'int','mail'=>'var','pswd'=>'password','slogan'=>'var','logo'=>'var'];
    sql::create('admin',self::$db,1);

For each table, the `id` is implicit.

We chan change the names of the columns, it will understant that.

The conventions for the columns are :

- `int` int(11)
- `bint` bigint(36)
- `dec` decimal(20,20)
- `float` float(20,2)
- `double` double
- `var` varchar(255)
- `bvar` varchar(1020)
- `svar` varchar(60)
- `tiny` tinytext
- `text` mediumtext
- `long` longtext
- `date`date
- `time` datetime
- `json` json

We can call the types of the cols from a table, and let the Sql motor to judge if the data that wants to be recorded conforms. 

## view

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

### Connectors

Another way to write the template, historically, was to use the connectors: `[id=content|$content:div]`.
It's much more elegant. But nesting is harder to read.
And also we need to use some editable variables for external applictions.
Using connectors was as fast as the execution of View (we tested if, of course).
So it's add a step in the construction, and actual way to represent tags, in Json, is a lower level than uing the connectors.

### More

The issue of the template is how to nest them.

We want a basic template, on which we graft other templates, themselves potentially composed of still other templates.

In the previous example, tags can be imbricated. In the same way, templates can be imbricated. *Iteration is you friend*.

## todo

The needed variables of a template should be know by the software.
Differents solutions exists for that, and differents architectures and ideas.
You can see them in the readme of the json folder.
But we simply add a function to recap them ad assume to fill all variables.

### In a far past...

Using connectors we have resolve a problem an interesting problem : the absence of variable could cancel the building of the tag. That is no more possible today.

## Js

`ajax.js` contains the ajax motor, which is very simple for the moment.
`lib.js` contains only short tools and the famous `updateurl()`, who understand urls like ajax commands, and reciprocally, adapt the current url to the loaded ajax from the page. It makes navigation silkier...

