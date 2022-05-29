.POSIX:
.PHONY: local clean help

SHELL   = /bin/sh

SRC       = src
DST       = public
TITLE     = Nicholas Ivkovic
TITLESEP  = " - "
BASEURL   = https://nivkovic.net
BLOGSRC   = $(SRC)/blog
BLOGINDEX = $(BLOGSRC)/index.md

$(DST): $(BLOGINDEX)
	mkdir -p $(DST)
	./bin/ssg6 $(SRC) $(DST) "$(TITLE)" "$(BASEURL)" $(TITLESEP)
	rm -f $(BLOGINDEX)

local: BASEURL = file://$(PWD)/$(DST)
local: $(DST)

$(BLOGINDEX):
	./bin/mkblogindex $(BLOGSRC) > $(BLOGINDEX)

clean:
	rm -rf $(DST)

help:
	@echo
	@echo "         Build site"
	@echo " local   Build site with local URL"
	@echo " clean   Remove built site"
	@echo " help    Display help"
	@echo

