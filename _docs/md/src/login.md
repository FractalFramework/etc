## Overview

It's a simple class who resolve the moment of the authentification.
Login, logout, register, recognize, auth, etc.
The main `recognize` is used in the boot, and use a cookie named `uid`.
We were the first to purpose, by laziness, to allow an unrecognized user to register, and to make him logged in as soon as the registration is completed. It's funny.

## Functions

- `hash($d)` -- used in : `login::register`
- `vrfpsw($d,$hash)` -- used in : `login::response`
- `alex($a)` -- used in : `login::fastsave`, `login::register`
- `fastsave($p)` -- used in : `tracks::save`
- `register($p)`
- `firstuser()` -- used in : `login::register`
- `form($p)` -- used in : `login::call`
- `response($p)` -- used in : `login::call`
- `auth($id='')` -- used in : `login::fastsave`, `login::register`, `login::response`, `login::recognize`
- `recognize()` -- used in : `boot::call`
- `logout()`
- `loged()` -- used in : `login::call`
- `call($p)`
