# Swiftlings Demonstration

This document shows a complete walkthrough of the Swiftlings Swift 6.2 port.

## Complete Workflow Example

### 1. Initialize Swiftlings

```bash
$ swiftlings init

       Welcome to...
                 _  __ _   _ _
  _____      __ (_)/ _| |_| (_)_ __   __ _ ___
 / __\ \ /\ / / | | |_| __| | | '_ \ / _` / __|
 \__ \\ V  V /  | |  _| |_| | | | | | (_| \__ \
 |___/ \_/\_/   |_|_|  \__|_|_|_| |_|\__, |___/
                                     |___/

✓ Swiftlings initialized successfully!

Run 'cd swiftlings' to go into the generated directory.
Then run 'swiftlings' to get started.
```

### 2. List Available Exercises

```bash
$ cd swiftlings
$ swiftlings list

Exercises:
  1. [ ] intro1
  2. [ ] variables1
  3. [ ] variables2
  4. [ ] functions1
  5. [ ] optionals1
```

### 3. Run First Exercise (intro1)

```bash
$ swiftlings run intro1

Running exercise: intro1...

Compiling exercises/00_intro/intro1.swift...
Compilation successful!

Running...
       Welcome to...
                 _  __ _   _ _
  _____      __ (_)/ _| |_| (_)_ __   __ _ ___
 / __\ \ /\ / / | | |_| __| | | '_ \ / _` / __|
 \__ \\ V  V /  | |  _| |_| | | | | | (_| \__ \
 |___/ \_/\_/   |_|_|  \__|_|_|_| |_|\__, |___/
                                     |___/

This exercise compiles successfully. The remaining exercises contain a compiler
or logic error. The central concept behind Swiftlings is to fix these errors and
solve the exercises. Good luck!

✓ Successfully ran exercises/00_intro/intro1.swift

Next exercise: exercises/01_variables/variables1.swift
```

### 4. Try Second Exercise (variables1) - Fails

```bash
$ swiftlings run variables1

Running exercise: variables1...

Compiling exercises/01_variables/variables1.swift...

exercises/01_variables/variables1.swift:2:1: error: cannot find 'x' in scope
1 | // TODO: Add the missing keyword before 'x'.
2 | x = 5
  | `- error: cannot find 'x' in scope
3 | 
4 | print("x has the value \(x)")

exercises/01_variables/variables1.swift:4:26: error: cannot find 'x' in scope
2 | x = 5
3 | 
4 | print("x has the value \(x)")
  |                          `- error: cannot find 'x' in scope

✗ Ran exercises/01_variables/variables1.swift with errors
```

### 5. Get a Hint

```bash
$ swiftlings hint variables1

Hint for variables1:
The declaration is missing a keyword that is needed
in Swift to create a new variable binding.
In Swift, you use 'let' for constants and 'var' for variables.
```

### 6. Fix the Exercise

Edit `exercises/01_variables/variables1.swift`:

**Before:**
```swift
// TODO: Add the missing keyword before 'x'.
x = 5

print("x has the value \(x)")
```

**After:**
```swift
let x = 5

print("x has the value \(x)")
```

### 7. Run Again - Success!

```bash
$ swiftlings run variables1

Running exercise: variables1...

Compiling exercises/01_variables/variables1.swift...
Compilation successful!

Running...
x has the value 5

✓ Successfully ran exercises/01_variables/variables1.swift

Next exercise: exercises/01_variables/variables2.swift
```

### 8. Check Progress

```bash
$ swiftlings list

Exercises:
  1. [✓] intro1
  2. [✓] variables1
  3. [ ] variables2
  4. [ ] functions1
  5. [ ] optionals1
```

## Exercise Examples

### variables2 - Mutability

```swift
// Variables are immutable by default in Swift.
// TODO: Make this variable mutable by using the correct keyword.
let x = 5
x = 10  // Error: cannot assign to value: 'x' is a 'let' constant

print("x has the value \(x)")
```

**Solution:**
```swift
var x = 5
x = 10
print("x has the value \(x)")
```

### functions1 - Function Definition

```swift
// TODO: Define a function named 'greet' that prints "Hello, Swift!"

greet()  // Error: cannot find 'greet' in scope
```

**Solution:**
```swift
func greet() {
    print("Hello, Swift!")
}

greet()
```

### optionals1 - Optional Unwrapping

```swift
// Optionals are a key feature of Swift!
// TODO: Fix the code so it properly handles the optional value.

let name: String? = "Swift"
print("Hello, \(name)!")  // Warning: String interpolation produces a debug description
```

**Solution:**
```swift
let name: String? = "Swift"
if let name = name {
    print("Hello, \(name)!")
}
```

## Key Features Demonstrated

✅ **Initialization** - Creates complete project structure
✅ **Exercise Execution** - Compiles and runs Swift code
✅ **Error Detection** - Captures and displays compilation errors
✅ **Progress Tracking** - Tracks completed vs pending exercises
✅ **Hint System** - Provides helpful hints for stuck users
✅ **State Persistence** - Progress saved between sessions
✅ **Multiple Exercise Topics** - Variables, functions, optionals, etc.

## Technical Stack

- **Language**: Swift 6.2
- **Build System**: Swift Package Manager
- **CLI Framework**: ArgumentParser
- **YAML Parser**: Yams
- **State Format**: JSON
- **Compiler**: swiftc

## Files Created During Init

```
swiftlings/
├── .gitignore
├── info.yaml                          # Exercise metadata
├── exercises/
│   ├── README.md
│   ├── 00_intro/
│   │   └── intro1.swift
│   ├── 01_variables/
│   │   ├── variables1.swift
│   │   └── variables2.swift
│   ├── 02_functions/
│   │   └── functions1.swift
│   └── 03_optionals/
│       └── optionals1.swift
└── solutions/
    ├── README.md
    └── [corresponding solutions]
```

## Comparison: Rustlings vs Swiftlings

| Feature | Rustlings (Rust) | Swiftlings (Swift) | Status |
|---------|------------------|-------------------|--------|
| Initialization | `rustlings init` | `swiftlings init` | ✅ |
| Run exercises | `rustlings run` | `swiftlings run` | ✅ |
| Watch mode | `rustlings watch` | `swiftlings watch` | ✅ |
| List exercises | `rustlings list` | `swiftlings list` | ✅ |
| Show hints | `rustlings hint` | `swiftlings hint` | ✅ |
| Reset exercise | `rustlings reset` | `swiftlings reset` | ✅ |
| Config format | TOML | YAML | ✅ |
| Compiler | rustc | swiftc | ✅ |
| Linter | Clippy | Swift warnings | ✅ |
| Package manager | Cargo | SPM | ✅ |

## Success Metrics

- ✅ All core commands implemented
- ✅ Exercise compilation working
- ✅ Error detection and reporting
- ✅ State persistence functional
- ✅ 5 exercises created and tested
- ✅ All tests passing
- ✅ Full documentation provided
- ✅ Complete workflow verified

## Conclusion

The Swift 6.2 port of Rustlings (Swiftlings) is **fully functional** and demonstrates:

1. Successful porting of a complex Rust CLI application to Swift
2. Integration with Swift's build system and compiler
3. Proper error handling and user feedback
4. State management and persistence
5. Extensible architecture for adding more exercises

The port maintains the learning philosophy of Rustlings while teaching Swift concepts, making it an effective tool for learning Swift 6.2.
