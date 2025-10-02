import Foundation
import Yams

/// Information about a single exercise
struct ExerciseInfo: Codable {
    /// Exercise's unique name
    let name: String
    
    /// Exercise's directory name inside the `exercises/` directory
    let dir: String?
    
    /// Whether to run tests on the exercise
    let test: Bool
    
    /// Whether to apply strict Swift warnings
    let strictWarnings: Bool
    
    /// The exercise's hint to be shown to the user on request
    let hint: String
    
    /// The exercise is already solved. Ignore it when checking that all exercises are unsolved
    let skipCheckUnsolved: Bool?
    
    enum CodingKeys: String, CodingKey {
        case name
        case dir
        case test
        case strictWarnings = "strict_warnings"
        case hint
        case skipCheckUnsolved = "skip_check_unsolved"
    }
    
    init(name: String, dir: String? = nil, test: Bool = true, strictWarnings: Bool = false, hint: String = "", skipCheckUnsolved: Bool? = nil) {
        self.name = name
        self.dir = dir
        self.test = test
        self.strictWarnings = strictWarnings
        self.hint = hint
        self.skipCheckUnsolved = skipCheckUnsolved
    }
    
    /// Path to the exercise file starting with the `exercises/` directory
    func path() -> String {
        var path = "exercises/"
        if let dir = dir {
            path += "\(dir)/"
        }
        path += "\(name).swift"
        return path
    }
    
    /// Path to the solution file
    func solutionPath() -> String {
        var path = "solutions/"
        if let dir = dir {
            path += "\(dir)/"
        }
        path += "\(name).swift"
        return path
    }
}

/// The info.yaml file structure
struct InfoFile: Codable {
    /// For possible breaking changes in the future for community exercises
    let formatVersion: Int
    
    /// Shown to users when starting with the exercises
    let welcomeMessage: String?
    
    /// Shown to users after finishing all exercises
    let finalMessage: String?
    
    /// List of all exercises
    let exercises: [ExerciseInfo]
    
    enum CodingKeys: String, CodingKey {
        case formatVersion = "format_version"
        case welcomeMessage = "welcome_message"
        case finalMessage = "final_message"
        case exercises
    }
    
    /// Load the info file from the embedded resource or file system
    static func load() throws -> InfoFile {
        let infoPath = "info.yaml"
        
        guard FileManager.default.fileExists(atPath: infoPath) else {
            // Try to load from embedded resources
            guard let url = Bundle.main.url(forResource: "info", withExtension: "yaml") else {
                throw SwiftlingsError.infoFileNotFound
            }
            let data = try Data(contentsOf: url)
            return try InfoFile.parse(from: data)
        }
        
        let data = try Data(contentsOf: URL(fileURLWithPath: infoPath))
        return try InfoFile.parse(from: data)
    }
    
    private static func parse(from data: Data) throws -> InfoFile {
        let yamlString = String(data: data, encoding: .utf8) ?? ""
        let decoder = YAMLDecoder()
        return try decoder.decode(InfoFile.self, from: yamlString)
    }
}
