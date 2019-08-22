# This script needs to be placed in the sudoers 'secure_path'
BIN = /usr/local/bin/ghi

.PHONY: install update uninstall

update:
	@git pull --rebase

install: $(BIN)

$(BIN):
	ln -s --force $(CURDIR)/$(@F) $@

uninstall:
	rm -f $(BIN)
