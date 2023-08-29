## Overview

It's a simple class who resolve the moment of the authentification.
Login, logout, register, recognize, auth, etc.
The main `recognize` is used in the boot, and use a cookie named `uid`.
We were the first to purpose, by laziness, to allow an unrecognized user to register, and to make him logged in as soon as the registration is completed. It's funny.

## Functions

- hash($d)
- vrfpsw($d,$hash)
- alex($a)
- fastsave($p)
- register($p)
- firstuser()
- form($p)
- response($p)
- auth($id='')
- recognize()
- logout()
- loged()
- call($p)
