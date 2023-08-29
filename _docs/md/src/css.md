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
