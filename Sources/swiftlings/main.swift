import Foundation
import ArgumentParser

/// Swiftlings is a collection of small exercises to get you used to writing and reading Swift code
struct Swiftlings: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "swiftlings",
        abstract: "Swiftlings is a collection of small exercises to get you used to writing and reading Swift code",
        version: "1.0.0",
        subcommands: [
            InitCommand.self,
            RunCommand.self,
            WatchCommand.self,
            ListCommand.self,
            ResetCommand.self,
            HintCommand.self,
        ],
        defaultSubcommand: WatchCommand.self
    )
    
    @Flag(help: "Manually run the current exercise using `r` in the watch mode. Only use this if Swiftlings fails to detect exercise file changes.")
    var manualRun = false
}

// MARK: - Subcommands

struct InitCommand: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "init",
        abstract: "Initialize Swiftlings exercises"
    )
    
    func run() throws {
        print("Initializing Swiftlings...")
        try InitManager.initialize()
    }
}

struct RunCommand: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "run",
        abstract: "Run a single exercise. Runs the next pending exercise if the exercise name is not specified"
    )
    
    @Argument(help: "The name of the exercise")
    var name: String?
    
    func run() throws {
        let appState = try AppState()
        try appState.runExercise(named: name)
    }
}

struct WatchCommand: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "watch",
        abstract: "Run exercises in watch mode, automatically re-running on file changes"
    )
    
    func run() throws {
        let appState = try AppState()
        try appState.watch()
    }
}

struct ListCommand: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "list",
        abstract: "List all exercises"
    )
    
    func run() throws {
        let appState = try AppState()
        appState.listExercises()
    }
}

struct ResetCommand: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "reset",
        abstract: "Reset a single exercise"
    )
    
    @Argument(help: "The name of the exercise")
    var name: String
    
    func run() throws {
        let appState = try AppState()
        try appState.resetExercise(named: name)
    }
}

struct HintCommand: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "hint",
        abstract: "Show a hint. Shows the hint of the next pending exercise if the exercise name is not specified"
    )
    
    @Argument(help: "The name of the exercise")
    var name: String?
    
    func run() throws {
        let appState = try AppState()
        try appState.showHint(for: name)
    }
}

// Entry point
Swiftlings.main()
