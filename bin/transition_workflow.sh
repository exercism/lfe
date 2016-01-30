#!/usr/bin/env bash

EXERCISE="$1"
DESCRIPTION="$2"

read -d '' MAKEFILE <<"EOF"
ERL     = $(shell which erl)
LFETOOL = $(shell which lfetool)
REBAR   = $(shell which rebar)

ifeq ($(ERL),)
  $(error Can't find Erlang executable 'erl')
else ifeq ($(LFETOOL),)
  $(error Can't find lfetool)
else ifeq ($(REBAR),)
  $(error Can't find rebar)
endif

get-deps: ; $(REBAR) get-deps compile

clean: ; rebar clean

compile: ; $(REBAR) compile

test: compile; $(LFETOOL) tests unit

EOF

read -d '' REBAR_CONFIG <<"EOF"
{erl_opts, [debug_info, {src_dirs, ["test"]}]}.
{lfe_first_files, []}.
{deps_dir, ["deps"]}.
{eunit_compile_opts,
 [{src_dirs, ["test"]}]}.
{deps,
 [{lfe,   ".*", {git, "git://github.com/rvirding/lfe.git", {tag, "v0.9.2"}}},
  {ltest, ".*", {git, "git://github.com/lfex/ltest.git",   {tag, "0.6.1"}}}]}.

EOF

app () {
  read -d '' APP_SRC <<"EOF"
%% -*- erlang -*-
{application, 'EXERCISE',
 [{description, "DESCRIPTION"},
  {vsn, "0.0.1"},
  {modules,
   ['EXERCISE']},
  {registered, []},
  {applications,
   [kernel, stdlib]},
  {included_applications, []},
  {env, []}]}.

EOF
  echo "$APP_SRC" | sed 's/EXERCISE/'"$1"'/g;s/DESCRIPTION/'"$2"'/'
}

mkdir -p $EXERCISE/{src,test}

SRC=$EXERCISE/src
TEST=$EXERCISE/test

mv $EXERCISE/example.lfe $SRC
mv $EXERCISE/*-tests.lfe $TEST

app "$EXERCISE" "$DESCRIPTION" > $SRC/$EXERCISE.app.src
echo "$MAKEFILE" > $EXERCISE/Makefile
echo "$REBAR_CONFIG" > $EXERCISE/rebar.config
mkdir -p deps && cd $EXERCISE && ln -s ../deps deps
