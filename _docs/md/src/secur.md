## Overview

Ensures the security of functional attacks.
Calls via the Url or via Ajax go through a security check.
The level of authorisation required (`auth`) is defined for each user.

The security definitions are in `public/json/cnfg/secur.json`.

    {
        "sql":{"del":6,"trunc":6,"drop":6},
        "edit":{"save":6,"update":6,"call":4,"form":5},
        "json":{"save":6,"edit":6}
    }

## Functions

- `call($a,$b)`
