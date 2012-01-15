#=============================================================================
#       FileName: Makefile
#    Description: Vim Makefile Template
#
#         Author: Zhao Cai
#          Email: caizhaoff@gmail.com
#       HomePage:
#        Version: 0.1
#   Date Created: Tue Nov 15, 2011  02:46AM
#  Last Modified: Tue Nov 15, 2011  02:46AM
#=============================================================================

#=============================================================================
#>> Configuration                                                         {{{1
PLUGIN=$(shell basename "$$PWD")
VERSION=1.0

# files
plugin_files=$(wildcard plugin/*.vim)
autoload_files=$(wildcard autoload/*.vim)
doc_files=$(wildcard doc/*.txt)
ftdetect_files=$(wildcard ftdetect/*.txt)
ftplugin_files=$(wildcard ftplugin/*.txt)
indent_files=$(wildcard indent/*.txt)
colors_files=$(wildcard colors/*.txt)
syntax_files=$(wildcard syntax/*.txt)

all_files = $(plugin_files) $(autoload_files) $(doc_files) \
	$(ftdetect_files) $(ftplugin_files) $(indent_files)\
	$(syntax_files) $(colors_files)

# path
vimdir=$(HOME)/.vim
bundledir=$(vimdir)/bundle

# command
VIM=vim
INSTALL = install

#=============================================================================
#>> Rules                                                                 {{{1
all:
	cat README.md | pandoc | html2vimdoc.py -f unite-scriptnames.txt > doc/unite-scriptnames.txt

vimball: $(PLUGIN).vba

gzip: vimball
	gzip -f $(PLUGIN)-$(VERSION).vba

$(PLUGIN).vba: $(all_files)
	@printf "%s\n" $^ | $(VIM) \
		-c 'let g:vimball_home="."' \
		-c '%MkVimball! $(PLUGIN)-$(VERSION)' \
		-c 'q!' - > /dev/null

install:install-bundle

install-vba: $(PLUGIN).vba
	$(VIM) -c 'source %' -c 'q' $<

VIM_DIRS := $(addprefix $(vimdir)/,$(dir $(all_files)))
install-vim:
	@$(INSTALL) -d $(VIM_DIRS)
	@for f in $(all_files); do \
		$(INSTALL) -v -m 644 "$$f" "$(vimdir)/$$f"; \
	done

uninstall-vim:
	for f in $(all_files); do \
		rm -f "$(vimdir)/$$f"; \
	done

# BUNDLE_DIRS := $(addprefix $(bundledir)/$(PLUGIN)/,$(dir $(all_files)))
# install-bundle:
# 	@$(INSTALL) -d $(BUNDLE_DIRS)
# 	@for f in $(all_files); do \
# 		$(INSTALL) -v -m 644 "$$f" "$(bundledir)/$(PLUGIN)/$$f"; \
# 	done
# 	@echo "add to .vimrc:"
# 	@echo "Bundle '$(PLUGIN)'"

install-bundle:
	origin_url=$$(git remote -v | grep '(fetch)' | awk '{print $$2}') && \
	    git clone $$origin_url $(bundledir)/$(PLUGIN)
	@echo "add to .vimrc:"
	@echo "	Bundle '$(PLUGIN)'"

uninstall-bundle:
	rm -rf $(bundledir)/$(PLUGIN)

dist:
	git archive --prefix='$(PLUGIN).vim/' HEAD | gzip -9 > $(PLUGIN).vim.tar.gz

clean:
	-rm -f *.vba */*.orig .VimballRecord *.zip *.gz

dist-clean: clean

.PHONY: all clean dist install install-bundle uninstall-bundle install-vim uninstall-vim
.PHONY: gzip vimball $(PLUGIN)-$(VERSION).vba

#  vim: set ft=make ts=8 sw=4 tw=78 fdm=syntax :
