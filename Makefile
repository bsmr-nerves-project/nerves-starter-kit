ifeq ($(NERVES_ROOT),)
    $(error Remember to source nerves-env.sh before building)
endif

ERL_LIB = $(NERVES_SDK_SYSROOT)/usr/lib/erlang/lib
ELX_LIB = $(NERVES_SDK_ROOT)/usr/lib/elixir/lib
REL2FW = $(NERVES_ROOT)/scripts/rel2fw.sh

all: firmware

deps: mix.exs mix.lock
	mix deps.get
	# touch the deps folder so that we skip this step on
	# the next build
	touch deps

compile: deps
	mix compile

release: compile
	relx --system_libs $(ERL_LIB) -l $(ELX_LIB)

firmware: release
	$(REL2FW) _rel

clean:
	mix clean; rm -fr _build _rel _images

distclean: clean
	-rm -fr ebin deps 

realclean: distclean

.PHONY: firmware compile clean distclean realclean
