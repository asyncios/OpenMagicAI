//
//  ModelsApiTests.swift
//  
//
//  Created by admin on 8/03/23.
//

import XCTest
@testable import OpenMagicAI

final class ModelsApiTests: XCTestCase {

    private var sut: ModelsApi!
    override func setUpWithError() throws {
        sut = .init(apiKey: "", urlSession: URLSessionMock.getURLSession())
    }

    override func tearDownWithError() throws {
        MockURLProtocol.mockData = [:]
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
