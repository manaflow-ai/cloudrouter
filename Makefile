SKILL_DIR = $(HOME)/.claude/skills

install:
	@mkdir -p $(SKILL_DIR)/cloudrouter
	@cp skills/cloudrouter/SKILL.md $(SKILL_DIR)/cloudrouter/SKILL.md
	@echo "Installed cloudrouter skill to $(SKILL_DIR)/cloudrouter"
	@mkdir -p $(SKILL_DIR)/agent-browser
	@cp skills/agent-browser/SKILL.md $(SKILL_DIR)/agent-browser/SKILL.md
	@echo "Installed agent-browser skill to $(SKILL_DIR)/agent-browser"

uninstall:
	@rm -rf $(SKILL_DIR)/cloudrouter
	@rm -rf $(SKILL_DIR)/agent-browser
	@echo "Removed cloudrouter and agent-browser skills"

.PHONY: install uninstall
