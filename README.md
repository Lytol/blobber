Blobber
=======

An ORM-like abstraction layer for CRUDing data in memcachedb


Installation
------------

### Dependencies

* uuidtools gem (1.0.7)
* json gem (1.1.3)
* memcache-client (or equivalent) gem


Running Benchmarks
------------------

1) Start memcachedb with a fresh db directory:

    sudo memcachedb -r -u root -H /var/db/bdb/test1 -N

2) Run the benchmarks:

    rake benchmark


Copyright
---------

Copyright (c) 2009 Brian Smith. See LICENSE for details.
