# Swiftlings - Swift Port of Rustlings

This document describes the Swift 6.2 port of Rustlings.

## Overview

Swiftlings is a complete port of Rustlings to Swift 6.2, maintaining the same learning philosophy while teaching Swift concepts instead of Rust.

## Architecture

### Core Components

1. **main.swift** - Entry point with ArgumentParser for CLI
2. **AppState.swift** - Application state management and exercise tracking
3. **ExerciseInfo.swift** - Exercise metadata and info file parsing
4. **ExerciseRunner.swift** - Swift compiler integration and exercise execution
5. **InitManager.swift** - Project initialization logic
6. **SwiftlingsError.swift** - Error types

### Key Differences from Rustlings

| Rustlings (Rust) | Swiftlings (Swift) |
|------------------|-------------------|
| Cargo | Swift Package Manager |
| .rs files | .swift files |
| Clippy | Swift warnings/errors |
| info.toml (TOML) | info.yaml (YAML) |
| State in Rust struct | JSON state file |
| rustc compiler | swiftc compiler |

## Exercise Structure

Each exercise consists of:
- A Swift source file with TODO comments
- Metadata in info.yaml
- A corresponding solution file
- Hints for when users get stuck

### Example Exercise

```swift
// exercises/01_variables/variables1.swift
// TODO: Add the missing keyword before 'x'.
x = 5
print("x has the value \(x)")
```

### Exercise Metadata (info.yaml)

```yaml
- name: variables1
  dir: 01_variables
  test: false
  strict_warnings: false
  hint: |
    The declaration is missing a keyword that is needed
    in Swift to create a new variable binding.
```

## Commands

All Rustlings commands have been ported:

- `swiftlings init` - Initialize the project
- `swiftlings run [name]` - Run an exercise
- `swiftlings watch` - Watch mode (basic implementation)
- `swiftlings list` - List all exercises
- `swiftlings reset <name>` - Reset an exercise
- `swiftlings hint [name]` - Show a hint

## Building

```bash
swift build
```

## Testing

```bash
swift test
```

## Running

```bash
swift run swiftlings --help
# or after building:
.build/debug/swiftlings --help
```

## Exercise Topics Covered

The initial port includes exercises for:

1. **Introduction** - Getting started with Swift
2. **Variables** - let vs var, mutability
3. **Functions** - Defining and calling functions
4. **Optionals** - Swift's optional type system (planned)
5. **Control Flow** - if, guard, switch (planned)
6. **Collections** - Arrays, Sets, Dictionaries (planned)
7. **Structs** - Value types (planned)
8. **Classes** - Reference types (planned)
9. **Enums** - Enumerations and pattern matching (planned)
10. **Protocols** - Protocol-oriented programming (planned)
11. **Generics** - Generic types and functions (planned)
12. **Error Handling** - Swift error handling (planned)
13. **Closures** - Anonymous functions (planned)

## Swift 6.2 Specific Features

The port is designed to teach Swift 6.2, including:
- Modern syntax
- Swift concurrency (async/await, actors) - to be added
- Value types and reference semantics
- Protocol-oriented programming
- Optionals and safety features

## State Management

Exercise progress is tracked in `.swiftlings-state.json`:

```json
{
  "formatVersion": 1,
  "exercises": {
    "intro1": {
      "done": true,
      "lastAttempt": "2025-10-02T21:35:00Z"
    },
    "variables1": {
      "done": false,
      "lastAttempt": "2025-10-02T21:36:00Z"
    }
  }
}
```

## Dependencies

- **swift-argument-parser** - CLI argument parsing
- **Yams** - YAML parsing for info.yaml

## Future Enhancements

- [ ] File system watching for automatic re-runs
- [ ] More comprehensive exercises covering all Swift topics
- [ ] Interactive REPL integration
- [ ] Swift Package Manager integration for exercises
- [ ] XCTest integration for test-based exercises
- [ ] Better error messages and formatting
- [ ] Progress visualization
- [ ] Export/import of progress

## Contributing

To add new exercises:

1. Add the exercise metadata to `InitManager.swift` in the `createInfoFile()` function
2. Add the exercise file creation in `createSampleExercises()`
3. Add the corresponding solution file
4. Test the exercise with `swiftlings run <exercise_name>`

## Compatibility

- **Swift Version**: 6.2
- **Platforms**: macOS 13+, Linux (with Swift 6.2)
- **Architecture**: x86_64, ARM64

## License

Same as Rustlings: MIT License
