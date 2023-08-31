## Overview

It's a simple class who resolve the moment of the authentification.
Login, logout, register, recognize, auth, etc.
The main `recognize` is used in the boot, and use a cookie named `uid`.
We were the first to purpose, by laziness, to allow an unrecognized user to register, and to make him logged in as soon as the registration is completed. It's funny.

## Functions

- `save($p)`
- `create()`
- `modif($p)`
- `edit()` -- used in : `admin::call`
- `defaults()` -- used in : `nav::datas`
- `datas()` -- used in : `nav::call`
- `call($p)`
