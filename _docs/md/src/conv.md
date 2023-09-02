## Overview

Converts Html into Connectors.

## Call

`conv::call(['txt'=>$txt]);`

## Functions

- `repair($d)`
- `md2conn($d)` -- used in : `test::md`
- `tags($tag,$atb,$d)` -- used in : `conv::parse`
- `cleanhtml($d)` -- used in : `conv::build`
- `cleanconn($d)` -- used in : `conv::build`
- `ecart($v,$a,$b)` -- used in : `conv::recursearch`, `conv::parse`
- `recursearch($v,$ab,$ba,$tag)` -- used in : `conv::recursearch`, `conv::parse`
- `parse($v,$x='')` -- used in : `conv::parse`, `conv::build`
- `build($p)` -- used in : `posts::update`
- `call($p)`
