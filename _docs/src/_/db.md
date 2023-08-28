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