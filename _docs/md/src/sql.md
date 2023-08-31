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
- `qr($sql,$z='')` -- used in : `sql::inner`, `sql::call`, `sql::com2`, `sql::backup`, `db::jsoncolfromattr`, `db::modifjsonvar`, `db::create`
- `format($r,$p)` -- used in : `sql::read`, `sql::read2`, `sql::inner`, `sql::call`
- `where($r)` -- used in : `sql::mkq`, `sql::read`, `sql::upd`, `sql::inner`
- `sqcl($d,$b)` -- used in : `sql::read`, `sql::read2`, `sql::inner`
- `mkv($r)` -- used in : `sql::sav`, `sql::sav2`
- `mkvk($r)` -- used in : `sql::upd`
- `mkvr($r)`
- `mkq($r)` -- used in : `sql::read2`, `db::modifjsonvar`
- `mkvq($r)` -- used in : `sql::sav2`
- `see($sql,$r)` -- used in : `sql::prep`, `sql::inner`
- `fetch($stmt,$p)` -- used in : `sql::read`, `sql::read2`, `sql::inner`, `sql::call`, `sql::call2`
- `bind($stmt,$r)` -- used in : `sql::prep`
- `prep($sql,$r,$z='')` -- used in : `sql::read`, `sql::sav`, `sql::sav2`, `sql::upd`, `sql::inner`
- `read($d,$b,$p,$q,$z='')` -- used in : `edit::create`, `edit::edit`, `edit::play`, `edit::entries`, `login::alex`, `login::firstuser`, `login::response`, `login::auth`, `sql::alex`, `docs::doc`, `docs::see2`, `docs::see`, `docs::vue`, `docs::mktree`, `docs::find_func`, `docs::count_cases`, `docs::state`, `admin::pub`, `contact::read`, `posts::catid`, `posts::content`, `posts::create`, `posts::read`, `posts::stream`, `tracks::edit`, `tracks::call`, `blocks::banner`, `conns::art`, `conns::read`, `conns::usrart`, `conns::uid`, `conns::socials`
- `read2($d,$b,$p,$q,$z='')`
- `alex($b,$r)` -- used in : `sql::sav`
- `combine($b,$r)` -- used in : `sql::sav`
- `integrity($b,$r)` -- used in : `sql::sav`
- `complete($r)` -- used in : `sql::sav`
- `sav($b,$q,$z='')` -- used in : `edit::save`, `login::fastsave`, `login::register`, `docs::save2`, `docs::save`, `contact::save`, `posts::catid`, `posts::save`, `tracks::save`
- `sav2($b,$q,$z='')`
- `upd($b,$r,$q,$z='')` -- used in : `edit::update`, `admin::pub`, `posts::del`, `posts::update`, `tracks::del`
- `inner($d,$b1,$b2,$k2,$p,$q,$z='')` -- used in : `login::auth`, `nav::defaults`, `admin::pending_tracks`, `admin::pending_posts`, `posts::datas`, `tracks::read`, `tracks::stream`, `conns::profile`
- `call($sql,$p,$z='')` -- used in : `edit::list`, `sql::cols`, `db::cols`
- `call2($sql,$p)`
- `com($sql)`
- `com2($sql,$z='')`
- `cols($b,$n='')` -- used in : `sql::combine`
- `drop($b)` -- used in : `sql::backup`, `db::trigger`, `db::create`
- `trunc($b)` -- used in : `docs::save`
- `setinc($b,$n)`
- `unikey($b,$d)` -- used in : `db::create`
- `show($b)` -- used in : `sql::ex`
- `ex($b)` -- used in : `sql::backup`
- `backup($b,$d='')` -- used in : `db::trigger`
