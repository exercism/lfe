First, make sure you have Erlang installed, following the instructions on the
[Erlang][1] installation page as appropriate.
[1]: /languages/erlang

### Homebrew for Mac OS X

Update your Homebrew to latest:

```bash
$ brew update
```

Install LFE:

```bash
$ brew install lfe
```

### Installing from Source
With your system's "developer tools" or "essential build packages", `git`
and Erlang's `erl` installed, you can download and build LFE with the following:

```bash
$ git clone https://github.com/rvirding/lfe
$ cd lfe
$ make
$ make install
```

Once you have LFE compiled, you can start up the REPL (interactive session)
by executing the ``lfe`` binary:

```bash
$ ./bin/lfe
```

