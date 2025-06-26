# MCP Server Configurations

This directory contains pre-configured MCP (Model Context Protocol) server setups for Gemini CLI.

## Quick Setup

Copy any configuration file to your `.gemini/settings.json`:

```bash
# Copy individual server config
cp mcp-servers/github.json ~/.gemini/settings.json

# Or copy the comprehensive team config
cp mcp-servers/team-config.json ~/.gemini/settings.json
```

## Available Configurations

### Individual Servers

- **`github.json`** - GitHub integration
- **`sqlite.json`** - SQLite database operations  
- **`sentry.json`** - Error tracking and monitoring

### Combined Configurations

- **`team-config.json`** - Complete team setup with multiple servers

## Environment Variables Required

Make sure to set these environment variables before using the configurations:

```bash
# GitHub integration
export GITHUB_PERSONAL_ACCESS_TOKEN="your_github_token"

# Web search (if using team-config)
export SEARCH_API_KEY="your_search_api_key"
```

## Usage Examples

After setting up a configuration:

```bash
# Start Gemini CLI with MCP servers
gemini

# Check available MCP tools
/mcp

# Use GitHub integration
gemini --prompt "List my recent repositories"

# Use Sentry integration  
gemini --prompt "Show recent errors from Sentry"

# Use SQLite integration
gemini --prompt "Query the database for user statistics"
```

## Customization

You can modify these configurations:

1. **Change database paths** in `sqlite.json`
2. **Add more servers** to `team-config.json` 
3. **Adjust model settings** (temperature, maxTokens)
4. **Customize system prompts** for your use case

## Security Notes

- Never commit actual tokens/API keys to version control
- Use environment variables for sensitive data
- Set minimal required permissions for tokens
- Regularly rotate API keys and tokens 