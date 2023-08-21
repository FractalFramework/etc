## head

This buil the header, nd by extension all the html page with standards définitions located in a Json file.
The protocole is based on the View logic.

- Some parameters are simples tags [k=>v type of parameters]
- Some parameters are adapted tags [array of two parameters]
- Some parameters are simples strings [unique parameter]

This is enough to launch the classic headers, although they can be adapted.

    [
        {
            "tagb":["title","hello"]
        },
        {
            "link":["shortcut icon","/favicon.ico"]
        },
        {
            "css":"styles"
        },
        {
            "js":"lib"
        },
        {
            "js":"ajax"
        }
    ]