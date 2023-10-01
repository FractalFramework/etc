## Overview

Calls json definitions from the `public/json` directory (by default).
Used by some other libraries.
Let edit these files.

## Call

`json::call('cnfg/vars');`

## Functions

- `file($a)` -- used in : `view::vars`, `view::trigger`, `css::trigger`, `jedt::addnew`, `jedt::update`, `jedt::savext`, `jedt::editxt`, `json::err`, `json::call`
- `error()` -- used in : `json::err`
- `err($r,$a='')` -- used in : `json::build`, `json::call`
- `build($r)`
- `call($a)` -- used in : `view::vars`, `view::save_html`, `view::call`, `css::build`, `db::table`, `db::install_all`, `head::json`, `jedt::modif`, `jedt::addrow`, `jedt::edit`, `boot::cnfg`, `conns::connbt`, `main::read`, `nav::datas`
