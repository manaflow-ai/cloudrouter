# cloudrouter

Agent skill for managing cloud development sandboxes with [cloudrouter](https://cloudrouter.dev). Gives your AI coding agent the ability to create, sync, and access remote VMs with built-in browser automation via Chrome CDP.

## Install

```bash
npx skills add manaflow-ai/cloudrouter
```

Or install for a specific agent:

```bash
npx skills add manaflow-ai/cloudrouter -a claude-code
npx skills add manaflow-ai/cloudrouter -a cursor
```

### Claude Code Integration

If you cloned this repo, you can install/uninstall the skill directly:

| Command | Description |
|---------|-------------|
| `make install` | Install cloudrouter skill to `~/.claude/skills/cloudrouter/` |
| `make uninstall` | Remove cloudrouter skill from `~/.claude/skills/cloudrouter/` |

## Prerequisites

You need the cloudrouter CLI installed:

```bash
npm install -g @manaflow-ai/cloudrouter
```

This installs both `cloudrouter` and `cr` (shorthand) as CLI commands.

Then authenticate:

```bash
cloudrouter login
```

## What your agent can do

Once installed, your AI coding agent gains the ability to:

### Spin up cloud sandboxes

```bash
cloudrouter start .                    # Create sandbox from current directory
cloudrouter start ./my-project         # Create sandbox from a specific directory
cloudrouter start --git user/repo      # Clone a git repo into sandbox
cloudrouter start --docker             # Create sandbox with Docker support
```

### Access sandboxes

```bash
cloudrouter code <id>                  # Open VS Code in browser
cloudrouter vnc <id>                   # Open VNC desktop in browser
cloudrouter pty <id>                   # Interactive terminal session
cloudrouter exec <id> <command>        # Run a one-off command
```

### Transfer files

```bash
cloudrouter upload <id> ./my-project   # Push local files to sandbox
cloudrouter download <id> ./output     # Pull files from sandbox
cloudrouter upload <id> . --watch      # Watch and re-upload on changes
```

### Automate the browser

```bash
cloudrouter computer open <id> <url>           # Navigate to URL
cloudrouter computer snapshot <id>             # Get accessibility tree (@e1, @e2...)
cloudrouter computer screenshot <id> out.png   # Take screenshot
cloudrouter computer click <id> @e1            # Click element
cloudrouter computer fill <id> @e2 "value"     # Fill input
cloudrouter computer type <id> "text"          # Type into focused element
cloudrouter computer press <id> Enter          # Press key
```

### Manage lifecycle

```bash
cloudrouter ls                         # List all sandboxes
cloudrouter status <id>                # Show sandbox details
cloudrouter stop <id>                  # Stop sandbox
cloudrouter delete <id>                # Delete sandbox permanently
cloudrouter extend <id>                # Extend sandbox timeout
```

## Example workflows

### Local-to-cloud development

```bash
cloudrouter start ./my-project
cloudrouter code cr_abc123
cloudrouter pty cr_abc123            # npm install && npm run dev
```

### Browser automation: login flow

```bash
cloudrouter computer open cr_abc123 "https://example.com/login"
cloudrouter computer snapshot cr_abc123
# @e1 [input] Email, @e2 [input] Password, @e3 [button] Sign In

cloudrouter computer fill cr_abc123 @e1 "user@example.com"
cloudrouter computer fill cr_abc123 @e2 "password123"
cloudrouter computer click cr_abc123 @e3
cloudrouter computer screenshot cr_abc123 result.png
```

### Web scraping

```bash
cloudrouter computer open cr_abc123 "https://example.com/data"
cloudrouter computer snapshot cr_abc123
cloudrouter computer screenshot cr_abc123
```

## Tips

- Use `--json` flag for machine-readable output
- Use `-t <team>` to override default team
- Use `-v` for verbose output
- Always run `snapshot` before interacting with elements
- Prefer element refs (`@e1`) over CSS selectors for reliability
- Sandbox IDs look like `cr_abc12345` -- get them from `cloudrouter ls`

## License

MIT
