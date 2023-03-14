//
//  EmbeddingsApiTests.swift
//  
//
//  Created by admin on 14/03/23.
//

import XCTest
import Combine
@testable import OpenMagicAI

final class EmbeddingsApiTests: XCTestCase {

    private var sut: EmbeddingsApi!
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

    func testCreateEmbeddings() async throws -> Void {
        // Given
        let path = EndPoint.embeddings(.createEmbeddings).url.path
        let mock = try Mocks.createEmbeddings.getMock(type: EmbeddingsCreated.self)
        MockURLProtocol.mockData[path] = mock.1
        // Case
        let expectation: XCTestExpectation = .init(description: "testCreateEmbeddings")
        sut.createEmbeddings(input: "test") { result in
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
extension EmbeddingsApiTests {
    func testCreateEmbeddingsAsync() async throws -> Void {
        // Given
        let path = EndPoint.embeddings(.createEmbeddings).url.path
        let mock = try Mocks.createEmbeddings.getMock(type: EmbeddingsCreated.self)
        MockURLProtocol.mockData[path] = mock.1
        // Case
        let result = try await self.sut.createEmbeddings(input: "test")
        // Then
        XCTAssertEqual(mock.0.object, result.object)
    }
}

// MARK: Combine
extension EmbeddingsApiTests {
    func testCreateEmbeddingsFuture() async throws -> Void {
        // Given
        let path = EndPoint.embeddings(.createEmbeddings).url.path
        let mock = try Mocks.createEmbeddings.getMock(type: EmbeddingsCreated.self)
        MockURLProtocol.mockData[path] = mock.1
        let expectation: XCTestExpectation = .init(description: "testCreateEmbeddingsFuture")
        var result: EmbeddingsCreated?
        // Case
        sut.createEmbeddingsFuture(input: "test").sink { result in
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
