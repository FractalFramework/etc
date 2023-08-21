## sql

Woooo...

I know i know, you have never seen that.

We think the usage of quaries chould be extremely generalized and never scattered in the code.
It's a general principle of the dav's lib that everything should be centralized.

Generalization of the queries let approach yopur conception from the motor of an Api.
The Api can be queried in any way on any topic.

So the protocole is strict, multiple, complex, and it can be used in one or another level of complexity, or if you really want, with no complexity at all, usique `sql::rq()`.

`sql::call()` will use the basic dispositions for render a result with arrays's protocole, from a classic query.

`sql::read()` is our friend. It use the two protocoles, the one of the arrays, and the one of the construction of a prepared query from an array.