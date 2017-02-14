# -*- coding: utf-8; mode: makefile-gmake -*-

BRANCH ?= six

.DEFAULT = help

PHONY += help
help::
	@echo  'usage:'
	@echo  '  add-upstream - add upstream remotes to submodules'
	@echo  '  checkout     - in submodules, checkout branch "BRANCH=$(BRANCH)"'
	@echo
	@echo  'options:'
	@echo  '  BRANCH=      - set branch to use (default "$(BRANCH)")'

upstream = @cd $(1); git remote add upstream $(2) 2> /dev/null; echo "upstream: $(2)"

PHONY += add-upstream
add-upstream:
	$(call upstream, hawkauthlib, https://github.com/mozilla-services/hawkauthlib)
	$(call upstream, konfig, https://github.com/mozilla-services/konfig)
	$(call upstream, mozservices, https://github.com/mozilla-services/mozservices)
	$(call upstream, PyBrowserID, https://github.com/mozilla/PyBrowserID)
	$(call upstream, pyramid_hawkauth, https://github.com/mozilla-services/pyramid_hawkauth)
	$(call upstream, syncserver, https://github.com/mozilla-services/syncserver)
	$(call upstream, server-syncstorage, https://github.com/mozilla-services/server-syncstorage)
	$(call upstream, tokenlib, https://github.com/mozilla-services/tokenlib)
	$(call upstream, tokenserver, https://github.com/mozilla-services/tokenserver)
	$(call upstream, m2crypto, https://gitlab.com/m2crypto/m2crypto)

PHONY += checkout
checkout:
	git submodule foreach git checkout $(BRANCH)

# END of Makefile
.PHONY: $(PHONY)
