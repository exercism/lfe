### Erlang

#### Homebrew for Mac OS X

Update your Homebrew to latest:

```bash
$ brew update
```

Install Erlang:

```bash
$ brew install erlang
```

#### On Linux

Fedora 17+ and Fedora Rawhide: `sudo yum -y install erlang`
Arch Linux : Erlang is available on AUR via `yaourt -S erlang`

#### Installing from Source

Get [Erlang OTP 17.4](http://www.erlang.org/download.html)

### LFE

With your system's "developer tools" or "essential build packages,``git``, and Erlang's ``erl`` installed, you can download and build LFE with the following:

```bash
$ git clone https://github.com/rvirding/lfe
$ cd lfe
$ make
```

Once you have LFE compiled, you can start up the REPL (interactive session) by executing the ``lfe`` binary:

```bash
./bin/lfe
```
