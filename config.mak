NAME        := bwp
CREATED     := 2022-05-04
DESCRIPTION := short description for the script
VERSION     := 0
AUTHOR      := anon
CONTACT     := address
USAGE       := $(NAME) [OPTIONS]
# if USAGE is set to the string 'options' 
# the content of OPTIONS_FILE will be used.
# USAGE       := options
# ---
# man page and readme will only be created if they are set
# MANPAGE     := $(NAME).1
# README      := README.md
# ---
# the conent of man page and readme can be configured
# by setting the MANPAGE_LAYOUT and README_LAYOUT
# `bashbud --template readme` can be used to create
# the default boilerplate files in docs/
#
MANPAGE_LAYOUT =                \
	$(DOCS_DIR)/manpage_banner.md \
	$(CACHE_DIR)/help_table.txt   \
	$(DOCS_DIR)/manpage_footer.md \
# ---
# ORGANISATION is visible in the man page.
# ORGANISATION   :=
# ---
# README_LAYOUT  =                \
# 	$(DOCS_DIR)/readme_banner.md  \
# 	$(DOCS_DIR)/readme_install.md \
# 	$(CACHE_DIR)/help_table.txt   \
# 	$(DOCS_DIR)/readme_usage.md
# ---
# LICENSE is path to a file containg the license
# not the name of the license.
# if the file exist when target install: is invoked
# it will also install LICENSE
# LICENSE        := LICENSE
# ---


# MANPAGE_OUT is automatically set to 
# MANPAGE_OUT := _$(MANPAGE)
# and it will get generated (with go-md2man) 
# if it doesn't exist. MANPAGE_OUT will be installed
# as MANPAGE.
# but
# If MANPAGE_OUT is set to a name NOT containing
# an underscore (_), instead MANPAGE will be set
# to MANPAGE = MANPAGE_OUT and the manpage will 
# NOT be generated. But it will be installed.
# MANPAGE_OUT := $(NAME).1

# --- INSTALLATION RULES --- #
installed_manpage    = $(DESTDIR)$(PREFIX)/share/man/man$(manpage_section)/$(MANPAGE)
installed_script    := $(DESTDIR)$(PREFIX)/bin/$(NAME)
installed_license   := $(DESTDIR)$(PREFIX)/share/licenses/$(NAME)/$(LICENSE)

install: all
	@[[ -n $${manpage:=$(MANPAGE_OUT)} && -f $$manpage ]] && {
		echo "install -Dm644 $(MANPAGE_OUT) $(installed_manpage)"
		install -Dm644 $(MANPAGE_OUT) $(installed_manpage)
	}
	[[ -n $${license:=$(LICENSE)} && -f $$license ]] && {
		echo "install -Dm644 $(LICENSE) $(installed_license)"
		install -Dm644 $(LICENSE) $(installed_license)
	}

	echo "install -Dm755 $(MONOLITH) $(installed_script)"
	install -Dm755 $(MONOLITH) $(installed_script)

uninstall:
	@for f in $(installed_script) $(installed_manpage) $(installed_license); do
		[[ -f $$f ]] || continue
		echo "rm $$f"
		rm "$$f"
	done

# -------------------------- #
# SHBANG will be used in all generated scripts
#
# SHBANG         := \#!/bin/bash
# ---
# MONOLITH is the name of the "combined" script
# it will be installed (as NAME)
#
# MONOLITH        := _$(NAME).sh
# ---
# BASE holds automatically generated stuff like
# while getopts ... and __print_help() is must
# be sourced by NAME
#
# BASE            := _init.sh
# ---
# INDENT defines the indentation used in generated
# files. it defaults to two spaces ("  ").
# To use two tabs instead, set the variable to:
#   INDENT := $(shell echo -e "\t\t")
#
# INDENT          := $(shell echo -e "  ")
# ---
# leave UPDATED unset to auto set to current day
#
# UPDATED        := $(shell date +%Y-%m-%d)
# ---
# FUNCS_DIR      != func
# ---
# if AWK_DIR or CONF_DIR are not empty
# special functions will get created in func/
# --- 
# AWK_DIR        := awklib
# CONF_DIR       := conf
# ---
# CACHE_DIR      := .cache
# DOCS_DIR       := docs
# OPTIONS_FILE   := options
# ---
#
# include custom targets in this file.
# be sure to add them to CUSTOM_TARGETS list
# to have them be part of the DEFAULT_GOAL (all)
# 
# custom_target.txt: options
# 	cat $< > $@
#
# CUSTOM_TARGETS += custom_target.txt
# CUSTOM_TARGETS =
