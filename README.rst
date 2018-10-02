===================================
moz-cloud: Python 2/3 compatibility
===================================

The *Mozilla cloud services* are a scalable infrastructure of interoperable
services. About *Mozilla cloud Services* read:

  https://docs.services.mozilla.com

This is the parent repository of Mozilla-Cloud's Python 3 movement.  The Py3
movement itself takes place in the feature branch ``origin/six`` of the
git-submodules (listed below). To clone use::

  git clone --recursive https://github.com/return42/moz-cloud

To compile the python extension its recommend to install::

  sudo apt-get install build-essential python3-dev python-dev libssl-dev swig

About *Porting Python 2 Code to Python 3* recommendations read:

  https://docs.python.org/3/howto/pyporting.html

Porting all this repos is a lot of work. To be more productive, a uniform
*boilerplate* has been added to all the ported MozillaCloud components listed
here. For this, the *boilerplate* brings and uniform build/deploy/test
environment, which builds and runs tests in isolated Py2 and Py3
*virtualenv*. The tests are running completely on developer's local workstation
(CI without remotes). Such a *boilerplate* assembles from::

  virtualenv --> providing isolated environments for builds
  pylint     --> providing lint
  tox        --> providing automated tests locally
  pytest     --> providing the test framework

To be convenient, mostly a Makefile provide some targets.::

  build      - build virtualenv (./local/py3) and install *developer mode*
  lint       - run pylint within "build" (developer mode)
  test       - run tests for all supported environments (tox)
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

  - status:   merged `upstream <https://github.com/mozilla-services/hawkauthlib/commit/9ddcce>`_
  - old-origin:   https://github.com/return42/hawkauthlib  six
  - upstream: https://github.com/mozilla-services/hawkauthlib master

* tokenlib

  - status:   merged `upstream <https://github.com/mozilla-services/tokenlib/commit/1755f502>`_
  - old-origin:   https://github.com/return42/tokenlib  six
  - upstream: https://github.com/mozilla-services/tokenlib  master

* konfig

  - status:   merged `upstream <https://github.com/mozilla-services/konfig/commit/cc09321d>`_
  - old-origin:   https://github.com/return42/konfig  six
  - upstream: https://github.com/mozilla-services/konfig  master

* pyramid_hawkauth

  - status:   merged `upstream <https://github.com/mozilla-services/pyramid_hawkauth/commit/d83291d>`_
  - origin:   https://github.com/return42/pyramid_hawkauth  six
  - upstream: https://github.com/mozilla-services/pyramid_hawkauth  master

* mozservices

  - status:   ``origin/six`` passed Py27 & Py35 tests
  - origin:   https://github.com/return42/mozservices  six
  - upstream: https://github.com/mozilla-services/mozservices  master

* PyBrowserID

  - status:   ``origin/six`` passed Py27 & Py35 tests
  - origin:   https://github.com/return42/PyBrowserID  six
  - upstream: https://github.com/mozilla/PyBrowserID  master

* syncserver

  - status:   ``origin/six`` WIP
  - origin:   https://github.com/return42/syncserver  six
  - upstream: https://github.com/mozilla-services/syncserver  master

* server-syncstorage

  - status:   ``origin/six`` WIP
  - origin:   https://github.com/return42/server-syncstorage  six
  - upstream: https://github.com/mozilla-services/server-syncstorage  master

* tokenserver

  - status:   ``origin/six`` passed Py27 & Py35 tests
  - origin:   https://github.com/return42/tokenserver  six
  - upstream: https://github.com/mozilla-services/tokenserver  master


Additional repos
================

For the Py3 movement, some sub-requirements has to be ported also.

* m2crypto

  - status: Version 0.28.0 or newer support Python 2.7 and 3.3-3.6

  M2Crypto is needed by PyBrowserID. In the long term, we should replace
  M2crypto with https://cryptography.io
