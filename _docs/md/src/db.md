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
- `cols_r($b)` -- used in : `edit::create`, `edit::edit`, `edit::entries`, `sql::integrity`, `db::cols_k`
- `cols_k($b)` -- used in : `edit::save`, `edit::update`, `edit::play`, `sql::alex`, `sql::combine`, `db::cols_s`
- `cols_s($b)` -- used in : `sql::sqcl`
- `install($b,$z=0)`
- `install_all()` -- used in : `boot::call`
- `call()`
