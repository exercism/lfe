ERL     := $(shell which erl)
LFETOOL := $(shell which lfetool)
REBAR   := $(shell which rebar)

ifeq ($(ERL),)
  $(error Can't find Erlang executable 'erl')
else ifeq ($(LFETOOL),)
  $(error Can't find lfetool)
else ifeq ($(REBAR),)
  $(error Can't find rebar)
endif

get-deps: ; $(REBAR) get-deps

clean: ; rebar clean

.PHONY: test
test: ; ./_test/check-exercises.lfesh
