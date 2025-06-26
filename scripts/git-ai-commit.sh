#!/bin/bash

# git-ai-commit.sh
# Generate AI-powered commit messages using Gemini CLI
# Usage: ./git-ai-commit.sh [--push] [--yolo]

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Configuration
MAX_DIFF_SIZE=5000  # Max diff size to send to AI (characters)
PUSH_AFTER_COMMIT=false
YOLO_MODE=false

# Parse command line arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        --push)
            PUSH_AFTER_COMMIT=true
            shift
            ;;
        --yolo)
            YOLO_MODE=true
            shift
            ;;
        -h|--help)
            echo "Usage: $0 [--push] [--yolo]"
            echo "  --push: Push to remote after successful commit"
            echo "  --yolo: Auto-accept AI suggestion without confirmation"
            exit 0
            ;;
        *)
            echo "Unknown option: $1"
            exit 1
            ;;
    esac
done

# Function to print colored output
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if we're in a git repository
if ! git rev-parse --git-dir > /dev/null 2>&1; then
    print_error "Not in a git repository!"
    exit 1
fi

# Check if gemini CLI is available
if ! command -v gemini &> /dev/null; then
    print_error "Gemini CLI not found! Please install it first:"
    echo "  npm install -g @google/gemini-cli"
    exit 1
fi

# Check if there are staged changes
STAGED_CHANGES=$(git diff --cached --name-only)
if [ -z "$STAGED_CHANGES" ]; then
    print_warning "No staged changes found."
    echo "Stage your changes first with 'git add <files>'"
    exit 1
fi

print_status "Found staged changes in:"
echo "$STAGED_CHANGES" | sed 's/^/  - /'

# Get the diff of staged changes
DIFF=$(git diff --cached)
DIFF_SIZE=${#DIFF}

if [ $DIFF_SIZE -gt $MAX_DIFF_SIZE ]; then
    print_warning "Diff is large ($DIFF_SIZE chars). Using summary instead of full diff."
    # Generate a summary of changes
    DIFF_SUMMARY=$(git diff --cached --stat)
    MODIFIED_FILES=$(echo "$STAGED_CHANGES" | head -10)
    
    PROMPT="Generate a conventional commit message for these changes:

File changes summary:
$DIFF_SUMMARY

Modified files:
$MODIFIED_FILES

Guidelines:
- Use conventional commit format (type(scope): description)
- Keep description under 50 characters
- Types: feat, fix, docs, style, refactor, test, chore
- Be specific and descriptive
- No period at the end"
else
    PROMPT="Generate a conventional commit message for these changes:

$DIFF

Guidelines:
- Use conventional commit format (type(scope): description)
- Keep description under 50 characters  
- Types: feat, fix, docs, style, refactor, test, chore
- Be specific and descriptive
- No period at the end"
fi

print_status "Generating commit message with AI..."

# Generate commit message using Gemini CLI
COMMIT_MSG=$(echo "$PROMPT" | gemini --prompt -)

# Check if commit message was generated successfully
if [ -z "$COMMIT_MSG" ]; then
    print_error "Failed to generate commit message!"
    exit 1
fi

# Clean up the commit message (remove quotes and extra whitespace)
COMMIT_MSG=$(echo "$COMMIT_MSG" | sed 's/^["'\'']//' | sed 's/["'\'']$//' | xargs)

print_success "Generated commit message:"
echo -e "${GREEN}$COMMIT_MSG${NC}"

# Ask for confirmation unless in YOLO mode
if [ "$YOLO_MODE" = false ]; then
    echo
    read -p "Use this commit message? (y/n/e): " -n 1 -r
    echo
    
    case $REPLY in
        [Yy])
            # Proceed with commit
            ;;
        [Ee])
            # Edit the commit message
            echo "Current message: $COMMIT_MSG"
            read -p "Enter new commit message: " NEW_MSG
            if [ -n "$NEW_MSG" ]; then
                COMMIT_MSG="$NEW_MSG"
            else
                print_warning "No message entered. Using original."
            fi
            ;;
        *)
            print_warning "Commit cancelled."
            exit 0
            ;;
    esac
fi

# Perform the commit
print_status "Committing changes..."
if git commit -m "$COMMIT_MSG"; then
    print_success "Successfully committed with message: $COMMIT_MSG"
    
    # Show the commit
    echo
    git --no-pager log -1 --oneline
    
    # Push if requested
    if [ "$PUSH_AFTER_COMMIT" = true ]; then
        print_status "Pushing to remote..."
        CURRENT_BRANCH=$(git branch --show-current)
        if git push origin "$CURRENT_BRANCH"; then
            print_success "Successfully pushed to origin/$CURRENT_BRANCH"
        else
            print_error "Failed to push to remote"
            exit 1
        fi
    fi
else
    print_error "Commit failed!"
    exit 1
fi

# Show repository status
echo
print_status "Repository status:"
git status --short 