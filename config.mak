NAME         := bwp
CREATED      := 2019-08-09
UPDATED      := 2022-05-26
DESCRIPTION  := budlabs wallpaper selector
VERSION      := 2022.05.26.1
AUTHOR       := budRich
CONTACT      := https://github.com/budlabs/bwp
ORGANISATION := budlabs
USAGE        := $(NAME) [OPTIONS] [WALLPAPER]
LICENSE      := MIT

MANPAGE_DEPS =                \
	$(CACHE_DIR)/help_table.txt \
	$(CACHE_DIR)/synopsis.txt   \
	$(CACHE_DIR)/long_help.md   \
	$(DOCS_DIR)/usage.md        \
	$(DOCS_DIR)/environment.md  \
	$(CACHE_DIR)/copyright.txt  \
	$(DOCS_DIR)/manpage_footer.md

# CUSTOM_TARGETS += $(MANPAGE_OUT)
MANPAGE_OUT = $(MANPAGE)
.PHONY: manpage
manpage: $(MANPAGE_OUT)

$(MANPAGE_OUT): config.mak $(MANPAGE_DEPS) 
	@$(info making $@)
	uppercase_name=$(NAME)
	uppercase_name=$${uppercase_name^^}
	{
		# this first "<h1>" adds "corner" info to the manpage
		echo "# $$uppercase_name "           \
				 "$(manpage_section) $(UPDATED)" \
				 "$(ORGANISATION) \"User Manuals\""

		# main sections (NAME|OPTIONS..) should be "<h2>" (##), sub (###) ...
	  printf '%s\n' '## NAME' \
								  '$(NAME) - $(DESCRIPTION)'

		echo "## SYNOPSIS"
		sed 's/^/    /g' $(CACHE_DIR)/synopsis.txt
		echo "## USAGE"
		cat $(DOCS_DIR)/usage.md
		echo "## OPTIONS"
		sed 's/^/    /g' $(CACHE_DIR)/help_table.txt
		cat $(CACHE_DIR)/long_help.md
		cat $(DOCS_DIR)/environment.md

		printf '%s\n' '## CONTACT' \
			"Send bugs and feature requests to:  " "$(CONTACT)/issues"

		printf '%s\n' '## COPYRIGHT'
		cat $(CACHE_DIR)/copyright.txt

		cat $(DOCS_DIR)/manpage_footer.md

	} | go-md2man > $@

# CUSTOM_TARGETS += README.md

README_DEPS =                        \
	$(CACHE_DIR)/help_table.txt        \
	$(DOCS_DIR)/usage.md               \
	$(DOCS_DIR)/readme_description.md  \
	$(DOCS_DIR)/readme_dependencies.md \
	$(DOCS_DIR)/readme_install.md

README.md: $(README_DEPS)
	@$(info making $@)
	{
		echo "# $(NAME) - $(DESCRIPTION)"
		cat $(DOCS_DIR)/readme_description.md
		echo "## installation"
		cat $(DOCS_DIR)/readme_install.md
		echo "## usage"
		echo "    $(USAGE)"
		sed 's/^/    /g' $(CACHE_DIR)/help_table.txt
		cat $(DOCS_DIR)/usage.md
		echo "## dependencies"
		cat $(DOCS_DIR)/readme_dependencies.md

	} > $@


# --- INSTALLATION RULES --- #
installed_manpage    = $(DESTDIR)$(PREFIX)/share/man/man$(manpage_section)/$(MANPAGE)
installed_script    := $(DESTDIR)$(PREFIX)/bin/$(NAME)
installed_license   := $(DESTDIR)$(PREFIX)/share/licenses/$(NAME)/$(LICENSE)

install: all
	install -Dm644 $(MANPAGE_OUT) $(installed_manpage)
	install -Dm644 LICENSE $(installed_license)
	install -Dm755 $(MONOLITH) $(installed_script)

uninstall:
	@for f in $(installed_script) $(installed_manpage) $(installed_license); do
		[[ -f $$f ]] || continue
		echo "rm $$f"
		rm "$$f"
	done
