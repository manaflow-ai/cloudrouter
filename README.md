# cloudrouter

Agent skill for managing cloud development sandboxes with [cmux](https://cmux.sh). Gives your AI coding agent the ability to create, sync, and access remote VMs with built-in browser automation via Chrome CDP.

## Install

```bash
npx skills add manaflow-ai/cloudrouter
```

Or install for a specific agent:

```bash
npx skills add manaflow-ai/cloudrouter -a claude-code
npx skills add manaflow-ai/cloudrouter -a cursor
```

## Prerequisites

You need the cmux CLI installed:

```bash
npm install -g cmux
```

Then authenticate:

```bash
cmux login
```

## What your agent can do

Once installed, your AI coding agent gains the ability to:

### Spin up cloud sandboxes

```bash
cmux start .                    # Create sandbox from current directory
cmux start ./my-project         # Create sandbox from a specific directory
cmux start --git user/repo      # Clone a git repo into sandbox
cmux start --docker             # Create sandbox with Docker support
```

### Access sandboxes

```bash
cmux code <id>                  # Open VS Code in browser
cmux vnc <id>                   # Open VNC desktop in browser
cmux pty <id>                   # Interactive terminal session
cmux exec <id> <command>        # Run a one-off command
```

### Transfer files

```bash
cmux upload <id> ./my-project   # Push local files to sandbox
cmux download <id> ./output     # Pull files from sandbox
cmux upload <id> . --watch      # Watch and re-upload on changes
```

### Automate the browser

```bash
cmux computer open <id> <url>           # Navigate to URL
cmux computer snapshot <id>             # Get accessibility tree (@e1, @e2...)
cmux computer screenshot <id> out.png   # Take screenshot
cmux computer click <id> @e1            # Click element
cmux computer fill <id> @e2 "value"     # Fill input
cmux computer type <id> "text"          # Type into focused element
cmux computer press <id> Enter          # Press key
```

### Manage lifecycle

```bash
cmux ls                         # List all sandboxes
cmux status <id>                # Show sandbox details
cmux stop <id>                  # Stop sandbox
cmux delete <id>                # Delete sandbox permanently
cmux extend <id>                # Extend sandbox timeout
```

## Example workflows

### Local-to-cloud development

```bash
cmux start ./my-project
cmux code cmux_abc123
cmux pty cmux_abc123            # npm install && npm run dev
```

### Browser automation: login flow

```bash
cmux computer open cmux_abc123 "https://example.com/login"
cmux computer snapshot cmux_abc123
# @e1 [input] Email, @e2 [input] Password, @e3 [button] Sign In

cmux computer fill cmux_abc123 @e1 "user@example.com"
cmux computer fill cmux_abc123 @e2 "password123"
cmux computer click cmux_abc123 @e3
cmux computer screenshot cmux_abc123 result.png
```

### Web scraping

```bash
cmux computer open cmux_abc123 "https://example.com/data"
cmux computer snapshot cmux_abc123
cmux computer screenshot cmux_abc123
```

## Tips

- Use `--json` flag for machine-readable output
- Use `-t <team>` to override default team
- Use `-v` for verbose output
- Always run `snapshot` before interacting with elements
- Prefer element refs (`@e1`) over CSS selectors for reliability
- Sandbox IDs look like `cmux_abc12345` -- get them from `cmux ls`

## License

MIT
