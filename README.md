mosql Cookbook
==============

Bake mo' SQL into your NoSQL.

Sets up and runs [MoSQL] on your server.

![Chef MoSQL](http://files.roadtrippers.com/assets/chef_mosql.png)


Requirements
------------

Requires PostgreSQL and MongoDB servers.  Only PostgreSQL 9.1 and MongoDB 2.4
have been tested, but others may work as well.

There is no hard dependency on which mongo/postgres recipes are used; however,
mosql should be run thereafter.

This recipe depends on the [runit] recipe to run mosql as a service.

Attributes
----------

#### mosql::default

##### `node['mosql']['mongo_database']` (required)

The mongo database from which pull/copy from. 

##### `node['mosql']['collections]` (required)

The collections to be writen to the collections file.

Structure should follow the same convension as the [mosql collections YAML],
but in a ruby hash.  For example:

```ruby
node['mosql']['collections'] = {
  "site_layouts"=> {
    :columns=> [
      {"mongo_id"=>nil, :source=>"_id", :type=>"TEXT"},
      {"subdomain"=>"TEXT"},
      {"page_title"=>"TEXT"},
      {"top_border"=>"TEXT"},
      {"created_at"=>"TIMESTAMP WITHOUT TIME ZONE"},
      {"updated_at"=>"TIMESTAMP WITHOUT TIME ZONE"}
    ],
    :meta=>{:table=> "site_layouts"}
  }
}
```

##### `node['mosql']['collections_path']` (optional)

The location that the ```collections.yml``` should be written to. The default
location is `/usr/local/etc/mosql/collections.yml`).

##### `node['mosql']['mongo_url']` (optional)

The URL to connect to mongo; can be prepended with ```USERNAME@PASSWORD``` and
postpended with options; e.g. ```mongdb://$USER@$PASSWORD:$HOST/admin```

Defaults to `nil`; this uses the mosql defaults, which at last look, was
localhost with no authentication or options.

##### `node['mosql']['sql']` (optional)

The URL to connect to the postgres database. E.g. ```postgres://sql-server/sql-db```

Defaults to `nil`; this uses the mosql default, which at last look, was
localhost with no authentication.

Usage
-----
#### mosql::default

Just include `mosql` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[mosql]"
  ]
}
```

MoSQL will be started as a service upon provision and each system start using
runit.  The log can be viewed at `/var/log/mosql/current`.

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

[mosql]: http://github.com/stripe/mosql 
[runit]: http://community.opscode.com/cookbooks/runit
[mosql collections YAML]: http://github.com/stripe/mosql#the-collection-map-file
