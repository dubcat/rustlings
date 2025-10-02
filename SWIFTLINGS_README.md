# Swiftlings 🦅

Small exercises to get you used to reading and writing Swift code - Inspired by [Rustlings](https://github.com/rust-lang/rustlings)

## What is Swiftlings?

Swiftlings is a collection of small exercises designed to help you learn Swift 6.2 by fixing compiler errors and completing small coding challenges. It's perfect for beginners who want to learn Swift or experienced developers who want to get up to speed with Swift 6.2's new features.

## Prerequisites

- Swift 6.2 or later
- A text editor or IDE (Xcode, VS Code with Swift extension, etc.)

## Getting Started

### Installation

1. Clone this repository or download the Swiftlings executable
2. Make sure Swift 6.2 is installed: `swift --version`

### Initialize

Run the initialization command to set up your exercise directory:

```bash
swiftlings init
```

This will create a `swiftlings/` directory with all the exercises.

### Start Learning

Navigate to the swiftlings directory and run:

```bash
cd swiftlings
swiftlings
```

This will start the interactive watch mode. Swiftlings will:
1. Show you the current exercise
2. Automatically recompile and test when you save changes
3. Give you hints if you're stuck
4. Move to the next exercise when you complete the current one

### Commands

- `swiftlings run [exercise_name]` - Run a specific exercise (or the next pending one)
- `swiftlings list` - List all exercises and their status
- `swiftlings hint [exercise_name]` - Show a hint for an exercise
- `swiftlings reset <exercise_name>` - Reset an exercise to its original state
- `swiftlings watch` - Start watch mode (default command)

## Exercise Topics

Swiftlings covers the following Swift topics:

1. **Introduction** - Getting started with Swift
2. **Variables** - let, var, and basic types
3. **Functions** - Defining and calling functions
4. **Optionals** - Working with Optional types
5. **Control Flow** - if, guard, switch statements
6. **Collections** - Arrays, Sets, and Dictionaries
7. **Structs** - Value types and methods
8. **Classes** - Reference types and inheritance
9. **Enums** - Enumerations and associated values
10. **Protocols** - Protocol-oriented programming
11. **Generics** - Generic types and functions
12. **Error Handling** - try, catch, throw
13. **Closures** - Anonymous functions and captures

## How It Works

Each exercise is a Swift file with one or more problems. Your job is to:

1. Open the exercise file in your editor
2. Read the comments and understand what's needed
3. Fix the code so it compiles and runs correctly
4. Save the file
5. Swiftlings will automatically check your solution

If you get stuck, use `swiftlings hint <exercise_name>` to see a hint!

## Swift 6.2 Features

This version of Swiftlings is specifically designed for Swift 6.2 and includes exercises covering:

- Swift concurrency (async/await, actors)
- New language features in Swift 6.2
- Modern Swift patterns and best practices
- Value types and reference types
- Protocol-oriented programming

## Contributing

Found a bug or want to add an exercise? Contributions are welcome! Please feel free to open an issue or submit a pull request.

## License

Same as the original Rustlings: MIT

## Credits

Swiftlings is inspired by and based on [Rustlings](https://github.com/rust-lang/rustlings), the excellent Rust learning tool created by the Rust community.
