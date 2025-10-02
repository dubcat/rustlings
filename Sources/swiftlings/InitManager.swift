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
