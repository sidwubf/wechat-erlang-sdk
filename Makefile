APPLICATION := wechat

ERL := erl

.PHONY: all doc clean test

all: compile

bootstrap:
	@./rebar get-deps

compile:
	@./rebar compile

doc:
	@./rebar skip_deps=true doc

clean:
	@./rebar skip_deps=true clean

depclean:
	@./rebar clean

distclean:
	@./rebar delete-deps

dialyze: compile
	@dialyzer -r .

test:
	@./rebar skip_deps=true eunit
