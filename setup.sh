#!/bin/bash

# Spec Workflow Cursor Setup Script
# This script installs workflow commands and templates for Cursor in the current project

set -e  # Exit on error

echo "🚀 Spec Workflow Cursor Setup"
echo "============================="
echo ""


# Create directory structure
echo "📁 Creating required structure in .cursor directory..."
mkdir -p .cursor/{commands,templates/{spec,steering}}

# Base URL for raw GitHub content
BASE_URL="https://raw.githubusercontent.com/nicksp/cursor-spec-workflow/main"

# Download commands
echo ""
echo "📥 Downloading and setting up Cursor command files..."

COMMANDS_URL="$BASE_URL/commands"

curl -sSL "$COMMANDS_URL/spec-create.md" -o .cursor/commands/spec-create.md
curl -sSL "$COMMANDS_URL/spec-execute.md" -o .cursor/commands/spec-execute.md
curl -sSL "$COMMANDS_URL/spec-list.md" -o .cursor/commands/spec-list.md
curl -sSL "$COMMANDS_URL/spec-status.md" -o .cursor/commands/spec-status.md
curl -sSL "$COMMANDS_URL/spec-steering-setup.md" -o .cursor/commands/spec-steering-setup.md

# Download templates
echo ""
echo "📥 Downloading and setting up Cursor command templates..."

TEMPLATES_URL="$BASE_URL/templates"

# Spec templates
curl -sSL "$TEMPLATES_URL/spec/design-template.md" -o .cursor/templates/spec/design-template.md
curl -sSL "$TEMPLATES_URL/spec/requirements-template.md" -o .cursor/templates/spec/requirements-template.md
curl -sSL "$TEMPLATES_URL/spec/tasks-template.md" -o .cursor/templates/spec/tasks-template.md

# Steering templates
curl -sSL "$TEMPLATES_URL/steering/product-template.md" -o .cursor/templates/steering/product-template.md
curl -sSL "$TEMPLATES_URL/steering/structure-template.md" -o .cursor/templates/steering/structure-template.md
curl -sSL "$TEMPLATES_URL/steering/tech-template.md" -o .cursor/templates/steering/tech-template.md

echo ""
echo "✅ Setup complete! Commands and templates copied to .cursor/"
echo ""
echo "Next steps:"
echo ""
echo "Use these commands in Cursor:"
echo "  /spec-steering-setup                      - Set up steering documents in an existing product's codebase"
echo "  /spec-create <feature-name> [description] - Initiate a new feature spec"
echo "  /spec-execute [task-id] [feature-name]    - Execute specific task"
echo "  /spec-status                              - Check product status"
echo "  /spec-list                                - List all product specs"
echo ""
