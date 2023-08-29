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
