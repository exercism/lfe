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
