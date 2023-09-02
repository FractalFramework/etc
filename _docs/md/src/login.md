## Overview

It's a simple class who resolve the moment of the authentification.
Login, logout, register, recognize, auth, etc.
The main `recognize` is used in the boot, and use a cookie named `uid`.
We were the first to purpose, by laziness, to allow an unrecognized user to register, and to make him logged in as soon as the registration is completed. It's funny.

## Functions

- `hash($d)` -- used in : `login::register`
- `vrfpsw($d,$hash)` -- used in : `login::response`
- `uid($a)` -- used in : `login::register`, `tracks::register`
- `register($p)` -- used in : `login::regcall`
- `regcall($p)`
- `firstuser()` -- used in : `login::register`
- `form($p)` -- used in : `login::call`
- `response($p)` -- used in : `login::call`
- `identify($id='')` -- used in : `login::register`, `login::response`, `login::recognize0`, `login::recognize`, `tracks::register`
- `resetpsw()`
- `resetip()`
- `recognize0()`
- `recognize()` -- used in : `boot::call`
- `logout()`
- `loged()` -- used in : `login::call`
- `call($p)`
