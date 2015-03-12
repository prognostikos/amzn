# amzn

This is a wrapper for [amzn-base](https://github.com/ryandotsmith/amzn-base) and
[amzn-ship](https://github.com/ryandotsmith/amzn-ship) using
[sub](https://github.com/basecamp/sub).

It may evolve into something else at some point, but right now the goal is to
wrap the ui to be more to my liking, enable auto-completion, make it easier to
use from application directories, etc.

## Installation

Clone this repo, enter the directory, and run `./bin/amzn init`. It will display
what to add to your shell configuration file.

## Configuration

`amzn` will source `.amznrc` files in ~/ and the current working directory, in
that order, before running any commands. These files can contain any shell
commands, but are principally used to export the many environment variables used
by amzn-base and amzn-ship.

See the sample [global](sample-global.amznrc) and
[per-application](sample-application.amznrc) files for ideas.

Two environment variables are required by `amzn` itself - the locations of
amzn-base and amzn-ship. e.g.

```
$ echo "export AMZN_BASE_DIR=~/path/to/amzn-base" >> ~/.amznrc
$ echo "export AMZN_SHIP_DIR=~/path/to/amzn-ship" >> ~/.amznrc
```

Feel free to ignore all of this if you're using something else to manage your
environment variables.

## amzn-base wrapper

```
$ amzn help ami
Usage: amzn ami framework base-ami

Builds an ami with the given <framework> based on the given <base-ami>

   amzn ami ruby-nginx ami-234ecc54

NOTE: You must set AMZN_BASE_DIR in your environment to point to your amzn-base directory.
```

(Why `amzn ami` instead of `amzn build-ami`? Because I'm considering adding an
`amzn build` and am addicted to shell completion.)

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
```

```
$ amzn help terminate
Usage: amzn terminate environment [app]

Destroys the ASG, ELB, etc. with amzn-ship

   amzn terminate staging
   amzn terminate staging killer-app

The last argument, [app], is optional, and defaults to the AMZN_APP_NAME environment variable or the name of the current directory if not given.

NOTE: You must set AMZN_SHIP_DIR in your environment to point to your amzn-ship directory.
```

```
$amzn help update-asg
Usage: amzn update-asg environment [app]

Update the ASG with a new AMI, etc.

   amzn update-asg staging
   amzn update-asg staging killer-app

The last argument, [app], is optional, and defaults to the AMZN_APP_NAME environment variable or the name of the current directory if not given.

The new ami id must be in the AMI environment variable.

NOTE: You must set AMZN_SHIP_DIR in your environment to point to your amzn-ship directory.
```
