## Overview

Permet de produire des formulaires d'après les définitions des tables.

## Call

`edit::call(['a'=>$tablename,'b'=>'play'|'edit'|'create','c'=>$id]);`

## Functions

- `save($p)`
- `update($p)`
- `create($p)` -- used in : `edit::read`
- `form($p)` -- used in : `edit::read`
- `play($p)` -- used in : `edit::read`
- `list()` -- used in : `edit::read`
- `eligibles($a,$b,$rid)` -- used in : `edit::read`
- `menu($a,$c,$rid)` -- used in : `edit::call`
- `read($p)` -- used in : `edit::call`
- `call($p)` -- used in : `blocks::user`
