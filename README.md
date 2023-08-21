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

## index

Here is the boot of the application.
It get the variables from Url, call the config, verif the connected user, call the default datats for the banner, build the headers, and call the Main system, who will root the action to the targeted functions.

## Architecture

Fils from dav's lib don't have to be modified.
Files of the public/core don't have the vocation to be modified.
Files of the public/blocs are free.

## sql

The Sql system concentrate all the actions in a machine to build requests, from arrays.
It's the better way to keep a global control on all the requests of the application.
Also, your application become *de facto* callble by an Api.

## Db

The tables, columns and types of columns are set in a Json file.
Any modification of the table will be *repaired* by the application.
So you must/can make evoluate the structure of your table from the Json file.

## Heads

The header is following a system of constrution from parameters in Json.
You only have to change theses parameters.

## Css

The Css is following a system of constrution from parameters in Json.
You only have to change theses parameters.
Css sheets are cached.

## View

The header is following a system of constrution from templates in Json.
You only have to change theses templates.
Html template are built, for no reason actually (maybe to help to find fastly how it is).

## Voc

The verbose is concentrated in a Json file.
You only have to add new terms, or translate them.

## Ico

The verbose is concentrated in a Json file.
You only have to add new terms, or translate them.

## Edit

It's a component who build, knwowing columns and types of columns of tables, the froms to edit them.

## Forms

It's a component who build any form from instructions in an array.

## Str

It's a compilation of usefull operations on strings.

## Lib

It's the core of the kernel.
These are functions of the first level.
See more in docs/dav/lib.md.

# How to add an feature

## Add your App in public/blocks

It will automatically be joignable by the url, if you use the method ::call($g). [@with $g = the gets]

## Add a template of the same name in public/json/views/blocks

The template is a json following a structure.
The variables will be known by the software.
You just have to fill the unidimensionnal associative array like `['content'=>$results]`, and call the `::view()` component to build the result.

# The path of the information

The `module` is strictly restricted to build the index and give the four variables it needs.

The `blocks` contains basic fnctions that not need to be in a separated file.
The `call()` of the `blocks` let root the request between :
- present functions in `blocks`
- specific classes
- a root to specific classes not necessary named like how we call them (like *home*).

The information continue, for example to the `posts`.
Here, some constructors (it's a *controller*) assume to bring values to the templater.

Coming from `ajax.php`, the path on the information is the same.
`ajax.js` is exclusively restricted to call `blocks` and send the result in the variable `content` of the main `index.php`.

Every functions of the software are following this path.

## Caracteristics

- All the verbose of the software is externalized.
- The treatment is sparated between the constructors (models and controllers) and the display (views).

## Doc

`/docs` will have an help foreach() class.

