## Overview

Download images from web, [forms], and base64.
The image are renamed locally.
No backup of the original source id actually operated.
Build thumbnails of beggest files.
The images are located in `/img`.

## Functions

- `b64img($u)` -- used in : `conv::tags`
- `imgthumb($f)`
- `getim($f,$w=240,$h=180)` -- used in : `conv::tags`
- `scale($w,$h,$wo,$ho,$s)` -- used in : `img::thumb`
- `thumb($in,$out,$w,$h,$s)` -- used in : `img::imgthumb`, `img::getim`
- `alpha($img)` -- used in : `img::thumb`
