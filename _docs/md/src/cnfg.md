    <?php
    new sql(['localhost','root','dev','etc']);

This file only conatains the Sql connection.
This is the only one place for it.

The name of the file is the resulte of `$_REQUEST['HTTP_HOST']` without the `wwww` of course

So we can use differents connections for differents urls.