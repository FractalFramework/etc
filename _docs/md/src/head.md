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
