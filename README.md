# Frama-C plugin example

Based on [this guide](https://frama-c.com/download/frama-c-plugin-development-guide.pdf).

# Setup

First, make sure you have Frama-C installed using opam.

Run `make merlin` so that your editor can find Frama-C's libraries.

Run `make` to build the plugin.

Run `frama-c -load-module top/FuncInfo -finfo` to run the plugin. Output will be logged to stdout.

Run `make install` to install the plugin into Frama-C's plugin directory.
