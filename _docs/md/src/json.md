## Overview

Calls json definitions from the `public/json` directory (by default).
Used by some other libraries.
Let edit these files.

## Call

`json::call('cnfg/vars');`

## Functions

- `add($p)`
- `save($p)`
- `edit($p)`
- `file($a)` -- used in : `json::er`, `json::call`, `view::vars`, `view::trigger`, `css::trigger`
- `error()` -- used in : `json::er`
- `er($r,$a='')` -- used in : `json::build`, `json::call`
- `build($r)`
- `call($a)` -- used in : `head::json`, `secur::call`, `view::vars`, `view::save_html`, `view::call`, `css::build`, `db::table`, `db::install_all`, `boot::cnfg`, `conns::bt`, `main::read`
