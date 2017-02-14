===================================
moz-cloud: Python 2/3 compatibility
===================================

This is the parent repository of MozillaCloud's Python 3 movement.  The Py3
movement itself takes place in the feature branch ``origin/six`` of the
git-submodules (listed below). To clone use::

  git clone --jobs 4 --recursive https://github.com/return42/moz-cloud

About *Porting Python 2 Code to Python 3* recommendations read:

  https://docs.python.org/3/howto/pyporting.html

Porting all this repos is a lot of work. To be more productive, a uniform
*boilerplate* has been added to all the ported MozillaCloud components listed
here. For this, the *boilerplate* brings and uniform build/deploy/test/debug
environment, which builds and runs tests in isolated Py2 and Py3
*virtualenv*. The tests are running completely on developer's local workstation
(CI without remotes). Such a *boilerplate* assembles from::

  virtualenv --> providing isolated environments for builds
  pylint     --> providing lint
  tox        --> providing automated tests locally

To be convenient, mostly a Makefile provide some targets.::

  build      - build virtualenv (./local/py3) and install *developer mode*
  lint       - run pylint within "build" (developer mode)
  test       - run tests for all supported environments (tox)
  debug      - run tests within a PDB debug session
  dist       - build packages in "dist/"
  pypi       - upload "dist/*" files to PyPi
  clean-dist - remove most generated files

A typical *Python 2/3 compatibility round-trip* is as simple like:

  1. modify/fix ``*.py`` files
  2. make lint ... on errors go back to 1.
  3. make test ... this tests in Py27 and Py35 ... on errors go back to 1.
  4. commit to origin's six branch


Status
======

ATM following submodules has been added:

* hawkauthlib

  - status:   ``origin/six`` passed Py27 & Py35 tests
  - origin:   https://github.com/return42/hawkauthlib  six
  - upstream: https://github.com/mozilla-services/hawkauthlib master

* konfig

  - status:   ``origin/six`` passed Py27 & Py35 tests
  - origin:   https://github.com/return42/konfig  six
  - upstream: https://github.com/mozilla-services/konfig  master

* mozservices

  - status:   ``origin/six`` passed Py27 & Py35 tests
  - origin:   https://github.com/return42/mozservices  six
  - upstream: https://github.com/mozilla-services/mozservices  master

* PyBrowserID

  - status:   ``origin/six`` passed Py27 & Py35 tests
  - origin:   https://github.com/return42/PyBrowserID  six
  - upstream: https://github.com/mozilla-services/PyBrowserID  master

* pyramid_hawkauth

  - status:   ``origin/six`` passed Py27 & Py35 tests
  - origin:   https://github.com/return42/pyramid_hawkauth  six
  - upstream: https://github.com/mozilla-services/pyramid_hawkauth  master

* syncserver

  - status:   ``origin/six`` TODO
  - origin:   https://github.com/return42/syncserver  six
  - upstream: https://github.com/mozilla-services/syncserver  master

* server-syncstorage

  - status:   ``origin/six`` WIP
  - origin:   https://github.com/return42/server-syncstorage  six
  - upstream: https://github.com/mozilla-services/server-syncstorage  master

* tokenlib

  - status:   ``origin/six`` passed Py27 & Py35 tests
  - origin:   https://github.com/return42/tokenlib  six
  - upstream: https://github.com/mozilla-services/tokenlib  master

* tokenserver

  - status:   ``origin/six`` passed Py27 & Py35 tests
  - origin:   https://github.com/return42/tokenserver  six
  - upstream: https://github.com/mozilla-services/tokenserver  master


Additional repos
================

For the Py3 movement, some sub-requirements has to be ported also.

* m2crypto

  - status:   ``origin/six`` passed 95% of Py27 & Py35 tests
  - origin:   https://github.com/return42/m2crypto  six
  - upstream: https://gitlab.com/m2crypto/m2crypto  python3

  M2Crypto is needed by PyBrowserID.  The ``origin:six`` branch of M2crypto is
  just a hack for the period of transition. In the long term, we should replace
  M2crypto with https://cryptography.io
