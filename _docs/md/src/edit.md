## Overview

Permet de produire des formulaires d'après les définitions des tables.

## Call

`edit::call(['a'=>$tablename,'b'=>'play'|'edit'|'create','c'=>$id]);`

## Functions

- `save($p)`
- `update($p)`
- `create($p)`
- `edit($p)`
- `play($p)`
- `read($p)` -- used in : `edit::call`
- `entries($a,$b,$c)` -- used in : `edit::read`
- `menu($a,$b,$c)` -- used in : `edit::read`
- `list()` -- used in : `edit::call`
- `call($p)`
