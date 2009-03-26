Blobber
=======

An ORM-like abstraction layer for CRUDing objects to any db supporting the memcached protocol (memcachedb, Tokyo Tyrant, etc)


Installation
------------

### Dependencies

* uuidtools gem (1.0.7)
* json gem (1.1.3)
* memcache-client (or equivalent) gem


Running Benchmarks
------------------

1) Start memcachedb (or your db of choice):

    sudo memcachedb -r -u root -H /var/db/bdb/test1 -N
    <or>
    sudo ttserver -port 21201 /var/db/bdb/test.tch
    <or>
    sudo ttserver -port 21201 /var/db/bdb/test.tcb

2) Run the benchmarks:

    rake benchmark


Copyright
---------

Copyright (c) 2009 Brian Smith. See LICENSE for details.
