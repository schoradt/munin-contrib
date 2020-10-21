

DEFAULTS = Makefile.config
CONFIG = Makefile.config

include $(DEFAULTS)
ifneq ($(DEFAULTS),$(CONFIG))
    include $(CONFIG)
endif

INSTALL          := ./install-sh

all:

.PHONY: lint
lint:
	# TODO: add "--ignore-words .codespell.ignore-words" as soon as travis supports a newer
	#     testing environment (containing codespell 0.11 or later).
	find plugins/ -type f -not -name "*.png" -not -name "*.conf" -not -name "*.jar" -not -name "*.pyc" -not -name ".git"  -print0 \
		| xargs -0 codespell \
			--exclude-file .codespell.exclude

install-plugins: 
	mkdir -p $(LIBDIR)/plugins

	$(INSTALL) -m 0644 plugins/solr/wfsolr_ $(LIBDIR)/plugins/

