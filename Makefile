SKILL_DIR = $(HOME)/.claude/skills

install:
	@mkdir -p $(SKILL_DIR)/cloudrouter
	@cp skills/cloudrouter/SKILL.md $(SKILL_DIR)/cloudrouter/SKILL.md
	@echo "Installed cloudrouter skill to $(SKILL_DIR)/cloudrouter"

uninstall:
	@rm -rf $(SKILL_DIR)/cloudrouter
	@echo "Removed cloudrouter skill"

.PHONY: install uninstall
