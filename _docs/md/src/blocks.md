## Overview

It will roots the commands (from url or ajax) to the targeted action.
This action is located :
- as a block in this file (banner, footer, etc)
- a full app, named with his parameter app/param

At boot, it roots the commands from the main.php, who call a block for each attempted variable of the main template.
The `main` called action (who would call `main` in loop), is replaced by his parameter, as the name of the called action. (a,b,c => a,b, with a=b and b=c).

In substance, how it is built, all the actions will only have an impact on the `main` variable of the main template.
Actions on other containers of the main template can be given by ajax actions.

## Functions

- `banner($p)`
- `footer($p)`
- `shutter($p)`
- `nav($p)`
- `home($p)`
- `user()`
- `forbidden()`
- `call($p)` -- used in : `main::read`
