## Overview

Calls json definitions from the `public/json` directory (by default).
Used by some other libraries.
Let edit these files.

## Call

`json::call('cnfg/vars');`

## Functions

- `file($a)` -- used in : `json::err`, `json::call`, `view::vars`, `view::trigger`, `css::trigger`
- `error()` -- used in : `json::err`
- `err($r,$a='')` -- used in : `json::build`, `json::call`
- `build($r)`
- `call($a)` -- used in : `head::json`, `jedt::modif`, `jedt::edit`, `secur::call`, `view::vars`, `view::save_html`, `view::call`, `css::build`, `db::table`, `db::install_all`, `boot::cnfg`, `conns::bt`, `main::read`, `nav::datas`
