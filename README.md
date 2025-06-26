<div align="center">
  <img src="assets/banner.svg" alt="Gemini CLI Banner" width="800"/>
</div>

# Awesome Gemini CLI [![Awesome](https://awesome.re/badge.svg)](https://awesome.re)

> A curated list of awesome resources, tools, workflows, and guides for Google's Gemini CLI

[Gemini CLI](https://developers.google.com/gemini-code-assist/docs/gemini-cli) is Google's official open-source AI agent that brings the power of Gemini directly into your terminal. This repository serves as a comprehensive collection of resources to help you get the most out of Gemini CLI. Gemini Code Assist gives you access to Gemini CLI. Gemini CLI provides powerful AI capabilities, from code understanding and file manipulation to command execution and dynamic troubleshooting, offering a fundamental upgrade to your command line experience.

## Contents

<details>
<summary><strong>🚀 Getting Started</strong> - <em>Everything you need to begin</em></summary>

- [📚 Official Resources](#official-resources) - Documentation, repos, and official guides
- [⚡ Installation & Setup](#installation--setup) - Get up and running in 5 minutes
  - [Video Tutorials](#video-tutorials) - Learn by watching
  - [Blog Posts & Tutorials](#blog-posts--tutorials) - In-depth written guides
- [🎯 Essential Commands](#essential-commands) - Core CLI commands you'll use daily
- [🏃 Quick Start Workflows](#quick-start-workflows) - Ready-to-use patterns
</details>

<details>
<summary><strong>⚙️ Configuration & Tools</strong> - <em>Extend and customize Gemini CLI</em></summary>

- [🔌 MCP Servers](#mcp-servers) → [📁 Configurations](mcp-servers/) - Extend functionality
- [📝 GEMINI.md Templates](#geminimd-templates) → [📁 Templates](templates/) - Project context files
- [🛠️ Community Tools](#community-tools) - Alternative implementations and add-ons
</details>

<details>
<summary><strong>💼 Practical Usage</strong> - <em>Real-world applications and workflows</em></summary>

- [🔄 Workflows & Use Cases](#workflows--use-cases) - Proven development patterns
- [🤖 Scripts & Automation](#scripts--automation) → [📁 Scripts](scripts/) - Ready-to-use automation
- [🚀 Advanced Tips & Tricks](#advanced-tips--tricks) - Power user techniques
</details>

<details>
<summary><strong>🤝 Community</strong> - <em>Connect and contribute</em></summary>

- [➕ Contributing](#contributing) - How to add your contributions
- [💬 Community Resources](#community-resources) - Forums, Discord, and discussions
</details>

## Official Resources

> Official documentation and resources from Google

- [Gemini CLI Documentation](https://developers.google.com/gemini-code-assist/docs/gemini-cli) - Official documentation
- [Gemini CLI GitHub Repository](https://github.com/google/generative-ai-tools) - Official open-source repository
- [Gemini CLI Launch Blog](https://blog.google/technology/developers/introducing-gemini-cli-open-source-ai-agent/) - Official announcement
- [Gemini Code Assist Documentation](https://developers.google.com/gemini-code-assist) - Related AI coding assistant
- [Google AI Studio](https://aistudio.google.com/) - For API keys and model management

## Installation & Setup

> Get Gemini CLI up and running quickly

```bash
# Install Gemini CLI
npm install -g @google/gemini-cli

# Verify installation
gemini --version

# Start interactive mode
gemini
```

### Quick Setup Resources
- [Gemini Code Assist: AI-first coding in your natural language](https://codeassist.google/) - Introduction and hands-on tutorial

### Video Tutorials

#### Official & Popular Tutorials
- [Introducing Gemini CLI](https://www.youtube.com/watch?v=KUCZe1xBKFM) - Detailed introduction video
- [Gemini CLI in 6 Minutes: Google's Free and Open-Source Coding Assistant](https://www.youtube.com/watch?v=T76NbeTdDFA) - Quick overview
- [Gemini CLI - How to Install, Setup and Use Tutorial](https://www.youtube.com/watch?v=6izVe1KtW_c) - Complete setup guide

#### Recent Community Reviews
- [Gemini CLI — Google's Free Open-Source Coding Agent](https://www.youtube.com/watch?v=ZWfZQa05C8s) - Community review
- [Gemini CLI is INSANE! Google's Free AI Agent BEATS Claude Code](https://www.youtube.com/watch?v=8JsLvU3EKWc) - Performance comparison
- [Google's Gemini CLI (Full Tutorial): This FULLY FREE AI Coder BEATS Claude Code](https://www.youtube.com/watch?v=qozh53lBlw4) - Comprehensive tutorial

### Blog Posts & Tutorials

#### Official Announcements
- [Gemini CLI: your open-source AI agent](https://blog.google/technology/developers/introducing-gemini-cli-open-source-ai-agent/) - Official Google launch blog
- [Getting Started with Gemini CLI ✨](https://medium.com/google-cloud/getting-started-with-gemini-cli-8cc4674a1371) - Official Google Cloud tutorial

#### Technical Deep Dives  
- [Google unveils Gemini CLI, an open-source AI tool for terminals](https://techcrunch.com/2025/06/25/google-unveils-gemini-cli-an-open-source-ai-tool-for-terminals/) - TechCrunch analysis
- [Gemini CLI brings Google's AI agent to your terminal for free](https://9to5google.com/2025/06/25/google-gemini-cli/) - 9to5Google coverage

#### Developer Guides
- [Getting Started with Gemini Pro 2.5: Build a Simple AI Agent](https://www.cohorte.co/blog/getting-started-with-gemini-pro-2-5-build-a-simple-ai-agent) - Practical implementation guide
- [Why EVERY Developer Needs to Know About Gemini 2.5 Pro](https://blog.stackademic.com/why-every-developer-needs-to-know-about-gemini-2-5-pro-8d3e45cfe962) - Feature overview and use cases
- [Build Anything with Gemini 2.5 Pro: A Developer's Deep Dive with Python Examples](https://medium.com/@mb20261/build-anything-with-gemini-2-5-pro-a-developers-deep-dive-with-python-examples-c38423416362) - Python integration examples

## Essential Commands

> Core commands to start using Gemini CLI effectively

#### Starting Gemini CLI
```bash
# Basic usage with prompt
gemini --prompt "your question here"

# Interactive mode (default)
gemini

# YOLO mode (auto-accept all actions)
gemini --yolo

# Use specific model (default: gemini-2.5-pro)
gemini --model gemini-2.5-pro

# Include ALL files in context
gemini --all_files

# Run in sandbox mode
gemini --sandbox

# Enable debug mode
gemini --debug

# Enable checkpointing of file edits
gemini --checkpointing

# Show memory usage in status bar
gemini --show_memory_usage

# Combine options
gemini --yolo --all_files --prompt "Review this codebase"

# Help and version
gemini --help
gemini --version
```

#### Interactive CLI Commands

Once inside Gemini CLI, you can use these special commands:

```bash
# Clear terminal screen and session history
/clear
# Keyboard shortcut: Ctrl+L

# Replace chat context with summary (saves tokens)
/compress

# Memory management commands
/memory show              # Display current GEMINI.md content
/memory add <text>        # Add text to AI's memory
/memory refresh           # Reload all GEMINI.md files

# Restore project files (requires --checkpointing)
/restore                  # List available checkpoints
/restore [tool_call_id]   # Restore to specific checkpoint
```

## Quick Start Workflows

> Common workflows to get productive immediately

### First-Time Setup
```bash
# 1. Install and verify
npm install -g @google/gemini-cli
gemini --version

# 2. Start with safety features
gemini --checkpointing --all_files

# 3. Inside CLI - set up memory
/memory add "This is my [project type] project"
/memory refresh
```

### Daily Development Workflow
```bash
# Safe coding session
gemini --checkpointing --all_files

# Inside CLI:
/clear                    # Start fresh
/memory refresh           # Load project context
# Work on your code...
/restore                  # If needed
```

### Quick Tasks
```bash
# Code review
gemini --yolo --all_files --prompt "Review recent changes"

# Bug fixing  
gemini --checkpointing --prompt "Help fix this error: [error]"

# Documentation
gemini --prompt "Generate README for this project"
```

## MCP Servers

> Model Context Protocol servers to extend Gemini CLI capabilities

### Official MCP Servers

#### Python Development
```markdown
# Python Development Context

## Code Standards
- Follow PEP 8 style guidelines
- Use type hints for all functions
- Include comprehensive docstrings
- Prefer pathlib over os.path

## Mandatory Tooling
When creating or modifying Python files, run:
```bash
# Format code
black .
# Sort imports
isort .
# Lint code
ruff check --fix .
```

## Testing
- Use pytest for all tests
- Aim for 90%+ test coverage
- Include both unit and integration tests
```

#### JavaScript/TypeScript Development
```markdown
# JavaScript/TypeScript Development Context

## Code Standards
- Use TypeScript for all new code
- Follow ESLint configuration
- Use Prettier for formatting
- Prefer async/await over promises

## Build Process
```bash
# Install dependencies
npm ci
# Run tests
npm test
# Build project
npm run build
```

## Framework Preferences
- React for UI components
- Express.js for backend APIs
- Jest for testing
```

#### Go Development
```markdown
# Go Development Context

## Code Standards
- Follow effective Go guidelines
- Use gofmt for formatting
- Include comprehensive error handling
- Write table-driven tests

## Tools and Commands
```bash
# Format code
go fmt ./...
# Run tests
go test ./...
# Build binary
go build -o app ./cmd/main.go
```
```

### Domain-Specific Templates

#### DevOps/Infrastructure
```markdown
# DevOps Infrastructure Context

## Preferred Technologies
- Docker for containerization
- Kubernetes for orchestration
- Terraform for infrastructure as code
- GitHub Actions for CI/CD

## Security Best Practices
- Never hardcode secrets
- Use least privilege principle
- Implement proper RBAC
- Regular security scans
```

#### Web Development
```markdown
# Web Development Context

## Frontend Standards
- Mobile-first responsive design
- Semantic HTML5 markup
- CSS Grid and Flexbox for layouts
- Progressive Web App principles

## Performance Requirements
- Lighthouse score > 90
- Core Web Vitals compliance
- Optimized images and assets
- Minimal JavaScript bundles
```

## MCP Servers

> Model Context Protocol servers to extend Gemini CLI capabilities

### Official MCP Servers

- [GitHub MCP Server](https://github.com/modelcontextprotocol/server-github) - GitHub integration
- [Filesystem MCP Server](https://github.com/modelcontextprotocol/server-filesystem) - File system operations
- [SQLite MCP Server](https://github.com/modelcontextprotocol/server-sqlite) - Database interactions
- [Web Search MCP Server](https://github.com/modelcontextprotocol/server-web-search) - Web search capabilities

### Configuration Examples

All MCP server configurations are available in the [`mcp-servers/`](mcp-servers/) directory.

#### Quick Setup
```bash
# Copy individual server config
cp mcp-servers/github.json ~/.gemini/settings.json

# Or copy comprehensive team config
cp mcp-servers/team-config.json ~/.gemini/settings.json
```

#### Available Configurations

| Configuration | Description | File |
|---------------|-------------|------|
| **GitHub Integration** | Repository management, issues, PRs | [`mcp-servers/github.json`](mcp-servers/github.json) |
| **SQLite Database** | Database operations and queries | [`mcp-servers/sqlite.json`](mcp-servers/sqlite.json) |
| **Sentry Monitoring** | Error tracking and performance | [`mcp-servers/sentry.json`](mcp-servers/sentry.json) |
| **Team Setup** | All servers combined | [`mcp-servers/team-config.json`](mcp-servers/team-config.json) |

For detailed setup instructions, see [`mcp-servers/README.md`](mcp-servers/README.md).

### Community MCP Servers

- [Docker MCP Server](https://github.com/community/mcp-docker) - Docker container management
- [AWS MCP Server](https://github.com/community/mcp-aws) - AWS service interactions
- [Jira MCP Server](https://github.com/community/mcp-jira) - Jira ticket management
- [Sentry MCP Server](https://mcp.sentry.dev/mcp) - Error tracking and performance monitoring

## Community Tools

> Third-party tools and alternatives for Gemini CLI

### Go-based Tools

#### [eliben/gemini-cli](https://github.com/eliben/gemini-cli)
- **Features**: Advanced embedding support, SQLite storage, token counting
- **Best for**: Data analysis, similarity search, embedding workflows
- **Installation**: `go install github.com/eliben/gemini-cli@latest`

#### [ghchinoy/gen](https://github.com/ghchinoy/gen)
- **Features**: Multi-model support (Gemini, PaLM, Claude), model comparison
- **Best for**: Cross-model development, Google Cloud integration
- **Installation**: `go install github.com/ghchinoy/gen@latest`

### Python-based Tools

#### [hitsmaxft/gemini-cli](https://github.com/hitsmaxft/gemini-cli)
- **Features**: TOML configuration, streaming responses, Nix packaging
- **Best for**: Python developers, custom configurations
- **Installation**: `pip install gemini-cli`

#### [GlobalCreativeApkDev/gemini-pro-cli](https://github.com/GlobalCreativeApkDev/gemini-pro-cli)
- **Features**: Interactive parameter configuration, simple CLI interface
- **Best for**: Beginners, basic usage scenarios
- **Installation**: `pip install gemini-pro-cli`

### JavaScript-based Tools

#### [hexxt-git/gemini-cli](https://github.com/hexxt-git/gemini-cli)
- **Features**: Lightweight Node.js implementation, minimal dependencies
- **Best for**: Simple integrations, custom JavaScript workflows
- **Installation**: Available as Node.js package

## GEMINI.md Templates

> Project-specific context files to enhance Gemini CLI's understanding

All templates are available in the [`templates/`](templates/) directory.

### Language-Specific Templates

#### Python Development
Use [`templates/python-GEMINI.md`](templates/python-GEMINI.md) for Python projects:
- PEP 8 style guidelines and type hints
- Testing with pytest and coverage requirements
- Black, isort, and ruff tooling integration
- Error handling and documentation patterns

#### JavaScript/TypeScript Development
```markdown
# JavaScript/TypeScript Development Context

## Code Standards
- Use TypeScript for all new code
- Follow ESLint configuration  
- Use Prettier for formatting
- Prefer async/await over promises

## Framework Preferences
- React for UI components
- Express.js for backend APIs
- Jest for testing
```

#### Go Development
```markdown  
# Go Development Context

## Code Standards
- Follow effective Go guidelines
- Use gofmt for formatting
- Include comprehensive error handling
- Write table-driven tests
```

### Domain-Specific Templates

#### DevOps/Infrastructure
```markdown
# DevOps Infrastructure Context

## Preferred Technologies
- Docker for containerization
- Kubernetes for orchestration
- Terraform for infrastructure as code
- GitHub Actions for CI/CD
```

### Generic Template
Use [`templates/GEMINI.md`](templates/GEMINI.md) as a starting point for any project type.

## Workflows & Use Cases

> Proven workflows and practical applications

### Development Workflows

#### Code Review Assistant
```bash
# Review changes with all files context
gemini --all_files --prompt "Review the git diff and provide feedback on code quality, potential issues, and improvements"

# Quick review with YOLO mode
gemini --yolo --prompt "Review this code and suggest improvements"

# Generate test cases for specific file
gemini --prompt "Generate comprehensive test cases for this function including edge cases"
```

#### Bug Investigation
```bash
# Debug with full context and checkpointing
gemini --all_files --checkpointing --prompt "I'm getting this error: [error message]. Help me debug and fix it."

# Quick debug in sandbox mode
gemini --sandbox --prompt "Debug this error: [error details]"

# Debug with memory monitoring
gemini --show_memory_usage --debug --prompt "Analyze this performance issue"

# Safe debugging workflow (inside CLI)
/memory add "Current bug: API timeout on user creation"
/memory refresh                     # Load project context
# Let AI make changes...
/restore                           # Undo if fixes break something
```

#### Documentation Generation
```bash
# API documentation
gemini --prompt "Generate API documentation for this endpoint including examples"

# README creation
gemini --prompt "Create a comprehensive README.md for this project based on the codebase"
```

### DevOps Workflows

#### Infrastructure as Code
```bash
# Terraform assistance
gemini --prompt "Review this Terraform configuration and suggest security improvements"

# Docker optimization
gemini --prompt "Optimize this Dockerfile for size and security"
```

#### Monitoring and Alerting
```bash
# Log analysis
gemini --prompt "Analyze these application logs and identify potential issues: $(tail -n 100 app.log)"

# Alert configuration
gemini --prompt "Create Prometheus alerting rules for this service"

# Sentry error analysis
gemini --prompt "Analyze recent Sentry errors and suggest fixes for the most critical issues"

# Performance monitoring
gemini --prompt "Review Sentry performance data and identify bottlenecks in our application"
```

### Content Creation

#### Technical Writing
```bash
# Blog post creation
gemini --prompt "Write a technical blog post about [topic] with code examples"

# Tutorial generation
gemini --prompt "Create a step-by-step tutorial for implementing [feature]"
```

## Configuration Examples

> Advanced configuration setups for different use cases

### Team Configuration

For a complete team setup with multiple MCP servers, use the pre-configured file:

```bash
# Copy the comprehensive team configuration
cp mcp-servers/team-config.json ~/.gemini/settings.json

# Set required environment variables
export GITHUB_PERSONAL_ACCESS_TOKEN="your_token"
export SEARCH_API_KEY="your_search_key"
```

This configuration includes:
- ✅ **GitHub** - Repository management
- ✅ **Sentry** - Error monitoring  
- ✅ **SQLite** - Database operations
- ✅ **Filesystem** - File management
- ✅ **Web Search** - Internet search capabilities

See [`mcp-servers/team-config.json`](mcp-servers/team-config.json) for the full configuration.

### Project-Specific Configuration

#### Frontend Project GEMINI.md
```markdown
# Frontend Development Context

## Technology Stack
- React 18 with TypeScript
- Tailwind CSS for styling
- Vite for build tooling
- Vitest for testing

## Code Standards
- Use functional components with hooks
- Implement proper TypeScript types
- Follow accessibility best practices (WCAG 2.1)
- Optimize for Core Web Vitals

## Development Commands
```bash
npm run dev      # Start development server
npm run build    # Build for production
npm run test     # Run test suite
npm run lint     # Lint code
```

## Component Structure
```
src/
  components/
    ui/           # Reusable UI components
    features/     # Feature-specific components
    layout/       # Layout components
```
```

## Scripts & Automation

> Useful scripts and automation examples

### Git Workflow Scripts

#### `git-ai-commit.sh`
```bash
#!/bin/bash
# Generate AI-powered commit messages

DIFF=$(git diff --cached)
if [ -z "$DIFF" ]; then
    echo "No staged changes found."
    exit 1
fi

COMMIT_MSG=$(echo "$DIFF" | gemini --prompt "Generate a conventional commit message for these changes.")
echo "Suggested: $COMMIT_MSG"
read -p "Use this message? (y/n): " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]; then
    git commit -m "$COMMIT_MSG"
fi
```

#### `code-review.sh`
```bash
#!/bin/bash
# AI code review for pull requests

BRANCH=${1:-main}
DIFF=$(git diff $BRANCH...HEAD)

gemini --prompt "
Please review this code diff and provide:
1. Code quality assessment
2. Potential bugs or issues
3. Security considerations
4. Performance improvements
5. Best practice recommendations

Diff:
$DIFF
"
```

### Development Helper Scripts

#### `explain-error.sh`
```bash
#!/bin/bash
# Explain error messages and suggest fixes

ERROR_LOG=${1:-"error.log"}

if [ ! -f "$ERROR_LOG" ]; then
    echo "Error log file not found: $ERROR_LOG"
    exit 1
fi

LAST_ERROR=$(tail -n 20 "$ERROR_LOG")

gemini --prompt "
Analyze this error log and provide:
1. Root cause analysis
2. Suggested fixes
3. Prevention strategies

Error log:
$LAST_ERROR
"
```

#### `generate-tests.sh`
```bash
#!/bin/bash
# Generate test cases for a given file

FILE_PATH=$1

if [ ! -f "$FILE_PATH" ]; then
    echo "File not found: $FILE_PATH"
    exit 1
fi

CODE=$(cat "$FILE_PATH")

gemini --prompt "
Generate comprehensive test cases for this code:

Code:
$CODE

Please include:
1. Unit tests for all functions
2. Edge cases and error scenarios
3. Integration test suggestions
4. Mocking strategies where appropriate
"
```

### CI/CD Integration

#### GitHub Actions Workflow
```yaml
name: AI Code Review
on:
  pull_request:
    types: [opened, synchronize]

jobs:
  ai-review:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
        with:
          fetch-depth: 0
          
      - name: Setup Node.js
        uses: actions/setup-node@v4
        with:
          node-version: '18'
          
      - name: Install Gemini CLI
        run: npm install -g @google/gemini-cli
        
      - name: AI Code Review
        env:
          GOOGLE_API_KEY: ${{ secrets.GOOGLE_API_KEY }}
        run: |
          DIFF=$(git diff origin/main...HEAD)
          gemini --prompt "Review this code diff and provide feedback: $DIFF" > review.md
          
      - name: Comment PR
        uses: actions/github-script@v7
        with:
          script: |
            const fs = require('fs');
            const review = fs.readFileSync('review.md', 'utf8');
            github.rest.issues.createComment({
              issue_number: context.issue.number,
              owner: context.repo.owner,
              repo: context.repo.repo,
              body: `## 🤖 AI Code Review\n\n${review}`
            });
```

## Advanced Tips & Tricks

> Best practices and advanced usage patterns

### Command Line Efficiency

#### Aliases and Functions
```bash
# Add to ~/.bashrc or ~/.zshrc
alias gai='gemini --prompt'
alias gy='gemini --yolo'

# Code review function
grev() {
    git diff "$1" | gemini --prompt "Review this code diff"
}

# Explain command
explain() {
    gemini --prompt "Explain this command and its options: $*"
}

# Debug function
debug() {
    gemini --prompt "Help me debug this error: $*"
}
```

#### Environment Setup
```bash
# Telemetry configuration
export GEMINI_TELEMETRY_OTLP_ENDPOINT="your-endpoint"

# Common aliases for efficiency
alias gai='gemini --prompt'
alias gy='gemini --yolo'
alias gall='gemini --all_files'
alias gdebug='gemini --debug'
alias gcp='gemini --checkpointing'

# Project-specific aliases
alias greview='gemini --yolo --all_files --prompt "Review this codebase for improvements"'
alias gfix='gemini --checkpointing --prompt "Help me fix this error:"'
alias gsafe='gemini --checkpointing --all_files'  # Safe mode with restore capability
```

#### Memory Management Workflow
```bash
# Start with checkpointing for safety
gemini --checkpointing

# Inside CLI:
/memory show                    # Check current context
/memory add "This is a React project using TypeScript"
/memory refresh                 # Reload GEMINI.md files

# Work safely with restore points
# Make changes...
/restore                        # If something goes wrong
```

#### Efficient Session Management
```bash
# Clear screen when context gets cluttered
/clear                          # or Ctrl+L

# Compress long conversations to save tokens
/compress

# Restart with fresh context but keep memory
/memory refresh
/clear
```

### Advanced Usage Patterns

#### Chaining Commands
```bash
# Multi-step workflow
gemini --prompt "Generate a README template" > README.md && \
gemini --prompt "Review and improve this README" < README.md > README_improved.md
```

#### Context Management
```bash
# Save context for reuse
echo "You are an expert DevOps engineer specializing in Kubernetes" > ~/.gemini_devops_context

# Use saved context
cat ~/.gemini_devops_context | gemini --prompt "Help me debug this Kubernetes deployment issue"
```

#### Batch Processing
```bash
# Process multiple files
for file in src/**/*.js; do
    gemini --prompt "Add JSDoc comments to this file: $(cat $file)" > "${file%.js}_documented.js"
done
```

### Integration with Other Tools

#### With tmux
```bash
# Create dedicated AI session
tmux new-session -d -s ai 'gemini'

# Send commands to AI session
tmux send-keys -t ai "explain the last command I ran" C-m
```

#### With fzf (fuzzy finder)
```bash
# Select and explain command from history
explain_history() {
    local cmd=$(history | fzf --tac | sed 's/^[ ]*[0-9]*[ ]*//')
    if [ -n "$cmd" ]; then
        gemini --prompt "Explain this command: $cmd"
    fi
}
```

## Community Resources

> Connect with other Gemini CLI users

### Official Channels
- [GitHub Discussions](https://github.com/google/generative-ai-tools/discussions) - Official community discussions
- [Stack Overflow](https://stackoverflow.com/questions/tagged/gemini-cli) - Q&A with `gemini-cli` tag

### Community Resources
- [Reddit r/GeminiCLI](https://reddit.com/r/GeminiCLI) - Community discussions and tips
- [Discord Server](https://discord.gg/gemini-cli) - Real-time chat and support
- [Awesome Gemini CLI Telegram](https://t.me/awesome_gemini_cli) - Updates and discussions

### Contribution Opportunities
- **Documentation**: Help improve guides and examples
- **MCP Servers**: Create new Model Context Protocol servers
- **Templates**: Share GEMINI.md templates for different use cases
- **Scripts**: Contribute useful automation scripts
- **Use Cases**: Document novel workflows and applications

## Contributing

We welcome contributions! Please see our [contributing guidelines](CONTRIBUTING.md) for details.

### How to Contribute

1. **Fork** this repository
2. **Create** a feature branch (`git checkout -b feature/amazing-resource`)
3. **Add** your resource with proper description and examples
4. **Commit** your changes (`git commit -m 'Add amazing resource'`)
5. **Push** to the branch (`git push origin feature/amazing-resource`)
6. **Create** a Pull Request

### Contribution Guidelines

- **Quality over quantity**: Focus on proven, valuable resources
- **Clear descriptions**: Explain what each resource does and why it's useful
- **Working examples**: Include code samples that actually work
- **Proper attribution**: Credit original authors and sources
- **Stay current**: Keep information up-to-date with latest Gemini CLI versions

### Content Standards

- Resources should be actively maintained
- Examples should be tested and functional
- Descriptions should be clear and concise
- Links should be working and relevant
- Follow the established format and structure

## License

[![CC0](https://mirrors.creativecommons.org/presskit/buttons/88x31/svg/cc-zero.svg)](https://creativecommons.org/publicdomain/zero/1.0/)

This work is licensed under [Creative Commons Zero v1.0 Universal](LICENSE).

---

**Disclaimer**: This is a community-maintained resource and is not officially affiliated with Google or the Gemini team. Always refer to the [official documentation](https://developers.google.com/gemini-code-assist/docs/gemini-cli) for the most current information.