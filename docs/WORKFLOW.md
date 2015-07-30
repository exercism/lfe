## Running Tests

Setup needed (only needs to be done once):

```bash
$ rebar get-deps
$ rebar compile
$ export ERL_LIBS=$(find deps -maxdepth 1 -mindepth 1 | tr '\n' ':')
```

If you're not using Bash, change the last command to what is needed to set an
environment variable in your shell, e.g. for [fish][1]:

```fish
$ set -xU ERL_LIBS (find deps -maxdepth 1 -mindepth 1 | tr '\n' ':')
```

[1]: http://fishshell.com

For each example, the following general steps are required:

```bash
$ lfec -o <problem> <problem>/*.lfe
$ lfe -pa <problem> -noshell -eval \
  "(eunit:test '<module>-tests '(verbose))" \
  -s init stop
```

Here's a specific example, using the "bob" problem:

```bash
$ lfec -o bob bob/*.lfe
$ lfe -pa bob -noshell -eval \
  "(eunit:test 'bob-tests '(verbose))" \
  -s init stop
```
