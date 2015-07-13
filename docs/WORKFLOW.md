## Running tests

Setup needed (only needs to be done once):

```bash
$ rebar get-deps
$ rebar compile
$ export ERL_LIBS=$(find deps -maxdepth 1 -mindepth 1 | tr '\n' ':')
```

If you're not using Bash, change the last command to what is needed to set an
environment variable in your shell.

For each example, the following general steps are required:

```bash
$ mv <problem>/example.lfe <problem>/<module>.lfe
$ lfec -o <problem> <problem>/*.lfe
$ lfe -pa <problem> -noshell -eval \
  "(eunit:test '<module>-tests '(verbose))" \
  -s init stop
```

Here's a specific example, using the "bob" problem:

```bash
$ mv bob/example.lfe bob/bob.lfe
$ lfec -o bob bob/*.lfe
$ lfe -pa bob -noshell -eval \
  "(eunit:test 'bob-tests '(verbose))" \
  -s init stop
```

When you're done running the tests, don't forget to put the example back where you got it!

```bash
mv bob/bob.lfe bob/example.lfe
```
