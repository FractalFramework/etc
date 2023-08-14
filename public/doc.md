# directories

## cnfg

Json tables with parameters for the sofware, with their own protocole :
- "headers": All the content of the values needed by `head::build()`
- "styles": All the content of the values needed by `css::build()`
- "vars": Config of the software.

## views

*First kind of templates*

The `views` are the default model of templates used in the framework.
The class `::view()` simply build html tags from a structure of arrays, with three values :
- the name of the tag
- the array of the params of the tag
- the embed of the tag.

The two subfolders are :
- blocks
- roots.

### roots

Basically, the index.php call `blocks::call()` with the gets `$g` to décide the *context* `view` of the `root`:
- "home" : default template
- "cat" : template used for the list of the posts, without parameter, or a category of posts, with a parameter
- "art" : using an `$id` only, prepare the page to display a post
- "admin" : used to display a page without head, for example
- any other wanted.

The context call the `view` named like it.

### blocks

Other blocks are only specific contents built before to be injected as variables in the root template.

## structures

*Second kind of templates*

The structures give a short command of templates to call for each case of the root.

It's a model of rooting who dissociate the templates in two actions :
- the `structure` of the page
- the `views` used in each element of the structure (the same `views` can be reused)

Essentially it's a list of tags at the first level of the page.
Each tag call a template named like it.
The calls can be imbricated. In case of imbrication, the contents is injected in the variable who have the the name of the template.
And each call can determine a list of defaults variables to use in the template.

## constructs

*Third kind of templates*

The constructs are `views` who can be constructed sequentially.
The elements of a construct can be embeded in a variable and reused in the same construct. It simplifies the understanding of the structure, if each elements is injected in an other.
So, in place of big trees, we have an unidimensional list af arrays.

Finally it's the closest thing we've got to a public way of coding.
All it need is to be made accountable of the iterations.

