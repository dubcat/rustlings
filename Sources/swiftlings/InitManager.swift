import Foundation

/// Handles initialization of Swiftlings directory structure
struct InitManager {
    
    static func initialize() throws {
        let swiftlingsDir = "swiftlings"
        
        // Check if already initialized
        if FileManager.default.fileExists(atPath: swiftlingsDir) {
            throw SwiftlingsError.alreadyInitialized
        }
        
        print("""
        
               Welcome to...
                         _  __ _   _ _
          _____      __ (_)/ _| |_| (_)_ __   __ _ ___
         / __\\ \\ /\\ / / | | |_| __| | | '_ \\ / _` / __|
         \\__ \\\\ V  V /  | |  _| |_| | | | | | (_| \\__ \\
         |___/ \\_/\\_/   |_|_|  \\__|_|_|_| |_|\\__, |___/
                                             |___/
        
        This command will create the directory 'swiftlings/' which will contain the exercises.
        """)
        
        print("Press ENTER to continue...")
        _ = readLine()
        
        // Create directory structure
        try FileManager.default.createDirectory(atPath: swiftlingsDir, withIntermediateDirectories: true)
        
        FileManager.default.changeCurrentDirectoryPath(swiftlingsDir)
        
        // Create subdirectories
        let directories = [
            "exercises",
            "solutions",
            "exercises/00_intro",
            "exercises/01_variables",
            "exercises/02_functions",
            "exercises/03_optionals",
            "exercises/04_control_flow",
            "exercises/05_collections",
            "exercises/06_structs",
            "exercises/07_classes",
            "exercises/08_enums",
            "exercises/09_protocols",
            "exercises/10_generics",
            "exercises/11_error_handling",
            "exercises/12_closures",
            "exercises/13_async_await",
            "exercises/14_actors",
            "exercises/15_macros",
            "solutions/00_intro",
            "solutions/01_variables",
            "solutions/02_functions",
            "solutions/03_optionals",
            "solutions/04_control_flow",
            "solutions/05_collections",
            "solutions/06_structs",
            "solutions/07_classes",
            "solutions/08_enums",
            "solutions/09_protocols",
            "solutions/10_generics",
            "solutions/11_error_handling",
            "solutions/12_closures",
            "solutions/13_async_await",
            "solutions/14_actors",
            "solutions/15_macros",
        ]
        
        for dir in directories {
            try FileManager.default.createDirectory(atPath: dir, withIntermediateDirectories: true)
        }
        
        // Create info.yaml file
        try createInfoFile()
        
        // Create sample exercises
        try createSampleExercises()
        
        // Create README files
        try createReadmeFiles()
        
        // Create .gitignore
        try createGitignore()
        
        print("""
        
        ✓ Swiftlings initialized successfully!
        
        Run 'cd swiftlings' to go into the generated directory.
        Then run 'swiftlings' to get started.
        """)
    }
    
    private static func createInfoFile() throws {
        let infoContent = """
        format_version: 1
        
        welcome_message: |
          Is this your first time? Don't worry, Swiftlings is made for beginners!
          We are going to teach you a lot of things about Swift, but before we can
          get started, here are some notes about how Swiftlings operates:
          
          1. The central concept behind Swiftlings is that you solve exercises. These
             exercises usually contain some compiler or logic errors which cause the
             exercise to fail compilation or testing. It's your job to find all errors
             and fix them!
          2. Make sure to have your editor open in the 'swiftlings/' directory. Swiftlings
             will show you the path of the current exercise. Open the exercise file in
             your editor, fix errors and save the file.
          3. If you're stuck on an exercise, enter 'swiftlings hint <exercise_name>' to show a hint.
          4. If an exercise doesn't make sense to you, feel free to open an issue on GitHub!
        
        final_message: |
          We hope you enjoyed learning about the various aspects of Swift!
          If you noticed any issues, don't hesitate to report them on GitHub.
          You can also contribute your own exercises to help the greater community!
        
        exercises:
          - name: intro1
            dir: 00_intro
            test: false
            strict_warnings: false
            skip_check_unsolved: true
            hint: |
              This exercise is just to get you started!
              Run it with: swiftlings run intro1
          
          - name: variables1
            dir: 01_variables
            test: false
            strict_warnings: false
            hint: |
              The declaration is missing a keyword that is needed
              in Swift to create a new variable binding.
              In Swift, you use 'let' for constants and 'var' for variables.
          
          - name: variables2
            dir: 01_variables
            test: false
            strict_warnings: false
            hint: |
              The error message tells you that you cannot assign to a 'let' constant.
              In Swift, 'let' creates an immutable binding.
              What keyword do you use when you need to change a value?
          
          - name: functions1
            dir: 02_functions
            test: false
            strict_warnings: false
            hint: |
              A function is defined with the 'func' keyword.
              The basic syntax is: func functionName() { ... }
          
          - name: optionals1
            dir: 03_optionals
            test: false
            strict_warnings: false
            hint: |
              Optional values in Swift can be nil.
              You need to unwrap them before using them.
              Try using 'if let' to safely unwrap the optional.
          
          - name: async1
            dir: 13_async_await
            test: false
            strict_warnings: false
            hint: |
              Swift 6.2 supports async/await for asynchronous programming.
              Mark the function as 'async' and use 'await' when calling it.
              Remember to use 'Task { }' to run async code.
          
          - name: actors1
            dir: 14_actors
            test: false
            strict_warnings: false
            hint: |
              Actors in Swift 6 provide thread-safe data isolation.
              Define an actor with the 'actor' keyword instead of 'class'.
              Access to actor properties and methods is automatically synchronized.
          
          - name: macros1
            dir: 15_macros
            test: false
            strict_warnings: false
            hint: |
              Swift 6 introduces macros for compile-time code generation.
              This is an advanced feature - for now, just understand the syntax.
        """
        
        try infoContent.write(toFile: "info.yaml", atomically: true, encoding: .utf8)
    }
    
    private static func createSampleExercises() throws {
        // intro1.swift
        let intro1 = """
        // This exercise compiles successfully. The remaining exercises contain a compiler
        // or logic error. The central concept behind Swiftlings is to fix these errors and
        // solve the exercises. Good luck!
        //
        // Try adding a new print statement and re-run the exercise.
        
        print(\"\"\"
               Welcome to...
                         _  __ _   _ _
          _____      __ (_)/ _| |_| (_)_ __   __ _ ___
         / __\\\\ \\\\ /\\\\ / / | | |_| __| | | '_ \\\\ / _` / __|
         \\\\__ \\\\\\\\ V  V /  | |  _| |_| | | | | | (_| \\\\__ \\\\
         |___/ \\\\_/\\\\_/   |_|_|  \\\\__|_|_|_| |_|\\\\__, |___/
                                             |___/
        \"\"\")
        
        print()
        print("This exercise compiles successfully. The remaining exercises contain a compiler")
        print("or logic error. The central concept behind Swiftlings is to fix these errors and")
        print("solve the exercises. Good luck!")
        """
        
        try intro1.write(toFile: "exercises/00_intro/intro1.swift", atomically: true, encoding: .utf8)
        
        // variables1.swift
        let variables1 = """
        // TODO: Add the missing keyword before 'x'.
        x = 5
        
        print("x has the value \\(x)")
        """
        try variables1.write(toFile: "exercises/01_variables/variables1.swift", atomically: true, encoding: .utf8)
        
        // variables2.swift
        let variables2 = """
        // Variables are immutable by default in Swift.
        // TODO: Make this variable mutable by using the correct keyword.
        let x = 5
        x = 10
        
        print("x has the value \\(x)")
        """
        try variables2.write(toFile: "exercises/01_variables/variables2.swift", atomically: true, encoding: .utf8)
        
        // functions1.swift
        let functions1 = """
        // TODO: Define a function named 'greet' that prints "Hello, Swift!"
        
        greet()
        """
        try functions1.write(toFile: "exercises/02_functions/functions1.swift", atomically: true, encoding: .utf8)
        
        // optionals1.swift
        let optionals1 = """
        // Optionals are a key feature of Swift!
        // TODO: Fix the code so it properly handles the optional value.
        
        let name: String? = "Swift"
        print("Hello, \\(name)!")
        """
        try optionals1.write(toFile: "exercises/03_optionals/optionals1.swift", atomically: true, encoding: .utf8)
        
        // async1.swift - Swift 6.2 async/await
        let async1 = """
        // Swift 6.2 supports async/await for asynchronous programming!
        // TODO: Make this function async and use await when calling it.
        
        import Foundation
        
        func fetchData() -> String {
            return "Data fetched"
        }
        
        // TODO: Mark fetchData as async, use await to call it, and wrap in Task
        print(fetchData())
        """
        try async1.write(toFile: "exercises/13_async_await/async1.swift", atomically: true, encoding: .utf8)
        
        // actors1.swift - Swift 6 actors
        let actors1 = """
        // Actors provide thread-safe data isolation in Swift 6!
        // TODO: Change this class to an actor to make it thread-safe.
        
        import Foundation
        
        class Counter {
            var value = 0
            
            func increment() {
                value += 1
            }
        }
        
        let counter = Counter()
        counter.increment()
        print("Counter: \\(counter.value)")
        """
        try actors1.write(toFile: "exercises/14_actors/actors1.swift", atomically: true, encoding: .utf8)
        
        // macros1.swift - Swift 6 macros
        let macros1 = """
        // Swift 6 introduces powerful macros!
        // This exercise just demonstrates the concept.
        
        // Macros are defined with @
        // For example: @freestanding(expression) macro stringify<T>(_ value: T) -> String
        
        // For now, let's use a simple print
        let value = 42
        print("The value is: \\(value)")
        
        // TODO: Just run this to see it works - macros are advanced!
        """
        try macros1.write(toFile: "exercises/15_macros/macros1.swift", atomically: true, encoding: .utf8)
        
        // Create solution files
        let intro1Solution = intro1  // Same as exercise
        try intro1Solution.write(toFile: "solutions/00_intro/intro1.swift", atomically: true, encoding: .utf8)
        
        let variables1Solution = """
        let x = 5
        
        print("x has the value \\(x)")
        """
        try variables1Solution.write(toFile: "solutions/01_variables/variables1.swift", atomically: true, encoding: .utf8)
        
        let variables2Solution = """
        // Variables are immutable by default in Swift.
        var x = 5
        x = 10
        
        print("x has the value \\(x)")
        """
        try variables2Solution.write(toFile: "solutions/01_variables/variables2.swift", atomically: true, encoding: .utf8)
        
        let functions1Solution = """
        func greet() {
            print("Hello, Swift!")
        }
        
        greet()
        """
        try functions1Solution.write(toFile: "solutions/02_functions/functions1.swift", atomically: true, encoding: .utf8)
        
        let optionals1Solution = """
        // Optionals are a key feature of Swift!
        let name: String? = "Swift"
        if let name = name {
            print("Hello, \\(name)!")
        }
        """
        try optionals1Solution.write(toFile: "solutions/03_optionals/optionals1.swift", atomically: true, encoding: .utf8)
        
        // async1 solution
        let async1Solution = """
        // Swift 6.2 supports async/await for asynchronous programming!
        
        import Foundation
        
        func fetchData() async -> String {
            return "Data fetched"
        }
        
        Task {
            let result = await fetchData()
            print(result)
        }
        
        // Keep program running to see output
        RunLoop.main.run(until: Date(timeIntervalSinceNow: 0.1))
        """
        try async1Solution.write(toFile: "solutions/13_async_await/async1.swift", atomically: true, encoding: .utf8)
        
        // actors1 solution
        let actors1Solution = """
        // Actors provide thread-safe data isolation in Swift 6!
        
        import Foundation
        
        actor Counter {
            var value = 0
            
            func increment() {
                value += 1
            }
        }
        
        Task {
            let counter = Counter()
            await counter.increment()
            print("Counter: \\(await counter.value)")
        }
        
        // Keep program running to see output
        RunLoop.main.run(until: Date(timeIntervalSinceNow: 0.1))
        """
        try actors1Solution.write(toFile: "solutions/14_actors/actors1.swift", atomically: true, encoding: .utf8)
        
        // macros1 solution (same as exercise for now)
        let macros1Solution = """
        // Swift 6 introduces powerful macros!
        // This exercise just demonstrates the concept.
        
        let value = 42
        print("The value is: \\(value)")
        
        // Macros are an advanced feature in Swift 6.2
        // They allow compile-time code generation.
        """
        try macros1Solution.write(toFile: "solutions/15_macros/macros1.swift", atomically: true, encoding: .utf8)
    }
    
    private static func createReadmeFiles() throws {
        let exercisesReadme = """
        # Swiftlings Exercises
        
        This directory contains all the exercises for Swiftlings.
        Each subdirectory represents a topic, and contains multiple exercises related to that topic.
        
        Don't edit the exercises directly in this directory - they will be reset when you restart.
        Instead, work on them through the Swiftlings CLI.
        """
        
        try exercisesReadme.write(toFile: "exercises/README.md", atomically: true, encoding: .utf8)
        
        let solutionsReadme = """
        # Swiftlings Solutions
        
        This directory contains the solutions to all exercises.
        Try to solve the exercises yourself before looking at the solutions!
        """
        
        try solutionsReadme.write(toFile: "solutions/README.md", atomically: true, encoding: .utf8)
    }
    
    private static func createGitignore() throws {
        let gitignore = """
        .build/
        .swiftpm/
        .swiftlings-state.json
        .DS_Store
        *.swiftmodule
        *.o
        """
        
        try gitignore.write(toFile: ".gitignore", atomically: true, encoding: .utf8)
    }
}
