This is a wrapper for [amzn-base](https://github.com/ryandotsmith/amzn-base) and
[amzn-ship](https://github.com/ryandotsmith/amzn-ship) based on
[sub](https://github.com/basecamp/sub).

It may evolve into something else at some point, but right now the goal is to
change the ui to be more to my liking, enable auto-completion, allow them to be
used from any directory, etc.

`amzn` will source `.amznrc` files in ~/ and the current working directory, in
that order, before running any commands.

## amzn-base wrapper

```
$ amzn help ami
Usage: amzn ami framework base-ami

Builds an ami with the given <framework> based on the given <base-ami>

   amzn ami ruby-nginx ami-234ecc54

NOTE: You must set AMZN_BASE_DIR in your environment to point to your amzn-base directory.
$ echo "export AMZN_BASE_DIR=~/c/lib/amzn-base" >> .amznrc
$ amzn ami ruby-nginx ami-234ecc54
```

## amzn-ship wrapper

These commands will infer the name of the application from the AMZN_APP_NAME
environment variable or the name of the current directory if it is not specified
as an argument.

```
$ amzn help setup
Usage: amzn setup environment [app]

Sets up an ASG, ELB, etc. with amzn-ship

   amzn setup staging
   amzn setup staging killer-app

The last argument, [app], is optional, and defaults to the AMZN_APP_NAME environment variable or the name of the current directory if not given.

NOTE: You must set AMZN_SHIP_DIR in your environment to point to your amzn-ship directory.
$ echo "export AMZN_SHIP_DIR=~/c/lib/amzn-ship" >> .amznrc
$ amzn setup staging
```

```
$ amzn help terminate
Usage: amzn terminate environment [app]

Destroys the ASG, ELB, etc. with amzn-ship

   amzn terminate staging
   amzn terminate staging killer-app

The last argument, [app], is optional, and defaults to the AMZN_APP_NAME environment variable or the name of the current directory if not given.

NOTE: You must set AMZN_SHIP_DIR in your environment to point to your amzn-ship directory.
$ amzn terminate staging
```
