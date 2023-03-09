//
//  ChatApiTests.swift
//  
//
//  Created by admin on 9/03/23.
//

import XCTest
@testable import OpenMagicAI

final class ChatApiTests: XCTestCase {

    private var sut: ChatApi!
    override func setUpWithError() throws {
        sut = .init(apiKey: "", urlSession: URLSessionMock.getURLSession())
    }

    override func tearDownWithError() throws {
        MockURLProtocol.mockData = [:]
    }

    func testChatCompletion() async throws -> Void {
        // Given
        let path = EndPoint.chat(.chatCompletion).url.path
        let mock = try Mocks.chatCompletion.getMock(type: ChatCompletions.self)
        MockURLProtocol.mockData[path] = mock.1
        // Case
        let expectation: XCTestExpectation = .init(description: "testChatCompletion")
        sut.chatCompletion(messages: []) { result in
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
    func testChatCompletionAsync() async throws -> Void {
        // Given
        let path = EndPoint.chat(.chatCompletion).url.path
        let mock = try Mocks.chatCompletion.getMock(type: ChatCompletions.self)
        MockURLProtocol.mockData[path] = mock.1
        // Case
        let result = try await self.sut.chatCompletion(messages: [])
        // Then
        XCTAssertEqual(mock.0.object, result.object)
    }
}
