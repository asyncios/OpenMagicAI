//
//  ChatApiTests.swift
//  
//
//  Created by admin on 9/03/23.
//

import XCTest
import Combine
@testable import OpenMagicAI

final class ChatApiTests: XCTestCase {

    private var sut: ChatApi!
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

    func testCreateChatCompletion() async throws -> Void {
        // Given
        let path = EndPoint.chat(.createChatCompletion).url.path
        let mock = try Mocks.chatCompletion.getMock(type: ChatCompletionsCreated.self)
        MockURLProtocol.mockData[path] = mock.1
        // Case
        let expectation: XCTestExpectation = .init(description: "testCreateChatCompletion")
        sut.createChatCompletion(messages: []) { result in
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
extension ChatApiTests {
    func testCreateChatCompletionAsync() async throws -> Void {
        // Given
        let path = EndPoint.chat(.createChatCompletion).url.path
        let mock = try Mocks.chatCompletion.getMock(type: ChatCompletionsCreated.self)
        MockURLProtocol.mockData[path] = mock.1
        // Case
        let result = try await self.sut.createChatCompletion(messages: [])
        // Then
        XCTAssertEqual(mock.0.object, result.object)
    }
}

// MARK: Combine
extension ChatApiTests {
    func testCreateChatCompletionFuture() async throws -> Void {
        // Given
        let path = EndPoint.chat(.createChatCompletion).url.path
        let mock = try Mocks.chatCompletion.getMock(type: ChatCompletionsCreated.self)
        MockURLProtocol.mockData[path] = mock.1
        let expectation: XCTestExpectation = .init(description: "testCreateChatCompletionFuture")
        var result: ChatCompletionsCreated?
        // Case
        sut.createChatCompletionFuture(messages: []).sink { result in
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
