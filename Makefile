SKILL_SRC = skills/cloudrouter/SKILL.md
SKILL_DIR = $(HOME)/.claude/skills/cloudrouter

install:
	@mkdir -p $(SKILL_DIR)
	@cp $(SKILL_SRC) $(SKILL_DIR)/SKILL.md
	@echo "Installed cloudrouter skill to $(SKILL_DIR)"

uninstall:
	@rm -rf $(SKILL_DIR)
	@echo "Removed cloudrouter skill from $(SKILL_DIR)"

.PHONY: install uninstall
