# admin

## Overview

- article moderation
- comment moderation
- profile editing
- reading contact message

## Functions

- pub($p)
- btswitch($id,$pub,$b)
- bt($id,$pub,$b='posts')
- waiting($b)
- jsonfiles()
- call($p)

# contact

## Overview

Module to display a form for contects.
It will use the table `contacts`.

## Functions

- save($p)
- read($p)
- call($p)

# posts

## Overview

Standalone application for the Posts.
The edition is on-place.
The upload is as fast as 'paste'.

## Functions

- catid($a)
- content($p)
- del($p)
- save($p)
- update($p)
- create($p)
- datas($p)
- read($p)
- stream($p)
- call($p)

# test

## Overview

n/a

## Functions

- md($p)
- call($p)

# tracks

## Overview

Standalone application for the commentaries.

## Functions

- del($p)
- edit($p)
- save($p)
- form($a)
- read($p)
- stream($p)
- call($p)

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

- banner($p)
- footer($p)
- shutter($p)
- nav($p)
- home($p)
- user()
- forbidden()
- call($p)

# boot

## Overview

The sql motor is loaded one time for ever. And closed and the end of the script.
The codes of connection to the database does not roam freely in the code.

`new sql(['localhost','root','dev','etc']);` where we have host, name, password and basename.

We can switch of basename during the script.

## Functions

- cnfg()
- call()

# conns

## Overview

Collection of sub-actions for Connectors.

## Call

`[:profile]`

## Functions

- bt($p)
- socialk($u,$d='')
- list($p,$o='')
- art($id,$t='')
- read($id,$o='')
- usrart($id)
- uid($a)
- profile($id,$o='')
- socials($id,$o='')

# main

## Overview

Main is the framework's central component.
Its architecture is such that the main page is built around content blocks, one of which, the `main`, is the target of all changes to the page.

The reader currently knows only one client, `index`, whose expected variables it associates with `blocks`.

## Functions

- read($a,$g)
- call($g)

# lib

## Overview

n/a

## Functions

- n()
- br()
- hr()
- sp()
- st()
- thin()
- atr($r)
- tag($b,$p,$d)
- taga($b,$p)
- tagb($b,$d)
- tagc($b,$c,$d)
- lk($u,$v='',$c='',$p=[])
- img($d,$s='',$o='')
- div($v,$c='',$d='',$s='')
- span($v,$c='',$d='',$s='')
- block($v)
- h1($v)
- h2($v)
- h3($v)
- h4($v)
- li($v)
- atj($d,$j)
- bt($j,$pj,$v,$c='',$p=[])
- btj($j,$pj,$v,$c='',$p=[])
- bj($j,$v,$c='',$p=[])
- bg($j,$v,$c='',$p=[])
- bh($h,$v,$c='',$p=[])
- input($d,$v,$s='',$p=[])
- hidden($d,$v)
- label($id,$t,$c='',$idb='')
- inpsw($d,$v,$s='',$p=[])
- inpnb($id,$v,$min='',$max='',$st=1)
- inpmail($id,$v='',$p=[])
- inpdate($id,$v,$o='',$min='',$max='')
- inpclr($id,$v='')
- inptel($id,$v,$pl='06-01-02-03')
- inprange($id,$v,$st=1,$min='',$max='')
- bar($id,$v=50,$st=10,$min=0,$max=100,$js='jumphtml',$s='240px')
- progress($v='',$max=100,$w=240,$t='')
- checkbox($id,$v,$t,$ck='')
- radio($id,$r,$h)
- textarea($id,$v,$w='40',$h='4',$p=[])
- divarea($id,$d,$c='',$s='',$p=[])
- select($id,$r,$ck='',$o='',$js='')
- datalist($id,$r,$v,$s=34,$t='')
- submit($id,$v,$c='')
- form($id,$d,$c='',$p=[])
- delbr($d,$o='')
- deln($d,$o='')
- delr($d,$o='')
- delt($d,$o='')
- delnl($d)
- delsp($d)
- delnbsp($d)
- nbsp($d)
- delr_r($r)
- hed($d)
- gets()
- posts()
- get($k,$v='')
- post($k)
- get2($k)
- post2($k)
- cookie($d,$v='')
- ses($d,$v=null)
- sesz($d)
- sesmk($v,$p='',$b='')
- arr($r,$n='')
- expl($d,$s,$n=2)
- vals($r,$ra)
- valk($r,$ra)
- explode_k($d,$a,$b)
- implode_k($r,$a,$b)
- implode_j($d)
- in_array_k($d,$r)
- strto($v,$s)
- struntil($v,$s)
- strfrom($v,$s)
- strend($v,$s)
- split_one($s,$v,$n='')
- split_right($s,$v,$n='')
- scandir_b($d)
- scandir_r($d,$r=[])
- scanfiles($d,$r=[])
- mkdir_r($u)
- rmdir_r($dr)
- curl_get_contents($f,$post=[],$json=0)
- getcurl($f)
- getfile($f)
- putfile($f,$d)
- ftime($f,$d='')
- fsize($f,$o='')
- opcache($d)
- day($d='',$p='')
- sqldate()
- time_ago($dt)
- xt($d,$o=0)
- isimg($d)
- ishttp($d)
- ishtml($d)
- imgroot($d)
- nohttp($f)
- domain($f)
- host()
- hostname()
- rdiv($r)
- walk($r,$fc)
- voc($d)
- ico($d)
- icovoc($d,$b='',$c='')
- rid($p='')
- unid($p,$n=6)
- k($k,$v)
- r($k)
- z($k)
- er($v)
- usr($k)
- cnfg($k)
- auth($n)
- exc($d)
- chmodf($f)
- p($r)
- pr($r)
- eco($d)
- trace()

# build

## Overview

It's a sum of useful builders

## Functions

- tabler($r,$head='',$keys='',$frame='')
- tabs($r,$id='tab1',$c='')
- playr($r,$c='',$o='')
- tree($r,$c='',$o='')
- mkli($r,$ul='ul')
- scroll($d,$max=10,$w='',$h='',$id='')
- writecsv($f,$r)
- readcsv($f)
- csvfile($f,$r,$t='')

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

- cprm($d)
- poc($da)
- parser($d,$p=[],$e='conn::connectors')
- embed_p($d)
- markdown($da,$rp)
- connectors($da,$rp=[])
- call($p)

# conv

## Overview

Converts Html into Connectors.

## Call

`conv::call(['txt'=>$txt]);`

## Functions

- repari($d)
- md2conn($d)
- tags($tag,$atb,$d)
- cleanhtml($d)
- cleanconn($d)
- ecart($v,$a,$b)
- recursearch($v,$ab,$ba,$tag)
- parse($v,$x='')
- call($p)

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

- file($a)
- trigger($a)
- save($a,$d)
- read($r)
- build($a)

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

- jsoncolfromattr($b,$c,$k)
- modifjsonvar($b,$c,$k,$v,$q='')
- create_cols($r)
- cleanup($r)
- cols($b,$n='')
- type_cols($b)
- trigger($b,$ra)
- create($b,$r,$up='')
- table($b)
- cols_r($b)
- cols_k($b)
- cols_s($b)
- install($b,$z=0)
- install_all()
- call()

# docs

## Overview

Application which references classes and functions, and their links, in two tables `_prog` and `_progr`.

It produces csv files for data-visualisation of the programme.
And it can produce the software's automatic documentation.

## Functions

- doc()
- iter2($ka)
- see2($p)
- iter($ka)
- see($p)
- vue()
- save2($r)
- unused($r,$rb)
- find($d,$fc)
- arbo($r)
- mktree($a,$b)
- funcsee($r)
- functree($r)
- save($p,$r)
- find_func($d,$fc)
- '.$fc.'(')
- funcnt($p,$r)
- funclist($r)
- count_cases($a,$va)
- occurrences($dr,$r)
- funcount($r)
- analys($d)
- ')!==false)$rf[]=between($v,'function ','(')
- capture($r,$dr='')
- rapport($r,$p)
- build($p)
- state($d)
- read($p)
- menu($p,$o)
- call($p)

# edit

## Overview

Permet de produire des formulaires d'après les définitions des tables.

## Call

`edit::call(['a'=>$tablename,'b'=>'play'|'edit'|'create','c'=>$id]);`

##

##

##

## Functions

- save($p)
- update($p)
- create($p)
- form($p)
- play($p)
- list()
- eligibles($a,$b,$rid)
- menu($a,$c,$rid)
- read($p)
- call($p)

# form

## Overview

Produce a formated form from definitions and array of values.

## Call

`form::call(['name'=>'var','age'=>'int'],['name'=>'bob','age'=>'18']);`

## Functions

- build($r)
- call($rp,$j='',$mode='')

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

#

#

#

## Functions

- add($k,$v)
- json($a)
- ra($r)
- meta($d,$v,$c='')
- csslink($d)
- jslink($d)
- csscode($d)
- jscode($d)
- css($d)
- js($d)
- link($d,$v)
- relod($v)
- build()
- html($lg='fr')
- run($lg='fr')
- page($d,$lg='fr')
- call($r=[])
- get()

# img

## Overview

Download images from web, [forms], and base64.
The image are renamed locally.
No backup of the original source id actually operated.
Build thumbnails of beggest files.
The images are located in `/img`.

## Functions

- b64img($u)
- imgthumb($f)
- getim($f,$w=240,$h=180)
- scale($w,$h,$wo,$ho,$s)
- thumb($in,$out,$w,$h,$s)
- alpha($img)

# json

## Overview

Calls json definitions from the `public/json` directory (by default).
Used by some other libraries.
Let edit these files.

## Call

`json::call('cnfg/vars');`

## Functions

- add($p)
- save($p)
- edit($p)
- file($a)
- error()
- er($r,$a='')
- build($r)
- call($a)

# login

## Overview

It's a simple class who resolve the moment of the authentification.
Login, logout, register, recognize, auth, etc.
The main `recognize` is used in the boot, and use a cookie named `uid`.
We were the first to purpose, by laziness, to allow an unrecognized user to register, and to make him logged in as soon as the registration is completed. It's funny.

## Functions

- hash($d)
- vrfpsw($d,$hash)
- alex($a)
- fastsave($p)
- register($p)
- firstuser()
- form($p)
- response($p)
- auth($id='')
- recognize()
- logout()
- loged()
- call($p)

# secur

## Overview

Ensures the security of functional attacks.
Calls via the Url or via Ajax go through a security check.
The level of authorisation required (`auth`) is defined for each user.

The security definitions are in `public/json/cnfg/secur.json`.

    {
        "sql":{"del":6,"trunc":6,"drop":6},
        "edit":{"save":6,"update":6,"call":4,"form":5},
        "json":{"save":6,"edit":6}
    }

## Functions

- call($a,$b)

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

- __construct($r)
- dbq()
- rq()
- qrr($r)
- qra($r)
- qrw($r)
- qr($sql,$z='')
- format($r,$p)
- where($r)
- sqcl($d,$b)
- mkv($r)
- mkvk($r)
- mkvr($r)
- mkq($r)
- mkvq($r)
- see($sql,$r)
- fetch($stmt,$p)
- bind($stmt,$r)
- prep($sql,$r,$z='')
- read($d,$b,$p,$q,$z='')
- read2($d,$b,$p,$q,$z='')
- alex($b,$r)
- combine($b,$r)
- integrity($b,$r)
- complete($r)
- sav($b,$q,$z='')
- sav2($b,$q,$z='')
- upd($b,$r,$q,$z='')
- inner($d,$b1,$b2,$k2,$p,$q,$z='')
- call($sql,$p,$z='')
- call2($sql,$p)
- com($sql)
- com2($sql,$z='')
- cols($b,$n='')
- drop($b)
- trunc($b)
- setinc($b,$n)
- unikey($b,$d)
- show($b)
- ex($b)
- backup($b,$d='')

# str

## Overview

Collection of filters for the strings.

## Functions

- acc($o=1)
- eradic_acc($d)
- normalize_alpha($d,$o='')
- normalize_ext($d)
- normalize($d,$o='')
- numentities($d)
- clean_acc($d)
- clean_punctuation($d,$o='')
- nicequotes($d,$o='')
- add_nbsp($d)
- mb_ucfirst($d,$e='utf-8')
- mb_uclet($d,$e='utf-8')
- lowcase($d)
- letcase($d)
- lowercase($d)
- clean_lines($d,$o='')
- delspc($d)
- clean_whitespaces($d)
- trim($d,$o='')
- clean_mail($d)
- clean_n($d)
- clean_br($d)

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

- file($a)
- vars($r)
- trigger($a)
- save($a,$d)
- save_html($a)
- build($r,$ra,$rc)
- com($r,$ra)
- call($a,$ra)

