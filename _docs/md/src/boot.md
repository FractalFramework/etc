## Overview

The sql motor is loaded one time for ever. And closed and the end of the script.
The codes of connection to the database does not roam freely in the code.

`new sql(['localhost','root','dev','etc']);` where we have host, name, password and basename.

We can switch of basename during the script.

## Functions

- `cnfg()`
- `call()`
