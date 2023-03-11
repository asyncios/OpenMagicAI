//
//  CompletionsApiTests.swift
//  
//
//  Created by admin on 7/03/23.
//

import XCTest
import Combine
@testable import OpenMagicAI

final class CompletionsApiTests: XCTestCase {

    private var sut: CompletionsApi!
    private var cancellables: Set<AnyCancellable> = []

    override func setUpWithError() throws {
        cancellables = []
        sut = .init(apiKey: "test", urlSession: URLSessionMock.getURLSession())
    }

    override func tearDownWithError() throws {
        MockURLProtocol.mockData = [:]
        cancellables.forEach({ $0.cancel() })
        cancellables.removeAll()
    }

    func testCreateCompletion() async throws -> Void {
        // Given
        let path = EndPoint.completions(.createCompletion).url.path
        let mock = try Mocks.createCompletion.getMock(type: Completions.self)
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
        let mock = try Mocks.createCompletion.getMock(type: Completions.self)
        MockURLProtocol.mockData[path] = mock.1
        // Case
        let result = try await self.sut.createCompletion(prompt: "test")
        // Then
        XCTAssertEqual(mock.0.object, result.object)
    }
}

// MARK: Combine
extension CompletionsApiTests {
    func testCreateCompletionFuture() async throws -> Void {
        // Given
        let path = EndPoint.completions(.createCompletion).url.path
        let mock = try Mocks.createCompletion.getMock(type: Completions.self)
        MockURLProtocol.mockData[path] = mock.1
        let expectation: XCTestExpectation = .init(description: "testCreateCompletionFuture")
        var result: Completions?
        // Case
        sut.createCompletionFuture(prompt: "").sink { result in
            if case .finished = result {
                expectation.fulfill()
            }
        } receiveValue: { value in
            result = value
        }.store(in: &cancellables)
        // Then
        wait(for: [expectation], timeout: 1)
        XCTAssertEqual(mock.0.object, result?.object)
    }
}

