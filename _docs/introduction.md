etc by dav
© All rights reserved
release alpha

# simple and fast php project using dav's library

This package let create a simple website for publication of articles with comments.
It do not use any depandancie.
The Framework abilities are located in the dav's lib.
The doc of the framework is in the folder /dav.

## Introduction

This is an exercice for a little cms based of the library of dav.

It must display articles, list of articles, a contact, a login, and some attempted features for a personal website.

## Resolution of urls

The core works using Ajax.
All the links are not links, but commands for Ajax, who, after, update the Url.
Calling any page will just call the root until the desired functions.
This is called *navigation by states*.

## Structure of the directories

- /dav
-- /dav/kernel
- /img
- /public
- /src
-- /src/app
-- /srv/core
- /templates

## How it's works

MVC :
- build the datas in arrays
- construct the solutions
- display render in templates

### Indentation a few special...

Please note we don't respect the indentation for superior reasons.

