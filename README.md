# Automated Workflows for Cursor AI Editor

Features **spec-driven agentic development** (`Requirements` → `Design` → `Tasks` → `Implementation`) for Cursor. Implements a systematic development methodology as an alternative to "Vibe Coding", ensuring consistently well-documented, maintainable, and production-ready outputs.

This approach is based on [Claude Code Spec Workflow](https://github.com/Pimzino/claude-code-spec-workflow), but adapted for Cursor IDE. This follows an [idiomatic principles](https://kiro.dev/docs/specs/concepts/) of AWS Kiro. I may tweak the prompts and templates from time to time to better suit my personal needs.

## 🛠️ Installation

```sh
curl -sSL https://raw.githubusercontent.com/nicksp/cursor-spec-workflow/main/setup.sh | bash
```

## 🔄 Workflow Overview

### 📊 Spec driven development workflow

#### Steering setup (/spec-steering-setup)

> [!NOTE]  
> Only do this step if you're working on an existing project. If you're starting brand new, start with `/spec-create` step instead.

- Creates persistent project context documents
- Analyzes your codebase and gathers project information
- Generates `product.md`, `tech.md`, and `structure.md`
- Ensures all specs align with your project's vision and standards

#### Complete workflow (/spec-create)

The `/spec-create` command handles the entire spec workflow in one seamless process:

1. **Requirements phase**
    - Generates user stories and acceptance criteria
    - Uses EARS format (WHEN/IF/THEN statements)
    - Aligns with product vision from steering documents
    - Automatically validated before user review

2. **Design phase**
    - Creates technical architecture and design
    - Follows technical standards from steering documents
    - Includes Mermaid diagrams for visualization
    - Validates against requirements coverage

3. **Tasks phase**
    - Breaks design into atomic coding tasks
    - Ensures all requirements and design components are covered
    - References specific requirements for traceability
    - Validates task atomicity for agent execution

#### Implementation phase (/spec-execute)

- Executes tasks systematically
- Follows all steering document guidelines
- Validates against requirements
- Ensures quality and consistency

## 🛠️ Usage

Use these commands in Cursor:

### 📊 Spec workflow commands (for existing features)

TODO

### 📊 Spec workflow commands (for new features)

```
# Set up steering documents (recommended first step!)
/spec-steering-setup

# Create a new feature spec (handles complete workflow)
/spec-create user-authentication "Secure login system"

# Execute specific tasks:
/spec-execute 1

# Check status
/spec-status

# List all specs
/spec-list
```

## 🤝 Contributing

Got ideas to improve commands / templates or have new ones that fit this workflow? Contributions are welcome!

Please feel free to:

- Open an issue to discuss changes or suggest new features.
- Submit a pull request with your enhancements.

## 🍁 Other Approaches

- [Claude Code Spec Workflow](https://github.com/Pimzino/claude-code-spec-workflow)
- [Custom Prompts for AI Coding Agents](https://github.com/nicksp/ai-coding-worflow)
- [Two-step approach to AI coding](https://github.com/sapegin/two-step-ai-coding-modes)
- [🚀 AI Dev Tasks 🤖](https://github.com/snarktank/ai-dev-tasks)
- [Agent OS](https://github.com/buildermethods/agent-os)
- [Prompts for plan & execute workflow in Cursor](https://github.com/carlrannaberg/ai-coding)

## 👤 Author and License

[Nick Plekhanov](https://nikkhan.com/), a full stack engineer.

[CC0 1.0 Universal license](LICENSE).

---

🤖 Happy AI-assisted developing!
