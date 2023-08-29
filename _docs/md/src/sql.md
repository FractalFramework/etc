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
