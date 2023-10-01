## Overview

It's a sum of useful builders

## Functions

- `popup($d,$t)`
- `pagup($d,$t)`
- `tabler($r,$h='',$keys='',$frame='')` -- used in : `contact::read`, `dbedt::play`, `docs::vue`, `docs::find_func`, `docs::count_cases`, `docs::rapport`, `edit::play`, `admin::pending_tracks`, `admin::pending_posts`
- `tabs($r,$id='tab1',$c='')` -- used in : `admin::user`, `admin::call`
- `playr($r,$c='',$o='')` -- used in : `build::playr`, `build::tree`
- `tree($r,$c='',$o='')` -- used in : `docs::see2`, `docs::see`
- `mkli($r,$ul='ul')` -- used in : `conns::list`, `conns::numlist`
- `scroll($d,$max=10,$w='',$h='',$id='')`
- `writecsv($f,$r)` -- used in : `build::csvfile`
- `readcsv($f)`
- `csvfile($f,$r,$t='')` -- used in : `docs::vue`
- `etc($d,$n=200)`
- `btpages_nb($nbp,$pg)` -- used in : `build::btpages`
- `btpages($nbyp,$pg,$nbarts,$j)`
- `download($f,$t='')` -- used in : `build::audio`
- `audio($d,$t='')`
- `video($d,$w='',$h='',$o='')`
- `iframe($d,$w='',$h='',$o='')` -- used in : `conns::youtube`
- `editable($r,$j,$h=[],$edk='',$no=[])` -- used in : `dbedt::play`, `dbedt::read`, `jedt::addrow`, `jedt::edit`
- `ftp($d)` -- used in : `build::ftpchmod`
- `ftpchmod($f,$n)` -- used in : `test::call`
