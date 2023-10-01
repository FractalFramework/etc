etc by dav
© All rights reserved
release alpha

# simple and fast php project using dav's lib

This package let create a simple website for publication of articles with comments.
It use no depandancies.
The kernel is located in `/_`.
The core determines the chosen architecture.
Tha app folder is a free place to create anything.

## Introduction

This is an exercice for a microcms based of the dav's lib.
It must display articles, list of articles, a contact, a login, and some attempted features for a personal website.

## Navigation by state

The sate navigation consiste to never change the current page, but only the needed contents.
Howover, you can go back and forward in the navigation of your browser. 

The `core` roots calls from url and from ajax in the same way.
If you call a page from a button, it call ajax, and dispay the logic url.
If you are freshly coming with tat url, it will find the associated action.

It's a full-ajax framework.

## Structure of the directories

- /img
- /public/json
- /src/_ (kernel)
- /src/app
- /srv/core

Either:

- `public/json` here are all the settings
- `src/_` don't have to be modified.
- `src/core` don't have the vocation to be modified, but can be modified.
- `src/apps` can be added, modified or deleted freely.

## Rules of indentation

Please note we *do not* respect the Psr-4 for superior reasons.

The rules are :
- no unusefull spaces or tabs
- short names without cases
- autodoc of names of variables (follow the rabbit)
- standardized names : each name have it's own meaning

See more in `_docs/technotes.md`.

## How it's works

General path of actions :

- build the datas
- algorithmics
- render

## Architecture

The software build results to place in the main container of the index.html.

The sequence of calls is :
- index.php | ajax.php
- public/index.php : boot the framework
- src/core/main.php : build the main page
- src/core/blocks : roots the calls
- src/app/(etc.) : called action, from url or from ajax.

## Json

If a system is a stack of layers, from the kernel to the surface layer (kernel, core, app), configurations are delegated in Json files.

They concern all the software layers:

- general config, used by the kernel
- css, headers and settings of mysql tables
- verbose and icons
- templates

## Kernel

The kernel is a set of classes which depend each other.
they are designed to be as independent as possible.
They sometimes depend on the general configuration.

Here are some of his skills :

### Sql

The Sql system concentrate all the actions in a machine to build requests, from arrays commands.
It's the better way to keep a global control on all the requests of the application.
Also, your application become *de facto* callble by an Api.

### Db

The tables, columns and types of columns are set in a Json file.
Any modification of the table will be *repaired* by the application.
So you must/can make evoluate the structure of your table from the Json file.

### Heads

The header is following a system of constrution from parameters in Json.
You only have to change theses parameters.

### Css

The Css are built from Json parameters.
You only have to change theses parameters.
Css sheets are cached.

## View

View is the templater.
It uses it's own protocole to transform recursive arrays in html tags.
The Json template cas receive {variables} that will be detected and reserched by the rooter (blocks).

## Voc

The verbose is entirelly externalized in a Json file.
You only have to add new terms, or translate them.
It's the same for the icones.

## Edit

This component will just build forms from tables definitions, to edit them automatically.

## Forms

This component will build any form from instructions given in an array.

## Str

It's a compilation of usefull operations on strings.

## Lib

It's the core of the kernel.
These are functions of the level zero.
See more in `_docs/md/src/lib.md`.

The full details of all classes is in `_docs/md/readme.md`

# contact

## Overview

Module to display a form for contects.
It will use the table `contacts`.

## Functions

- `save($p)`
- `read($p)` -- used in : `admin::call`
- `call($p)`

# posts

## Overview

Standalone application for the Posts.
The edition is on-place.
The upload is as fast as 'paste'.

## Functions

- `usrart($id)` -- used in : `tracks::save`, `conns::profile`, `conns::socials`
- `catid($a)` -- used in : `posts::save`
- `content($p)` -- used in : `conns::read`
- `del($p)`
- `save($p)` -- used in : `posts::create`
- `update($p)`
- `create($p)`
- `datas($p)` -- used in : `posts::read`, `posts::stream`
- `read($p)` -- used in : `posts::save`, `posts::create`, `posts::call`
- `stream($p)` -- used in : `posts::call`
- `call($p)`

# test

## Overview

n/a

## Functions

- `md($p)` -- used in : `test::call`
- `jaja()`
- `jajax()` -- used in : `test::call`
- `call($p)`

# tracks

## Overview

Standalone application for the commentaries.

## Functions

- `del($p)`
- `edit($p)`
- `register($p)` -- used in : `tracks::save`
- `save($p)`
- `form($a)` -- used in : `tracks::call`
- `read($p)` -- used in : `tracks::save`
- `stream($p)` -- used in : `tracks::call`
- `call($p)` -- used in : `posts::read`, `blocks::shutter`

# build

## Overview

It's a sum of useful builders

## Functions

- `popup($d,$t)`
- `pagup($d,$t)`
- `tabler($r,$h='',$keys='',$frame='')` -- used in : `contact::read`, `dbedt::play`, `docs::vue`, `docs::find_func`, `docs::count_cases`, `docs::rapport`, `edit::play`, `admin::pending_tracks`, `admin::pending_posts`
- `tabs($r,$id='tab1',$c='')` -- used in : `admin::user`, `admin::call`
- `playr($r,$c='',$o='')` -- used in : `build::playr`, `build::tree`
- `tree($r,$c='',$o='')` -- used in : `docs::see2`, `docs::see`
- `mkli($r,$ul='ul')` -- used in : `conns::list`, `conns::numlist`
- `scroll($d,$max=10,$w='',$h='',$id='')`
- `writecsv($f,$r)` -- used in : `build::csvfile`
- `readcsv($f)`
- `csvfile($f,$r,$t='')` -- used in : `docs::vue`
- `etc($d,$n=200)`
- `btpages_nb($nbp,$pg)` -- used in : `build::btpages`
- `btpages($nbyp,$pg,$nbarts,$j)`
- `download($f,$t='')` -- used in : `build::audio`
- `audio($d,$t='')`
- `video($d,$w='',$h='',$o='')`
- `iframe($d,$w='',$h='',$o='')` -- used in : `conns::youtube`
- `editable($r,$j,$h=[],$edk='',$no=[])` -- used in : `dbedt::play`, `dbedt::read`, `jedt::addrow`, `jedt::edit`
- `ftp($d)` -- used in : `build::ftpchmod`
- `ftpchmod($f,$n)` -- used in : `test::call`

# conn

## Overview

The Connectors are a way to write html from a simplified way, using hooks.
Comparatively to markdowns, it's an higer level.

In essence, `:tags` can be any application, in addition to the usual html tags.
Connectors are assigned a single parameter.

So you can call the 'bold' connector `[hello:b]` as well as a more advanced application such as `[hello|red:color]`.

The `[://liens.com]` are automatically detected and interpreted if they are images, videos or social links.

It is therefore possible to attach any application from a command located in the body of a content item.

List of connectors: /json/lang/conn.json.

### History

Connectors are the mathematical name for operators, which even the simplest and most common ones ("+", "/") are algorithms.

## Usage

We can call any treatment of the connectors, particulary for ebooks or to build markdowns.

## Call

`conn::call(['txt'=>$txt,'m'=>$modulo,'id'=>$artid,'parser'=>'conn::connectors','nop'=>0]);`

The parameter `$nop` will say "no p-tags".

## Functions

- `cprm($d)` -- used in : `conn::poc`
- `poc($da)` -- used in : `conn::connectors`
- `parser($d,$p=[],$e='conn::connectors')` -- used in : `conn::parser`, `conn::build`, `conns::md`
- `embed_p($d)` -- used in : `posts::content`, `conn::build`, `conns::md`
- `markdown($da,$rp)`
- `connectors($da,$rp=[])`
- `build($p)` -- used in : `posts::update`, `posts::read`, `test::md`
- `call($p)`

# conv

## Overview

Converts Html into Connectors.

## Call

`conv::call(['txt'=>$txt]);`

## Functions

- `repair($d)`
- `md2conn($d)` -- used in : `test::md`, `conns::md`
- `tags($tag,$atb,$d)` -- used in : `conv::parse`
- `cleanhtml($d)` -- used in : `conv::build`
- `cleanconn($d)` -- used in : `conv::build`
- `ecart($v,$a,$b)` -- used in : `conv::recursearch`, `conv::parse`
- `recursearch($v,$ab,$ba,$tag)` -- used in : `conv::recursearch`, `conv::parse`
- `parse($v,$x='')` -- used in : `conv::parse`, `conv::build`
- `build($p)` -- used in : `posts::update`
- `call($p)`

# css

## Overview

Write css files from Json definitions, in `public/json/css/lib.json`.

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

## Call

From the index, before to reports `lib` in the config of the headers, it's build, if needed, the css-file like that :

`css::build('lib');`

## Functions

- `file($a)` -- used in : `css::trigger`, `css::build`
- `trigger($a)` -- used in : `css::save`
- `save($a,$d)` -- used in : `css::build`
- `read($r)` -- used in : `css::read`, `css::build`
- `build($a)`

# db

## Overview

We can create and modify a database on-the-fly: 

    $db=['name'=>'var','role'=>'int','mail'=>'var','pswd'=>'password','slogan'=>'var','logo'=>'var'];
    sql::create('admin',self::$db,1);

For each table, the `id` and the `lastdate` are implicit.

We can change the names of the columns, it will understant whot to do.

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

## Connection with Sql

The Sql motor will verify if the requests are conform to the known types ot the columns.

## Location of the definitions

`public/json/cnfg/db.json`

## Functions

- `jsoncolfromattr($b,$c,$k)`
- `modifjsonvar($b,$c,$k,$v,$q='')`
- `create_cols($r)` -- used in : `db::create`
- `cleanup($r)` -- used in : `db::type_cols`
- `cols($b,$n='')` -- used in : `db::type_cols`
- `type_cols($b)` -- used in : `db::trigger`
- `trigger($b,$ra)` -- used in : `db::create`
- `create($b,$r,$up='')`
- `table($b)`
- `cols_r($b)` -- used in : `db::cols_k`, `dbedt::read`, `edit::create`, `edit::edit`, `edit::entries`, `sql::integrity`
- `cols_k($b)` -- used in : `db::cols_s`, `dbedt::upd`, `dbedt::play`, `edit::save`, `edit::update`, `edit::play`, `sql::alex`, `sql::combine`
- `cols_s($b)` -- used in : `sql::sqcl`
- `install($b,$z=0)`
- `install_all()` -- used in : `boot::call`
- `call()`

# dbedt

## Overview

We can create and modify a database on-the-fly: 

    $db=['name'=>'var','role'=>'int','mail'=>'var','pswd'=>'password','slogan'=>'var','logo'=>'var'];
    sql::create('admin',self::$db,1);

For each table, the `id` and the `lastdate` are implicit.

We can change the names of the columns, it will understant whot to do.

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

## Connection with Sql

The Sql motor will verify if the requests are conform to the known types ot the columns.

## Location of the definitions

`public/json/cnfg/db.json`

## Functions

- `upd2($p)`
- `upd($p)`
- `play($p)` -- used in : `dbedt::read`
- `read($p)` -- used in : `dbedt::call`
- `entries($a)` -- used in : `dbedt::read`
- `menu()` -- used in : `dbedt::call`
- `call($p)` -- used in : `admin::user`, `admin::call`

# docs

## Overview

Application which references classes and functions, and their links, in two tables `_prog` and `_progr`.

It produces csv files for data-visualisation of the programme.
And it can produce the software's automatic documentation (*botdoc*).

## Functions

- `doc()` -- used in : `docs::find_func`, `docs::count_cases`, `docs::read`
- `iter2($ka)` -- used in : `docs::see2`
- `see2($p)` -- used in : `docs::find_func`, `docs::count_cases`, `docs::read`
- `iter($ka)` -- used in : `docs::iter2`, `docs::iter`, `docs::see`, `docs::mktree`, `docs::funcsee`
- `see($p)` -- used in : `docs::find_func`, `docs::count_cases`, `docs::read`
- `vue()` -- used in : `docs::find_func`, `docs::count_cases`, `docs::read`
- `save2($r)` -- used in : `docs::mktree`
- `unused($r,$rb)` -- used in : `docs::mktree`
- `find($d,$fc)` -- used in : `docs::arbo`
- `arbo($r)` -- used in : `docs::mktree`, `docs::functree`
- `mktree($a,$b)` -- used in : `docs::find_func`, `docs::count_cases`, `docs::read`
- `funcsee($r)` -- used in : `docs::find_func`, `docs::count_cases`, `docs::build`
- `functree($r)` -- used in : `docs::find_func`, `docs::count_cases`, `docs::build`
- `save($p,$r)` -- used in : `docs::find_func`, `docs::funcnt`
- `find_func($d,$fc)` -- used in : `docs::find_func`, `docs::funcnt`
- `'.$fc.'(')`
- `funcnt($p,$r)` -- used in : `docs::find_func`, `docs::funclist`
- `funclist($r)` -- used in : `docs::find_func`, `docs::count_cases`, `docs::build`
- `count_cases($a,$va)` -- used in : `docs::find_func`, `docs::count_cases`, `docs::occurrences`
- `occurrences($dr,$r)` -- used in : `docs::find_func`, `docs::count_cases`, `docs::funcount`
- `funcount($r)` -- used in : `docs::find_func`, `docs::count_cases`, `docs::build`
- `analys($d)` -- used in : `docs::find_func`, `docs::count_cases`, `docs::')!==false)$rf[]=between`, `docs::capture`
- `')!==false)$rf[]=between($v,'function ','(')`
- `capture($r,$dr='')` -- used in : `docs::find_func`, `docs::count_cases`, `docs::')!==false)$rf[]=between`, `docs::capture`, `docs::build`
- `rapport($r,$p)` -- used in : `docs::find_func`, `docs::count_cases`, `docs::build`
- `build($p)` -- used in : `docs::find_func`, `docs::count_cases`, `docs::read`
- `state($d)` -- used in : `docs::mktree`, `docs::find_func`, `docs::count_cases`, `docs::build`, `docs::call`
- `read($p)`
- `menu($p,$o)` -- used in : `docs::find_func`, `docs::count_cases`, `docs::call`
- `call($p)`

# edit

## Overview

Permet de produire des formulaires d'après les définitions des tables.

## Call

`edit::call(['a'=>$tablename,'b'=>'play'|'edit'|'create','c'=>$id]);`

## Functions

- `save($p)`
- `update($p)`
- `create($p)`
- `edit($p)`
- `play($p)`
- `read($p)` -- used in : `edit::call`
- `entries($a,$b,$c)` -- used in : `edit::read`
- `menu($a,$b,$c)` -- used in : `edit::read`
- `list()` -- used in : `edit::call`
- `call($p)`

# form

## Overview

Produce a formated form from definitions and array of values.

## Call

`form::call(['name'=>'var','age'=>'int'],['name'=>'bob','age'=>'18']);`

## Functions

- `tabler($r)`
- `build($r)` -- used in : `form::call`
- `call($ra,$r=[])` -- used in : `edit::create`, `edit::edit`, `jedt::create`

# head

## Overview

Build the header, using with standards définitions and parameters from `public/json/cnfg/head.json`.
The protocole is based on the templater `View`.

- Some parameters are simples tags `[k=>v type of parameters]`
- Some parameters are adapted tags `[array of two parameters]`
- Some parameters are simples strings `[unique parameter]`

This launch the classic headers :

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

## Call

From the index :

    head::json('cnfg/head');
    echo head::run();

## Functions

- `add($k,$v)`
- `json($a)`
- `ra($r)`
- `meta($d,$v,$c='')`
- `csslink($d)`
- `jslink($d)`
- `csscode($d)`
- `jscode($d)` -- used in : `head::relod`
- `css($d)`
- `js($d)`
- `link($d,$v)`
- `relod($v)`
- `build()` -- used in : `head::call`, `head::get`
- `html($lg='fr')` -- used in : `head::run`
- `run($lg='fr')` -- used in : `head::page`
- `page($d,$lg='fr')`
- `call($r=[])`
- `get()`

# img

## Overview

Download images from web, [forms], and base64.
The image are renamed locally.
No backup of the original source id actually operated.
Build thumbnails of beggest files.
The images are located in `/img`.

## Functions

- `b64img($u)` -- used in : `conv::tags`
- `imgthumb($f)`
- `getim($f,$w=240,$h=180)` -- used in : `conv::tags`
- `scale($w,$h,$wo,$ho,$s)` -- used in : `img::thumb`
- `thumb($in,$out,$w,$h,$s)` -- used in : `img::imgthumb`, `img::getim`
- `alpha($img)` -- used in : `img::thumb`

# jedt

## Overview

Download images from web, [forms], and base64.
The image are renamed locally.
No backup of the original source id actually operated.
Build thumbnails of beggest files.
The images are located in `/img`.

## Functions

- `addnew($a,$v)`
- `update($a,$k,$col,$val)` -- used in : `jedt::modif`
- `save($p)`
- `create()`
- `modif($p)`
- `artype($r)` -- used in : `jedt::edit`
- `addrow($p)`
- `edit($p)`
- `savext($p)`
- `editxt($p)` -- used in : `jedt::edit`
- `bt($v)`
- `itermenu($ka,$r,$rt=[])` -- used in : `jedt::itermenu`, `jedt::menu`
- `menu()` -- used in : `jedt::call`, `admin::call`
- `call($p)`

# json

## Overview

Calls json definitions from the `public/json` directory (by default).
Used by some other libraries.
Let edit these files.

## Call

`json::call('cnfg/vars');`

## Functions

- `file($a)` -- used in : `view::vars`, `view::trigger`, `css::trigger`, `jedt::addnew`, `jedt::update`, `jedt::savext`, `jedt::editxt`, `json::err`, `json::call`
- `error()` -- used in : `json::err`
- `err($r,$a='')` -- used in : `json::build`, `json::call`
- `build($r)`
- `call($a)` -- used in : `view::vars`, `view::save_html`, `view::call`, `css::build`, `db::table`, `db::install_all`, `head::json`, `jedt::modif`, `jedt::addrow`, `jedt::edit`, `boot::cnfg`, `conns::connbt`, `main::read`, `nav::datas`

# login

## Overview

It's a simple class who resolve the moment of the authentification.
Login, logout, register, recognize, auth, etc.
The main `recognize` is used in the boot, and use a cookie named `uid`.
We were the first to purpose, by laziness, to allow an unrecognized user to register, and to make him logged in as soon as the registration is completed. It's funny.

## Functions

- `hash($d)` -- used in : `login::register`
- `vrfpsw($d,$hash)` -- used in : `login::response`
- `uid($a)` -- used in : `tracks::register`, `login::register`
- `register($p)` -- used in : `login::port_register`
- `firstuser()` -- used in : `login::register`
- `form($p)` -- used in : `login::call`
- `response($p)` -- used in : `login::call`
- `identify($id='')` -- used in : `tracks::register`, `login::register`, `login::response`, `login::recognize2`, `login::recognize`
- `resetpsw()`
- `resetip()`
- `recognize2()`
- `recognize()` -- used in : `boot::call`
- `logout()` -- used in : `login::port_logout`
- `loged()` -- used in : `login::call`
- `call($p)` -- used in : `login::port`
- `port_register($p)`
- `port_logout($p)`
- `port($p)`

# sql

## Overview

Woooo...

I know i know, you have never seen that.

We think the usage of queries could be extremely generalized and never scattered in the code.
It's a general principle of the dav's lib that everything should be centralized.

Generalization of the queries let approach yopur conception from the motor of an Api.
The Api can be queried in any way on any topic.

The request need to ask, in this order :

- the columns (string)
- the table (string)
- the type of variables attempted (string, see below)
- the Com of the request (array, see below)

## Array naming convention

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

### Com convention

Asking `['category'=>'public']` will say : `where category="public"` (through the Pdo).
Multiple asks are considerated as `AND` by default.
First character of the column can give instruction :

- `_order`, `_group`, `_limit` : limitators
- `<col`, `>col`, `<=col`, `>=col` : comparaisons
- `!col` : different of
- `#col` : 'like'
- `&col` : between ['a','b']
- `(col` : in ['a','b']

## Call

### read

Read `v` value 'content' from `posts` with id `$id` :

`sql::read('content','posts','v',['id'=>$id]);`

### Read sql brut

`sql::rq('select * from posts');`
`sql::call('select * from posts','rr');`

### Save

`sql::sav('posts',[ses('uid'),$catid,$title,$excerpt,$content,$state],0);`

The last parameter `0` is the verbose of the action, used in dev.

## Functions

- `__construct($r)`
- `dbq()` -- used in : `sql::__construct`, `sql::rq`
- `rq()` -- used in : `sql::qr`, `sql::prep`, `sql::read2`, `sql::call2`, `sql::com`
- `qrr($r)`
- `qra($r)`
- `qrw($r)`
- `qr($sql,$z='')` -- used in : `db::jsoncolfromattr`, `db::modifjsonvar`, `db::create`, `sql::inner`, `sql::call`, `sql::backup`
- `format($r,$p)` -- used in : `sql::read`, `sql::read2`, `sql::inner`, `sql::call`
- `where($r)` -- used in : `sql::mkq`, `sql::read`, `sql::upd`, `sql::inner`
- `sqcl($d,$b)` -- used in : `sql::read`, `sql::read2`, `sql::inner`
- `mkv($r)` -- used in : `sql::sav`, `sql::sav2`
- `mkvk($r)` -- used in : `sql::upd`
- `mkvr($r)`
- `mkq($r)` -- used in : `db::modifjsonvar`, `sql::read2`
- `mkvq($r)` -- used in : `sql::sav2`
- `see($sql,$r)` -- used in : `sql::prep`, `sql::inner`
- `fetch($stmt,$p)` -- used in : `sql::read`, `sql::read2`, `sql::inner`, `sql::call`, `sql::call2`
- `bind($stmt,$r)` -- used in : `sql::prep`
- `prep($sql,$r,$z='')` -- used in : `sql::read`, `sql::sav`, `sql::sav2`, `sql::upd`, `sql::inner`
- `read($d,$b,$p,$q,$z='')` -- used in : `contact::read`, `posts::usrart`, `posts::catid`, `posts::content`, `posts::create`, `posts::read`, `posts::stream`, `tracks::edit`, `tracks::call`, `dbedt::upd2`, `dbedt::play`, `dbedt::read`, `dbedt::entries`, `docs::doc`, `docs::see2`, `docs::see`, `docs::vue`, `docs::mktree`, `docs::find_func`, `docs::count_cases`, `docs::state`, `edit::create`, `edit::edit`, `edit::play`, `edit::entries`, `login::uid`, `login::firstuser`, `login::response`, `login::resetip`, `login::recognize2`, `sql::alex`, `sql::ex`, `admin::pub`, `admin::user`, `blocks::bkg`, `blocks::banner`, `conns::twalter`, `conns::art`, `conns::read`, `conns::socials`
- `read2($d,$b,$p,$q,$z='')`
- `alex($b,$r)` -- used in : `sql::sav`
- `combine($b,$r)` -- used in : `sql::sav`
- `integrity($b,$r)` -- used in : `sql::sav`
- `complete($r)` -- used in : `sql::sav`
- `sav($b,$q,$z='')` -- used in : `contact::save`, `posts::catid`, `posts::save`, `tracks::register`, `tracks::save`, `docs::save2`, `docs::save`, `edit::save`, `login::register`
- `sav2($b,$q,$z='')`
- `upd($b,$r,$q,$z='')` -- used in : `posts::del`, `posts::update`, `tracks::del`, `dbedt::upd2`, `dbedt::upd`, `edit::update`, `login::resetip`, `admin::pub`
- `inner($d,$b1,$b2,$k2,$p,$q,$z='')` -- used in : `posts::datas`, `tracks::read`, `tracks::stream`, `login::identify`, `admin::pending_tracks`, `admin::pending_posts`, `conns::profile`, `nav::defaults`
- `call($sql,$p,$z='')` -- used in : `db::cols`, `dbedt::menu`, `edit::list`, `sql::cols`
- `call2($sql,$p)`
- `com($sql)`
- `cols($b,$n='')` -- used in : `sql::combine`
- `drop($b)` -- used in : `db::trigger`, `db::create`, `sql::backup`
- `trunc($b)` -- used in : `docs::save`
- `setinc($b,$n)`
- `unikey($b,$d)` -- used in : `db::create`
- `show($b)`
- `ex($b)` -- used in : `sql::backup`
- `backup($b,$d='')` -- used in : `db::trigger`

# str

## Overview

Collection of filters for the strings.

## Functions

- `acc($o=1)` -- used in : `str::eradic_acc`, `str::lowcase`
- `eradic_acc($d)` -- used in : `str::normalize`
- `normalize_alpha($d,$o='')` -- used in : `str::normalize`
- `normalize_ext($d)` -- used in : `str::normalize`
- `normalize($d,$o='')` -- used in : `download::rednm`
- `numentities($d)`
- `clean_acc($d)` -- used in : `str::clean_punctuation`, `str::nicequotes`
- `clean_punctuation($d,$o='')` -- used in : `conv::build`
- `nicequotes($d,$o='')` -- used in : `str::clean_punctuation`
- `add_nbsp($d)` -- used in : `str::nicequotes`
- `mb_ucfirst($d,$e='utf-8')`
- `mb_uclet($d,$e='utf-8')`
- `lowcase($d)`
- `letcase($d)` -- used in : `str::lowercase`
- `lowercase($d)`
- `clean_lines($d,$o='')` -- used in : `str::clean_mail`, `str::clean_br`, `conv::build`
- `delspc($d)`
- `clean_whitespaces($d)` -- used in : `str::clean_lines`, `str::trim`
- `trim($d,$o='')` -- used in : `str::clean_lines`
- `clean_mail($d)`
- `clean_n($d)` -- used in : `conv::build`
- `clean_br($d)`

# view

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
- `call($a,$ra)` -- used in : `contact::read`, `posts::read`, `posts::stream`, `tracks::edit`, `tracks::read`, `tracks::stream`, `tracks::call`, `blocks::banner`, `blocks::home`, `nav::call`

# lib

## Overview

Contains the most used of basic functions for every site.

## Functions

- `n()`
- `br()`
- `hr()`
- `sp()`
- `st()`
- `thin()`
- `atr($r)`
- `tag($b,$p,$d)`
- `taga($b,$p)`
- `tagb($b,$d)`
- `tagc($b,$c,$d)`
- `lk($u,$v='',$c='',$p=[])`
- `img($d,$s='',$o='')`
- `div($v,$c='',$d='',$s='')`
- `span($v,$c='',$d='',$s='')`
- `block($v)`
- `h1($v)`
- `h2($v)`
- `h3($v)`
- `h4($v)`
- `li($v)`
- `atj($d,$j)`
- `bt($j,$pj,$v,$c='',$p=[])`
- `btj($j,$pj,$v,$c='',$p=[])`
- `bj($j,$v,$c='',$p=[])`
- `bg($j,$v,$c='',$p=[])`
- `bh($h,$v,$c='',$p=[])`
- `bjr($t,$j,$p,$v,$c)`
- `togjs($t,$d)`
- `togj($t,$com)`
- `input($d,$v,$s='',$p=[])`
- `hidden($d,$v)`
- `label($id,$t,$c='',$idb='')`
- `inputj($id,$v='',$ida='',$p=[])`
- `inpsw($d,$v,$s='',$p=[])`
- `inpnb($id,$v,$min='',$max='',$st=1)`
- `inpmail($id,$v='',$p=[])`
- `inpdate($id,$v,$o='',$min='',$max='')`
- `inpclr($id,$v='')`
- `inptel($id,$v,$pl='06-01-02-03')`
- `inprange($id,$v,$st=1,$min='',$max='')`
- `bar($id,$v=50,$st=10,$min=0,$max=100,$js='',$s='240px')`
- `progress($v='',$max=100,$w=240,$t='')`
- `checkbox($id,$v,$t,$ck='')`
- `radio($id,$r,$h)`
- `textarea($id,$v,$w='40',$h='4',$p=[])`
- `divarea($id,$d,$c='',$s='',$p=[])`
- `select($id,$r,$ck='',$o='',$js='')`
- `datalist($id,$r,$v,$s=34,$t='')`
- `submit($id,$v,$c='')`
- `form($id,$d,$c='',$p=[])`
- `delbr($d,$o='')`
- `deln($d,$o='')`
- `delr($d,$o='')`
- `delt($d,$o='')`
- `delnl($d)`
- `delsp($d)`
- `delnbsp($d)`
- `nbsp($d)`
- `delr_r($r)`
- `hed($d)`
- `gets()`
- `posts()`
- `get($k,$v='')`
- `post($k)`
- `get2($k)`
- `post2($k)`
- `cookie($d,$v=null)`
- `cookiz($d)`
- `ses($d,$v=null)`
- `sesz($d)`
- `sesx($d)`
- `sesmk($v,$p='',$b='')`
- `scandir_b($d)`
- `scandir_r($d,$r=[])`
- `scanfiles($d,$r=[])`
- `mkdir_r($u)`
- `rmdir_r($dr)`
- `curl_get_contents($f,$post=[],$json=0)`
- `getcurl($f)`
- `getfile($f)`
- `putfile($f,$d)`
- `ftime($f,$d='')`
- `fsize($f,$o='')`
- `opcache($d)`
- `day($p='',$d='')`
- `sqldate()`
- `time_ago($dt)`
- `strto($v,$s)`
- `struntil($v,$s)`
- `strfrom($v,$s)`
- `strend($v,$s)`
- `split_one($s,$v,$n='')`
- `split_right($s,$v,$n='')`
- `active($d,$v)`
- `val($r,$k)`
- `vals($r,$ra)`
- `valk($r,$ra)`
- `arr($r,$n='')`
- `prm($p)`
- `expl($s,$d,$n=2)`
- `explode_k($d,$a,$b)`
- `implode_k($r,$a,$b)`
- `implode_j($d)`
- `in_array_k($d,$r)`
- `rdiv($r)`
- `walk($r,$fc)`
- `alert($d,$c='blue',$o='')`
- `xt($d,$o=0)`
- `isimg($d)`
- `ishttp($d)`
- `ishtml($d)`
- `imgroot($d)`
- `usrroot($d)`
- `nohttp($f)`
- `domain($f)`
- `host()`
- `uip()`
- `voc($d)`
- `ico($d)`
- `icovoc($d,$b='',$c='')`
- `rid($p='')`
- `unid($p,$n=6)`
- `k($k,$v)`
- `r($k)`
- `z($k)`
- `err($v)`
- `usr($k)`
- `cnfg($k)`
- `auth($n)`
- `exc($d)`
- `chmodf($f)`
- `p($r)`
- `pr($r)`
- `eco($d)`
- `trace()`
- `out($r)`

# admin

## Overview

- article moderation
- comment moderation
- profile editing
- reading contact message

## Functions

- `pub($p)`
- `btswitch($id,$pub,$b)` -- used in : `admin::pub`, `admin::bt`
- `bt($id,$pub,$b='posts')` -- used in : `admin::pending_tracks`, `admin::pending_posts`
- `pending_tracks()` -- used in : `admin::call`
- `pending_posts()` -- used in : `admin::call`
- `apps()` -- used in : `admin::appsmenu`
- `appsmenu()`
- `user()`
- `call($p)`

# blocks

## Overview

It will roots the commands (from url or ajax) to the targeted action.
This action is located :
- as a block in this file (banner, footer, etc)
- a full app, named with his parameter app/param

At boot, it roots the commands from the main.php, who call a block for each attempted variable of the main template.
The `main` called action (who would call `main` in loop), is replaced by his parameter, as the name of the called action. (a,b,c => a,b, with a=b and b=c).

In substance, how it is built, all the actions will only have an impact on the `main` variable of the main template.
Actions on other containers of the main template can be given by ajax actions.

## Functions

- `bkg()`
- `banner($p)`
- `footer($p)`
- `shutter($p)`
- `home($p)`
- `forbidden()` -- used in : `blocks::call`
- `secure($a,$b)` -- used in : `blocks::call`
- `call($p)` -- used in : `main::read`

# boot

## Overview

The sql motor is loaded one time for ever. And closed and the end of the script.
The codes of connection to the database does not roam freely in the code.

`new sql(['localhost','root','dev','etc']);` where we have host, name, password and basename.

We can switch of basename during the script.

## Functions

- `cnfg()`
- `call()`

# conns

## Overview

Collection of sub-actions for Connectors.

## Call

`[:profile]`

## Functions

- `connbt($p)` -- used in : `conns::btedt`
- `btedt($p)` -- used in : `posts::read`, `conn::call`
- `trademark($d)` -- used in : `conns::lnk_tm`
- `lnk_tm($u,$t='',$ic='')` -- used in : `conns::lnk`, `conns::youtube`
- `dl($d,$t='')`
- `lnk($u,$t='')` -- used in : `conn::connectors`, `conns::socials`
- `twalter($u,$id,$o='')`
- `youtube($u,$t)`
- `video($u,$t)`
- `mp3($u,$t)`
- `mp4($u,$t)`
- `list($p)`
- `numlist($p)`
- `art($id,$t='')`
- `read($id,$o='')`
- `md($d,$o='')`
- `profile($id,$o='')` -- used in : `blocks::home`
- `socials($id,$o='')` -- used in : `blocks::home`
- `code($d)`

# main

## Overview

Main is the framework's central component.
Its architecture is such that the main page is built around content blocks, one of which, the `main`, is the target of all changes to the page.

The reader currently knows only one client, `index`, whose expected variables it associates with `blocks`.

## Functions

- `read($a,$g)` -- used in : `main::call`
- `call($g)`

# nav

## Overview

It's a simple class who resolve the moment of the authentification.
Login, logout, register, recognize, auth, etc.
The main `recognize` is used in the boot, and use a cookie named `uid`.
We were the first to purpose, by laziness, to allow an unrecognized user to register, and to make him logged in as soon as the registration is completed. It's funny.

## Functions

- `defaults()` -- used in : `nav::datas`
- `datas()` -- used in : `nav::call`
- `call($p)` -- used in : `login::port_register`, `login::port_logout`, `login::port`

# download

## Overview

n/a

## Functions

- `gz($f)`
- `file($f,$nmf)`
- `eye($f)`
- `rednm($d)` -- used in : `download::call`
- `call($p)`

generated by botdoc, 231001.1845