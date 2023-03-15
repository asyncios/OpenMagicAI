//
//  ModelsApiTests.swift
//  
//
//  Created by admin on 8/03/23.
//

import XCTest
import Combine
@testable import OpenMagicAI

final class ModelsApiTests: XCTestCase {

    private var sut: ModelsApi!
    private var cancellables: Set<AnyCancellable> = []

    override func setUpWithError() throws {
        sut = .init(apiKey: "test", urlSession: URLSessionMock.getURLSession())
    }

    override func tearDownWithError() throws {
        MockURLProtocol.mockData = [:]
        cancellables.forEach({ $0.cancel() })
        cancellables.removeAll()
    }

    func testListModels() throws {
        // Given
        let path = EndPoint.models(.listModels).url.path
        let mock = try Mocks.listModels.getMock(type: ListModels.self)
        MockURLProtocol.mockData[path] = mock.1
        let expecation: XCTestExpectation = .init(description: "testGenerations")
        // Case
        sut.listModels { result in
            if case .success(let success) = result,
               success.object == mock.0.object {
                expecation.fulfill()
            }
        }
        // When
        wait(for: [expecation], timeout: 1)
    }
}

// MARK: Async
extension ModelsApiTests {
    func testListModelsAsync() async throws -> Void {
        // Given
        let path = EndPoint.models(.listModels).url.path
        let mock = try Mocks.listModels.getMock(type: ListModels.self)
        MockURLProtocol.mockData[path] = mock.1
        // Case
        let result = try await sut.listModels()
        // When
        XCTAssertEqual(mock.0.object, result.object)
    }
}

// MARK: Combine
extension ModelsApiTests {
    func testListModelsFuture() async throws -> Void {
        // Given
        let path = EndPoint.models(.listModels).url.path
        let mock = try Mocks.listModels.getMock(type: ListModels.self)
        MockURLProtocol.mockData[path] = mock.1
        let expectation: XCTestExpectation = .init(description: "testListModelsFuture")
        var result: ListModels?
        // Case
        sut.listModels().sink { result in
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
