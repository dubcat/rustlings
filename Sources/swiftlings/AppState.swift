import Foundation

/// Represents the application state, tracking exercise progress
class AppState {
    private let infoFile: InfoFile
    private var exerciseStates: [String: ExerciseState]
    private let stateFilePath = ".swiftlings-state.json"
    
    struct ExerciseState: Codable {
        var done: Bool
        var lastAttempt: Date?
    }
    
    private struct StateFile: Codable {
        let formatVersion: Int
        let exercises: [String: ExerciseState]
    }
    
    init() throws {
        // Load info file
        self.infoFile = try InfoFile.load()
        
        // Load or create state file
        self.exerciseStates = [:]
        
        if FileManager.default.fileExists(atPath: stateFilePath) {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: stateFilePath))
                let stateFile = try JSONDecoder().decode(StateFile.self, from: data)
                self.exerciseStates = stateFile.exercises
            } catch {
                print("Warning: Could not load state file, creating new one.")
            }
        }
        
        // Initialize states for new exercises
        for exercise in infoFile.exercises {
            if exerciseStates[exercise.name] == nil {
                exerciseStates[exercise.name] = ExerciseState(done: false, lastAttempt: nil)
            }
        }
    }
    
    /// Save the current state to disk
    private func saveState() throws {
        let stateFile = StateFile(formatVersion: 1, exercises: exerciseStates)
        let data = try JSONEncoder().encode(stateFile)
        try data.write(to: URL(fileURLWithPath: stateFilePath))
    }
    
    /// Get the current exercise (first pending one)
    func currentExercise() -> ExerciseInfo? {
        return infoFile.exercises.first { exercise in
            exerciseStates[exercise.name]?.done == false
        }
    }
    
    /// Run a specific exercise or the current one
    func runExercise(named name: String?) throws {
        let exercise: ExerciseInfo
        
        if let name = name {
            guard let found = infoFile.exercises.first(where: { $0.name == name }) else {
                throw SwiftlingsError.exerciseNotFound(name)
            }
            exercise = found
        } else {
            guard let current = currentExercise() else {
                print("🎉 All exercises completed! Great job!")
                if let finalMessage = infoFile.finalMessage {
                    print("\n\(finalMessage)")
                }
                return
            }
            exercise = current
        }
        
        print("Running exercise: \(exercise.name)...")
        let runner = ExerciseRunner()
        let success = try runner.runExercise(exercise)
        
        if success {
            print("✓ Successfully ran \(exercise.path())")
            exerciseStates[exercise.name]?.done = true
            exerciseStates[exercise.name]?.lastAttempt = Date()
            try saveState()
            
            // Show next exercise
            if let next = currentExercise() {
                print("\nNext exercise: \(next.path())")
            } else {
                print("\n🎉 All exercises completed! Great job!")
                if let finalMessage = infoFile.finalMessage {
                    print("\n\(finalMessage)")
                }
            }
        } else {
            exerciseStates[exercise.name]?.lastAttempt = Date()
            try saveState()
            print("\n✗ Ran \(exercise.path()) with errors")
        }
    }
    
    /// Watch for file changes and automatically run exercises
    func watch() throws {
        guard let current = currentExercise() else {
            print("🎉 All exercises completed! Great job!")
            if let finalMessage = infoFile.finalMessage {
                print("\n\(finalMessage)")
            }
            return
        }
        
        print("Watching for changes to \(current.path())...")
        print("Press 'h' for hint, 'r' to run, 'n' for next, 'q' to quit")
        
        // Simple implementation - in a full version, we'd use file system events
        try runExercise(named: current.name)
    }
    
    /// List all exercises with their status
    func listExercises() {
        print("Exercises:")
        for (index, exercise) in infoFile.exercises.enumerated() {
            let status = exerciseStates[exercise.name]?.done == true ? "✓" : " "
            print("\(String(format: "%3d", index + 1)). [\(status)] \(exercise.name)")
        }
    }
    
    /// Reset an exercise to unsolved state
    func resetExercise(named name: String) throws {
        guard infoFile.exercises.contains(where: { $0.name == name }) else {
            throw SwiftlingsError.exerciseNotFound(name)
        }
        
        exerciseStates[name] = ExerciseState(done: false, lastAttempt: nil)
        try saveState()
        print("Reset exercise: \(name)")
    }
    
    /// Show hint for an exercise
    func showHint(for name: String?) throws {
        let exercise: ExerciseInfo
        
        if let name = name {
            guard let found = infoFile.exercises.first(where: { $0.name == name }) else {
                throw SwiftlingsError.exerciseNotFound(name)
            }
            exercise = found
        } else {
            guard let current = currentExercise() else {
                print("All exercises completed!")
                return
            }
            exercise = current
        }
        
        print("Hint for \(exercise.name):")
        print(exercise.hint)
    }
}
