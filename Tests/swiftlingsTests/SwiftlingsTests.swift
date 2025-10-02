import XCTest
@testable import swiftlings

final class SwiftlingsTests: XCTestCase {
    
    func testExerciseInfoPath() {
        let exercise = ExerciseInfo(
            name: "test1",
            dir: "00_intro",
            test: false,
            strictWarnings: false,
            hint: "Test hint"
        )
        
        XCTAssertEqual(exercise.path(), "exercises/00_intro/test1.swift")
        XCTAssertEqual(exercise.solutionPath(), "solutions/00_intro/test1.swift")
    }
    
    func testExerciseInfoPathWithoutDir() {
        let exercise = ExerciseInfo(
            name: "test1",
            dir: nil,
            test: false,
            strictWarnings: false,
            hint: "Test hint"
        )
        
        XCTAssertEqual(exercise.path(), "exercises/test1.swift")
        XCTAssertEqual(exercise.solutionPath(), "solutions/test1.swift")
    }
}
