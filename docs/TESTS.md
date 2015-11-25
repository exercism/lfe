Setup needed (only needs to be done once):

```bash
$ cd /path/to/exercism/lfe
$ rebar get-deps compile
$ export ERL_LIBS=$(find deps -maxdepth 1 -mindepth 1 | tr '\n' ':')
```

If you're not using Bash, change the last command to what is needed to set an
environment variable in your shell, e.g. for [fish][2]:

```fish
$ set -xU ERL_LIBS (find deps -maxdepth 1 -mindepth 1 | tr '\n' ':')
```

[2]: http://fishshell.com

For each example, the following general steps are required.

First, compile the module and its tests.

```bash
$ cd /path/to/exercism/lfe/<exercise>
```

```bash
$ mkdir -p ebin
$ lfec -o ebin src/<module>.lfe test/<module>-tests.lfe
```

or

```bash
$ cd bob
$ make compile
```

Then run the tests.

```bash
$ lfe -pa ebin -noshell -eval \
  "(eunit:test '<module>-tests '(verbose))" \
  -s init stop
```

or

```bash
$ make test
```

NB The `test` make target depends on `compile`, so to compile
and test, `make test` is all that's required.


Here's a specific example, using the "bob" exercise:

```bash
$ cd bob
$ mkdir -p ebin
$ lfec -o ebin src/bob.lfe test/bob-tests.lfe
$ lfe -pa ebin -noshell -eval \
  "(eunit:test 'bob-tests '(verbose))" \
  -s init stop
```

Or, using `make`:

```bash
$ make test
```

Although in the wild, LFE dependencies are conventionally project-local,
we've set up symbolic links in each exercise to `../deps`, meaning you only
have to call `rebar get-deps compile` once in the lfe track directory
and the resulting `deps` will be shared across all the exercises.

