import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(DuckSwift_ThunkTests.allTests),
    ]
}
#endif
