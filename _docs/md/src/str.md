## Overview

Collection of filters for the strings.

## Functions

- `acc($o=1)` -- used in : `str::eradic_acc`, `str::lowcase`
- `eradic_acc($d)` -- used in : `str::normalize`
- `normalize_alpha($d,$o='')` -- used in : `str::normalize`
- `normalize_ext($d)` -- used in : `str::normalize`
- `normalize($d,$o='')` -- used in : `download::rednm`
- `numentities($d)`
- `clean_acc($d)` -- used in : `str::clean_punctuation`, `str::nicequotes`
- `clean_punctuation($d,$o='')` -- used in : `conv::build`
- `nicequotes($d,$o='')` -- used in : `str::clean_punctuation`
- `add_nbsp($d)` -- used in : `str::nicequotes`
- `mb_ucfirst($d,$e='utf-8')`
- `mb_uclet($d,$e='utf-8')`
- `lowcase($d)`
- `letcase($d)` -- used in : `str::lowercase`
- `lowercase($d)`
- `clean_lines($d,$o='')` -- used in : `str::clean_br`, `conv::build`, `str::clean_mail`
- `delspc($d)`
- `clean_whitespaces($d)` -- used in : `str::clean_lines`, `str::trim`
- `trim($d,$o='')` -- used in : `str::clean_lines`
- `clean_mail($d)`
- `clean_n($d)` -- used in : `conv::build`
- `clean_br($d)`
