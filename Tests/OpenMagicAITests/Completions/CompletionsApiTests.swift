//
//  CompletionsApiTests.swift
//  
//
//  Created by admin on 7/03/23.
//

import XCTest
@testable import OpenMagicAI

final class CompletionsApiTests: XCTestCase {

    private var sut: CompletionsApi!
    override func setUpWithError() throws {
        sut = .init(apiKey: "", urlSession: URLSessionMock.getURLSession())
    }

    override func tearDownWithError() throws {
        MockURLProtocol.mockData = [:]
    }

    func testCreateCompletion() async throws -> Void {
        // Given
        let path = EndPoint.completions(.createCompletion).url.path
        let mock = try getCreateCompletionMock()
        MockURLProtocol.mockData[path] = mock.1
        // Case
        let expectation: XCTestExpectation = .init(description: "testCreateCompletion")
        sut.createCompletion(prompt: "test") { result in
            if case .success(let success) = result,
               success.object == mock.0.object {
                expectation.fulfill()
            }
        }
        // Then
        wait(for: [expectation], timeout: 1)
    }

}

// MARK: Async
extension CompletionsApiTests {
    func testCreateCompletionAsync() async throws -> Void {
        // Given
        let path = EndPoint.completions(.createCompletion).url.path
        let mock = try getCreateCompletionMock()
        MockURLProtocol.mockData[path] = mock.1
        // Case
        let result = try await self.sut.createCompletion(prompt: "test")
        // Then
        XCTAssertEqual(mock.0.object, result.object)
    }
}
