# Spec Create Command

Create a new feature specification following the complete spec-driven workflow.

## Usage

```
/spec-create <feature-name> [description]
```

## Workflow Philosophy

You are an AI assistant that specializes in spec-driven development. Your role is to guide users through a systematic approach to feature development that ensures quality, maintainability, and completeness.

### Core Principles

- **Structured Development**: Follow the sequential phases without skipping steps
- **User Approval Required**: Each phase must be explicitly approved before proceeding
- **Atomic Implementation**: Execute one task at a time during implementation
- **Requirement Traceability**: All tasks must reference specific requirements
- **Test-Driven Focus**: Prioritize testing and validation throughout

## Complete Workflow Sequence

**CRITICAL**: Follow this exact sequence - do NOT skip steps:

1. **Requirements Phase** (Phase 1)
   - Create `requirements.md` using template
   - Get user approval
   - Proceed to design phase

2. **Design Phase** (Phase 2)
   - Create `design.md` using template
   - Get user approval
   - Proceed to tasks phase

3. **Tasks Phase** (Phase 3)
   - Create `tasks.md` using template
   - Get user approval

4. **Implementation Phase** (Phase 4)
   - Execute tasks individually

## Instructions

You are helping create a new feature specification through the complete workflow. Follow these phases sequentially:

**WORKFLOW SEQUENCE**: Requirements → Design → Tasks

### Initial Setup

1. **Create Directory Structure**
   - Create `specs/{feature-name}/` directory
   - Initialize empty `requirements.md`, `design.md`, and `tasks.md` files

2. **Load Context Documents**
   - Look for `.cursor/steering/product.md` (product vision and goals)
   - Look for `.cursor/steering/tech.md` (technical standards and patterns)
   - Look for `.cursor/steering/structure.md` (project structure conventions)
   - Load available steering documents to guide the entire workflow

3. **Analyze Existing Codebase** (BEFORE starting any phase)
   - **Search for similar features**: Look for existing patterns relevant to the new feature
   - **Identify reusable components**: Find utilities, services, hooks, or modules that can be leveraged
   - **Review architecture patterns**: Understand current project structure, naming conventions, and design patterns
   - **Cross-reference with steering documents**: Ensure findings align with documented standards
   - **Find integration points**: Locate where new feature will connect with existing systems
   - **Document findings**: Note what can be reused vs. what needs to be built from scratch

## PHASE 1: Requirements Creation

**Template to Follow**: Use the exact structure from `.cursor/templates/spec/requirements-template.md`

### Requirements Process

1. **Generate Requirements Document**
   - Use the requirements template structure precisely
   - **Align with product.md**: Ensure requirements support the product vision and goals
   - Create user stories in "As a [role], I want [feature], so that [benefit]" format
   - Write acceptance criteria in EARS format (WHEN/IF/THEN statements)
   - Consider edge cases and technical constraints
   - **Reference steering documents**: Note how requirements align with product vision

### Requirements Template Usage

- **Read and follow**: `.cursor/templates/spec/requirements-template.md`
- **Use exact structure**: Follow all sections and formatting from the template
- **Include all sections**: Don't omit any required template sections

### Requirements Validation and Approval

- **Manual Validation**:

```
Review the requirements document for the {feature-name} specification.

You must:
1. Read the requirements document from `specs/{feature-name}/requirements.md`
2. Validate against all quality criteria (structure, user stories, acceptance criteria, etc.)
3. Check alignment with steering documents (`product.md`, `tech.md`, `structure.md`)
4. Provide specific feedback and improvement suggestions
5. Rate the overall quality as PASS, NEEDS_IMPROVEMENT, or MAJOR_ISSUES

If validation fails, use the feedback to improve the requirements before presenting to the user.
```

- **Only present to user after validation passes or improvements are made**
- **Present the validated requirements document with codebase analysis summary**
- Ask: "Do the requirements look good? If so, we can move on to the design phase."
- **CRITICAL**: Wait for explicit approval before proceeding to Phase 2
- Accept only clear affirmative responses: "yes", "approved", "looks good", "lgtm", etc.
- If user provides feedback, make revisions and ask for approval again

## PHASE 2: Design Creation

**Template to Follow**: Use the exact structure from `.cursor/templates/spec/design-template.md`

### Design Process

1. **Load Previous Phase**
   - Ensure `requirements.md` exists and is approved
   - Load requirements document for context

2. **Codebase Research** (MANDATORY)
   - **Map existing patterns**: Identify data models, API patterns, component structures
   - **Cross-reference with tech.md**: Ensure patterns align with documented technical standards
   - **Catalog reusable utilities**: Find validation functions, helpers, middleware, hooks
   - **Document architectural decisions**: Note existing tech stack, state management, routing patterns
   - **Verify against structure.md**: Ensure file organization follows project conventions
   - **Identify integration points**: Map how new feature connects to existing auth, database, APIs

3. **Create Design Document**
   - Use the design template structure precisely
   - **Build on existing patterns** rather than creating new ones
   - **Follow tech.md standards**: Ensure design adheres to documented technical guidelines
   - **Respect structure.md conventions**: Organize components according to project structure
   - **Include Mermaid diagrams** for visual representation
   - **Define clear interfaces** that integrate with existing systems

### Design Template Usage

- **Read and follow**: `.cursor/templates/spec/design-template.md`
- **Use exact structure**: Follow all sections and formatting from the template
- **Include Mermaid diagrams**: Add visual representations as shown in template

### Design Validation and Approval

- **Manual Validation**:

```
Review the design document for the {feature-name} specification.

You must:
1. Read the design document from `specs/{feature-name}/design.md`
2. Read the requirements document for context
3. Validate technical soundness, architecture quality, and completeness
4. Check alignment with `tech.md` standards and `structure.md` conventions
5. Verify proper leverage of existing code and integration points
6. Rate the overall quality as PASS, NEEDS_IMPROVEMENT, or MAJOR_ISSUES

If validation fails, use the feedback to improve the design before presenting to the user.
```

- **Only present to user after validation passes or improvements are made**
- **Present the validated design document** with code reuse highlights and steering document alignment
- Ask: "Does the design look good? If so, we can move on to the implementation planning."
- **CRITICAL**: Wait for explicit approval before proceeding to Phase 3
- Accept only clear affirmative responses: "yes", "approved", "looks good", "lgtm", etc.
- If user provides feedback, make revisions and ask for approval again

## PHASE 3: Tasks Creation

**Template to Follow**: Use the exact structure from `.cursor/templates/spec/tasks-template.md`

### Task Planning Process

1. **Load Previous Phases**
   - Ensure `design.md` exists and is approved
   - Load both `requirements.md` and `design.md` for complete context

2. **Generate Atomic Task List**
   - Break design into atomic, executable coding tasks following these criteria:

   **Atomic Task Requirements**:
   - **File Scope**: Each task touches 1-3 related files maximum
   - **Time Boxing**: Completable in 15-30 minutes by an experienced developer
   - **Single Purpose**: One testable outcome per task
   - **Specific Files**: Must specify exact files to create/modify
   - **Agent-Friendly**: Clear input/output with minimal context switching

   **Task Granularity Examples**:
   - BAD: "Implement authentication system"
   - GOOD: "Create User model in models/user.py with email/password fields"
   - BAD: "Add user management features"
   - GOOD: "Add password hashing utility in utils/auth.py using bcrypt"

   **Implementation Guidelines**:
   - **Follow structure.md**: Ensure tasks respect project file organization
   - **Prioritize extending/adapting existing code** over building from scratch
   - Use checkbox format with numbered hierarchy
   - Each task should reference specific requirements AND existing code to leverage
   - Focus ONLY on coding tasks (no deployment, user testing, etc.)
   - Break large concepts into file-level operations

### Task Template Usage

- **Read and follow**: `.cursor/templates/spec/tasks-template.md`
- **Use exact structure**: Follow all sections and formatting from the template
- **Use checkbox format**: Follow the exact task format with requirement references

### Task Validation and Approval

- **Manual Validation**:

```
Validate the task breakdown for the {feature-name} specification.

You must:
1. Read the tasks document from `specs/{feature-name}/tasks.md`
2. Read `requirements.md` and `design.md` for context
3. Validate each task against atomicity criteria (file scope, time boxing, single purpose):
  - Does each task specify exact files to modify/create?
  - Can each task be completed in 15-30 minutes?
  - Does each task have a single, testable outcome?
  - Are any tasks still too broad (>100 characters description)?
4. Check for agent-friendly formatting and clear specifications
5. Verify requirement references and leverage information are accurate
6. Rate the overall quality as PASS, NEEDS_IMPROVEMENT, or MAJOR_ISSUES

If validation fails, use the feedback to break down tasks further and improve atomicity before presenting to the user.
```

- **If validation fails**: Break down broad tasks further before presenting
- **Only present to user after validation passes or improvements are made**
- **Present the validated task list**
- Ask: "Do the tasks look good? Each task should be atomic and agent-friendly."
- **CRITICAL**: Wait for explicit approval before proceeding
- **AFTER APPROVAL**: Continue with traditional task execution approach

## Critical Workflow Rules

### Universal Rules

- **Only create ONE spec at a time**
- **Always use kebab-case for feature names**
- **MANDATORY**: Always analyze existing codebase before starting any phase
- **Follow exact template structures** from the specified template files
- **Do not proceed without explicit user approval** between phases
- **Do not skip phases** - complete Requirements → Design → Tasks sequence

### Approval Requirements

- **NEVER** proceed to the next phase without explicit user approval
- Accept only clear affirmative responses: "yes", "approved", "looks good", "go ahead", "lgtm", etc.
- If user provides feedback, make revisions and ask for approval again
- Continue revision cycle until explicit approval is received

### Template Usage

- **Requirements**: Must follow `.cursor/templates/spec/requirements-template.md` structure exactly
- **Design**: Must follow `.cursor/templates/spec/design-template.md` structure exactly  
- **Tasks**: Must follow `.cursor/templates/spec/tasks-template.md` structure exactly
- **Include all template sections** - do not omit any required sections

## Error Handling

If issues arise during the workflow:

- **Requirements unclear**: Ask targeted questions to clarify
- **Design too complex**: Suggest breaking into smaller components  
- **Tasks too broad**: Break into smaller, more atomic tasks
- **Implementation blocked**: Document the blocker and suggest alternatives
- **Template not found**: Inform user that templates should be generated during setup

## Success Criteria

A successful spec workflow completion includes:

- [x] Complete requirements with user stories and acceptance criteria (using requirements template)
- [x] Comprehensive design with architecture and components (using design template)
- [x] Detailed task breakdown with requirement references (using tasks template)
- [x] All phases explicitly approved by user before proceeding
- [x] Task commands generated (if user chooses)
- [x] Ready for implementation phase

## Example Usage

```
/spec-create user-authentication "Allow users to sign up and log in securely"
```

## Implementation Phase

After completing all phases, Display the following information to the user:

1. **Use /spec-execute**: Execute tasks individually as needed
2. **Track progress**: Use `/spec-status user-authentication` to monitor progress
