import Foundation

/// Errors that can occur in Swiftlings
enum SwiftlingsError: Error, LocalizedError {
    case infoFileNotFound
    case exerciseNotFound(String)
    case exerciseDirectoryNotFound
    case compilationFailed(String)
    case testsFailed(String)
    case stateFileCorrupted
    case alreadyInitialized
    case notInitialized
    case invalidExerciseName
    
    var errorDescription: String? {
        switch self {
        case .infoFileNotFound:
            return "The info.yaml file could not be found. Make sure you're in the swiftlings directory or run 'swiftlings init' first."
        case .exerciseNotFound(let name):
            return "Exercise '\(name)' not found."
        case .exerciseDirectoryNotFound:
            return "The exercises directory could not be found. Run 'swiftlings init' to set up the exercises."
        case .compilationFailed(let output):
            return "Compilation failed:\n\(output)"
        case .testsFailed(let output):
            return "Tests failed:\n\(output)"
        case .stateFileCorrupted:
            return "The state file is corrupted. You may need to delete .swiftlings-state.json and restart."
        case .alreadyInitialized:
            return "Swiftlings is already initialized in this directory. Run 'swiftlings' to get started."
        case .notInitialized:
            return "Swiftlings is not initialized. Run 'swiftlings init' first."
        case .invalidExerciseName:
            return "Invalid exercise name provided."
        }
    }
}
