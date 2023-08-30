etc by dav
© All rights reserved
release alpha

# simple and fast php project using dav's lib

This package let create a simple website for publication of articles with comments.
It use no depandancies.
The kernel is located in `/_`.
The core determines the chosen architecture.
Tha app folder is a free place to create anything.

## Introduction

This is an exercice for a microcms based of the dav's lib.
It must display articles, list of articles, a contact, a login, and some attempted features for a personal website.

## Navigation by state

The sate navigation consiste to never change the current page, but only the needed contents.
Howover, you can go back and forward in the navigation of your browser. 

The `core` roots calls from url and from ajax in the same way.
If you call a page from a button, it call ajax, and dispay the logic url.
If you are freshly coming with tat url, it will find the associated action.

It's a full-ajax framework.

## Structure of the directories

- /img
- /public/json
- /src/_ (kernel)
- /src/app
- /srv/core

Either:

- `public/json` here are all the settings
- `src/_` don't have to be modified.
- `src/core` don't have the vocation to be modified, but can be modified.
- `src/apps` can be added, modified or deleted freely.

## Rules of indentation

Please note we *do not* respect the Psr-4 for superior reasons.

The rules are :
- no unusefull spaces or tabs
- short names without cases
- autodoc of names of variables (follow the rabbit)
- standardized names : each name have it's own meaning

See more in `_docs/technotes.md`.

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