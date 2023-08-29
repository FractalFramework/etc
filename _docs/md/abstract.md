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

- /img
- /public/json
- /src/_kernel
- /src/app
- /srv/core

Are :

- public/json are the easy-to-modificate settings
- Kernel don't have to be modified.
- public/core don't have the vocation to be modified, but can be modified.
- public/blocks can be added, modified or deleted freely.

## Rules of indentation

Please note we don't respect the Psr for superior reasons.

The rules are :
- no unusefull spaces or tabs
- short names without cases
- autodoc of names of variables (follow the rabbit)
- standardized names : each name have it's own meaning (see doc of kernel).

See more in `_docs/md/technotes.md`.

## How it's works

General path of actions :

- build the datas
- algorithmics
- render

## Architecture

The software build results to place in the main container of the index.html.

The sequence of calls is :
- index.php | ajax.php
- public/index.php : boot the framework
- src/core/main.php : build the main page
- src/core/blocks : roots the calls
- src/app/(etc.) : called action, from url or from ajax.

## Json

If a system is a stack of layers, from the kernel to the surface layer (kernel, core, app), configurations are delegated in Json files.

They concern all the software layers:

- general config, used by the kernel
- css, headers and settings of mysql tables
- verbose and icons
- templates

## Kernel

The kernel is a set of classes which depend each other.
they are designed to be as independent as possible.
They sometimes depend on the general configuration.

Here are some of his skills :

### Sql

The Sql system concentrate all the actions in a machine to build requests, from arrays commands.
It's the better way to keep a global control on all the requests of the application.
Also, your application become *de facto* callble by an Api.

### Db

The tables, columns and types of columns are set in a Json file.
Any modification of the table will be *repaired* by the application.
So you must/can make evoluate the structure of your table from the Json file.

### Heads

The header is following a system of constrution from parameters in Json.
You only have to change theses parameters.

### Css

The Css are built from Json parameters.
You only have to change theses parameters.
Css sheets are cached.

## View

View is the templater.
It uses it's own protocole to transform recursive arrays in html tags.
The Json template cas receive {variables} that will be detected and reserched by the rooter (blocks).

## Voc

The verbose is entirelly externalized in a Json file.
You only have to add new terms, or translate them.
It's the same for the icones.

## Edit

This component will just build forms from tables definitions, to edit them automatically.

## Forms

This component will build any form from instructions given in an array.

## Str

It's a compilation of usefull operations on strings.

## Lib

It's the core of the kernel.
These are functions of the level zero.
See more in `_docs/md/src/lib.md`.

The full details of all classes is in `_docs/md/readme.md`