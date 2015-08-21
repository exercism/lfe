ERL     := $(shell which erl)
REBAR   := $(shell which rebar)

ifeq ($(ERL),)
  $(error Can't find Erlang executable 'erl')
else ifeq ($(REBAR),)
  $(error Can't find rebar)
endif

get-deps: ; $(REBAR) get-deps

clean: ; $(REBAR) clean

compile: ; $(REBAR) compile

test: get-deps compile; ./deps/lfe/bin/lfescript ./_test/check-exercises.lfesh
