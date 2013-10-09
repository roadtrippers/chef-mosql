WIP
===

This is currently a WIP, should not be used for any production purposes.
Issues should not be reported.

mosql Cookbook
==============

Bake mo' SQL into your NoSQL.

Sets up and runs [MoSQL](http://github.com/stripe/mosql) on your server.

Requirements
------------

Requires PostgreSQL and MongoDB servers.  Only PostgreSQL 9.1 and MongoDB 2.4
have been tested, but others may work as well.

There is no hard dependency on which mongo/postgres recipes are used; however,
mosql should be run thereafter.

Attributes
----------

#### mosql::default

+ ```node['mosql']['collections_path']``` - the location that the
  ```collections.yml``` should be read from (required) 
+ ```node['mosql']['mongo'] - url to connect to mongo; can be prepended with
  ```USERNAME@PASSWORD``` and postpended with options
  + e.g. ```mongdb://$USER@$PASSWORD:$HOST/admin```
  + default: nil; this uses the mosql defaults, which at last look, were
    localhost with no authentication or options
+ ```node['mosql']['sql']``` - url to connect to the postgres database
  + e.g. ```postgres://sql-server/sql-db```
  + default: nil; this uses the mosql default, which at last look, were
    localhost with no authentication 

Usage
-----
#### mosql::default

e.g.
Just include `mosql` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[mosql]"
  ]
}
```

Contributing
------------

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write you change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License
-------

Licensed under the MIT licence, see [LICENSE](LICENSE).
