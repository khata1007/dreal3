[![Build Status](https://travis-ci.org/soonhokong/dReal.png?branch=master)](https://travis-ci.org/soonhokong/dReal)
dReal: An SMT Solver for Nonlinear Theories of the Reals
========================================================

Please visit [dReal] for more information.

[dReal]: http://dreal.cs.cmu.edu/

Required Packages
-----------------
 - autoconf
 - automake (>= 1.12.5)
 - libtool 
 - g++ 
 - bison 
 - flex 
 - libboost-dev
 - libboost-thread-dev 

We have tested that executing the following command on the newly installed Ubuntu 12.04 LTS
configures all the required packages to build dReal2.

    $ sudo add-apt-repository ppa:dns/gnu
    $ sudo apt-get update
    $ sudo apt-get install autoconf automake libtool git g++ bison flex \
                           libboost-dev libboost-thread-dev 
    $ sudo apt-get upgrade


GLIBC Problem
-------------

We have found that using eglibc (<= 2.15) may cause severe errors in floating
point computation when we change the rounding-mode using `fesetround()`
function. If you're using the latest Mac OSX, you should be fine. If you're
using Ubuntu OS (<= 12.10), please check the version of your eglibc by typing:

    $ ldd --config

If the version is <= 2.15, please check out the latest version of eglibc:

    $ svn co http://www.eglibc.org/svn/trunk eglibc

and install them on your machine. (NOTE: we recommend to install it on your home dir)



How to Build
------------

Building dReal is straight-forward:

    $ autoreconf -i && ./configure && make

If you have the GLIBC problem described above. Try the following:

    $ autoreconf -i
    $ LDFLAGS="-Wl,--rpath=<EGLIBC_PATH>:/usr/lib/x86_64-linux-gnu/:/usr/lib/gcc/x86_64-linux-gnu/4.6:/lib/x86_64-linux-gnu -Wl,--dynamic-linker=<EGLIBC_PATH>/lib/ld-linux-x86-64.so.2" ./configure 
    $ make

