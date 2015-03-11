This is a wrapper for [amzn-base](https://github.com/ryandotsmith/amzn-base) and
[amzn-ship](https://github.com/ryandotsmith/amzn-ship) based on
[sub](https://github.com/basecamp/sub).

It may evolve into something else at some point, but right now the goal is to
change the ui to be more to my liking, enable auto-completion, etc.

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
