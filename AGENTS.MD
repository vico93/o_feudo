# AGENTS.md — O Feudo (Open.MP Server)

## Project Overview

**O Feudo** is a fun/4fun server for **Open Multiplayer (Open.MP / OMP)** — the modern successor to SA:MP. It consists of:

- A **Gamemode** (`of_main.pwn` and related files): the core server script that handles the main game loop, player management, and global systems.
- **Filterscripts**: modular scripts that add specific features without cluttering the gamemode (e.g., minigames, events, utility systems).

The project uses **PAWN** as its scripting language, compiled with the **OMP standard library**. For reference on modern OMP APIs and includes, see:

- [Open.MP Documentation](https://open.mp/docs)
- [OMP Standard Library Repository](https://github.com/openmultiplayer/omp-stdlib/)

This project avoids package managers like `sampctl`; plugins are installed manually when required.

---

## Documentation Lookup

When you need to verify Open.MP APIs, callbacks, or best practices, use the **Context7** documentation tools before guessing or relying on memory.

### Available Context7 Libraries

| Library ID | Description | Use For |
|------------|-------------|---------|
| `/openmultiplayer/open.mp` | Main Open.MP project documentation | Core APIs, callbacks, and general reference |
| `/websites/open_mp` | Open.MP website documentation (extensive) | Detailed examples, scripting guides, and callback references |

### How to Use

1. **Resolve the library ID first** using `context7_resolve-library-id` if unsure which ID to use.
2. **Query the documentation** using `context7_query-docs` with a specific question (e.g., *"How does OnPlayerConnect work?"*, *"What are the parameters for CreateVehicle?"*).
3. **Prefer official docs over assumptions** — always verify callback signatures, return values, and behavior before implementing.

> **Note**: Do not query Context7 more than 3 times per question. If the answer is unclear after 3 attempts, fall back to the [Open.MP Documentation](https://open.mp/docs) or the [OMP Standard Library Repository](https://github.com/openmultiplayer/omp-stdlib/).

---

## Code Structure

All `.pwn` files must be divided into major sections, preceded by uppercase comment banners in this format:

```pawn
/* ------------------------------- SECTION NAME ------------------------------- */
```

### Standard Sections

Every script (gamemode or filterscript) should include these sections in order:

| Section | Description |
|---------|-------------|
| **LIBRARIES** | `#include` directives for plugins, standard libraries, and project includes |
| **DEFINITIONS** | `#define` macros, constants, and configuration values |
| **GLOBAL VARIABLES** | Script-wide variables, arrays, and enums |
| **MAIN METHOD** | `main()` function — **gamemode only** |
| **EVENTS** | Callbacks (`OnPlayerConnect`, `OnGameModeInit`, etc.) |
| **COMMANDS** | Player commands using the [Pawn.CMD](https://github.com/katursis/Pawn.CMD) plugin (`cmd:<name>` or `dcmd_*`) |
| **AUXILIARY FUNCTIONS** | Helper functions and internal logic (more common in libraries/includes) |

---

## File Headers

Every file must begin with a **Doxygen-style documentation block in Portuguese (pt-BR)**:

```pawn
/**
 * @file of_main.pwn
 * @brief Main gamemode for "O Feudo".
 *
 * Detailed explanation of the file's purpose and scope.
 *
 * @author Vico
 * @co-author ChatGPT, RooCode, Kimi, etc.
 * @date 2025-07-01
 */
```

> **Note on `@co-author`**: Do not remove existing agent names. If yours is missing (e.g., `Kimi`), append it.
> **Note on `@date`**: Update the date whenever you modify the file and notice it is outdated.

---

## Function & Event Comments

Before every significant callback or function, include a block comment describing its purpose. Use the `//` style for Pawn:

```pawn
//
// Triggered when a player connects to the server
//
public OnPlayerConnect(playerid)
{
    // Notifies other players in chat about the new connection
    return 1;
}
```

### Rules

- **Standard OMP callbacks** must always explain the situation that triggers them.
- **Quick explanations** should use single-line comments (`//`).
- Keep comments clear and concise — no unnecessary verbosity.
- **All comments must be in Portuguese (pt-BR).**
- **All identifiers** (functions, variables, constants) must be in **English** for harmony with the codebase.

---

## Writing Style

| Rule | Description |
|------|-------------|
| **Language** | Portuguese (pt-BR) for comments and documentation; English for all code identifiers |
| **Comments** | Clear, objective, no excessive text |
| **Events** | Standard OMP callbacks must explain their trigger condition |
| **Naming** | Use English for variables, functions, constants, and file names |

---

## Conventions

### General Rules

1. **No `sampctl`**: Prefer manual plugin installation when dependencies are needed.
2. **Console Logging**: Use `print` for static messages; use `printf` when referencing variables. Always include the gamemode name when relevant.
3. **Chat Messages**: Use `SendClientMessage` or dedicated helper functions for player-facing text.
4. **Const Correctness**: Follow the [Pawn Const Correctness](https://github.com/pawn-lang/compiler/wiki/Const-Correctness) guidelines to avoid unnecessary compiler warnings.
5. **Pawn.CMD Commands**: Commands must be documented with a header comment and implemented via `cmd:<name>` or `dcmd_*`, per the Pawn.CMD convention.

### Command Example

```pawn
//
// Help command — shows available commands to the player
//
dcmd_help(playerid, params[])
{
    #pragma unused params
    // Implementation here
    return 1;
}
```

### Compilation

| Command | Purpose |
|---------|---------|
| `.\build_single.bat <filename.pwn>` | Compile a single `.pwn` file |
| `.\build.bat` | Compile **all** scripts (gamemode + all filterscripts) — no arguments needed |

---

## Agent Workflow & Vibe Check

When working on this codebase, treat `vibe_check` as a **collaborative debugging checkpoint** that interrupts pattern inertia and prevents over-engineering. This is especially important in Pawn/OMP development, where subtle logic errors in callbacks or state management can cascade into hard-to-debug runtime issues.

### How to Use Vibe Check

1. **Treat `vibe_check` as a mandatory reflection step** — not an optional tool call. Use it to interrupt pattern inertia before committing to irreversible changes.
2. **Always include the complete user prompt** with every `vibe_check` call, along with your current plan and phase.
3. **Specify your current phase** clearly: `planning`, `implementation`, or `review`.
4. **Consider `vibe_check` feedback as a high-priority pattern interrupt** — not just another tool output. If it flags over-engineering, misalignment, or risky assumptions, pause and reassess.
5. **Build the feedback loop with `vibe_learn`** — when a mistake is identified (e.g., a wrong callback signature, a missing `return 1`, or an anti-pattern in Pawn), record it to prevent recurrence in future sessions.

### When to Call Vibe Check

Call `vibe_check` **before** the following high-risk actions:

- Implementing or modifying core OMP callbacks (`OnPlayerConnect`, `OnPlayerDeath`, `OnVehicleSpawn`, etc.)
- Adding new `#include` dependencies or plugin integrations
- Refactoring global systems (player data, vehicle management, admin systems)
- Changing compilation settings or `build.bat` / `build_single.bat` logic
- After identifying a bug in game mode logic, before proposing the fix

### Session Constitution (Optional)

You may use `update_constitution` to set per-session rules for this project. Example rules:

- "Never modify `of_main.pwn` without checking dependent filterscripts first"
- "Prefer `static` functions over global exposure in filterscripts"
- "Always test compilation with `build_single.bat` before claiming a file is ready"

---

## Quick Reference

| Task | Guideline |
|------|-----------|
| New file | Add Doxygen header in Portuguese, English identifiers |
| New section | Use `/* ------------------------------- NAME ------------------------------- */` |
| New callback | Document trigger condition in Portuguese |
| New command | Use Pawn.CMD (`cmd:<name>`), add header comment |
| Console output | Use `print`/`printf`, mention gamemode name |
| Player chat | Use `SendClientMessage` or helpers |
| Variable declaration | Apply const correctness |
| Before major change | Call `vibe_check` with full context and phase |
| After bug fix | Call `vibe_learn` to record the pattern |
| Compile single file | `.\build_single.bat <file.pwn>` |
| Compile all | `.\build.bat` |
