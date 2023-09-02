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
- `menu()` -- used in : `dbedt::call`
- `call($p)` -- used in : `admin::call`
