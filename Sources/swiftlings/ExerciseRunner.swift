import Foundation

/// Handles compiling and running Swift exercises
class ExerciseRunner {
    
    /// Run an exercise (compile and optionally run tests)
    func runExercise(_ exercise: ExerciseInfo) throws -> Bool {
        let exercisePath = exercise.path()
        
        guard FileManager.default.fileExists(atPath: exercisePath) else {
            throw SwiftlingsError.exerciseNotFound(exercise.name)
        }
        
        // Compile the exercise
        print("\nCompiling \(exercisePath)...")
        
        let compileResult = try compile(exercise)
        if !compileResult.success {
            print(compileResult.output)
            return false
        }
        
        print("Compilation successful!")
        
        // Run tests if required
        if exercise.test {
            print("\nRunning tests...")
            let testResult = try runTests(exercise)
            if !testResult.success {
                print(testResult.output)
                return false
            }
            print("All tests passed!")
        } else {
            // Just run the exercise
            print("\nRunning...")
            let runResult = try run(exercise)
            print(runResult.output)
            if !runResult.success {
                return false
            }
        }
        
        return true
    }
    
    private struct CommandResult {
        let success: Bool
        let output: String
    }
    
    /// Compile a Swift exercise
    private func compile(_ exercise: ExerciseInfo) throws -> CommandResult {
        let exercisePath = exercise.path()
        let outputPath = ".build/\(exercise.name)"
        
        // Create build directory
        try? FileManager.default.createDirectory(atPath: ".build", withIntermediateDirectories: true)
        
        var arguments = ["swiftc", exercisePath, "-o", outputPath]
        
        if exercise.strictWarnings {
            arguments.append(contentsOf: ["-warnings-as-errors"])
        }
        
        return executeCommand(arguments)
    }
    
    /// Run tests for an exercise
    private func runTests(_ exercise: ExerciseInfo) throws -> CommandResult {
        let exercisePath = exercise.path()
        
        // Swift test integration
        let arguments = ["swift", "test", "--filter", exercise.name]
        return executeCommand(arguments)
    }
    
    /// Run an exercise binary
    private func run(_ exercise: ExerciseInfo) throws -> CommandResult {
        let binaryPath = ".build/\(exercise.name)"
        return executeCommand([binaryPath])
    }
    
    /// Execute a shell command and capture output
    private func executeCommand(_ arguments: [String]) -> CommandResult {
        let process = Process()
        process.executableURL = URL(fileURLWithPath: "/usr/bin/env")
        process.arguments = arguments
        
        let outputPipe = Pipe()
        let errorPipe = Pipe()
        process.standardOutput = outputPipe
        process.standardError = errorPipe
        
        do {
            try process.run()
            process.waitUntilExit()
            
            let outputData = outputPipe.fileHandleForReading.readDataToEndOfFile()
            let errorData = errorPipe.fileHandleForReading.readDataToEndOfFile()
            
            var output = String(data: outputData, encoding: .utf8) ?? ""
            let errorOutput = String(data: errorData, encoding: .utf8) ?? ""
            
            if !errorOutput.isEmpty {
                output += "\n" + errorOutput
            }
            
            return CommandResult(
                success: process.terminationStatus == 0,
                output: output
            )
        } catch {
            return CommandResult(
                success: false,
                output: "Failed to execute command: \(error.localizedDescription)"
            )
        }
    }
}
