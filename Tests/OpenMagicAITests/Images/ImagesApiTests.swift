//
//  ImagesApiTests.swift
//  
//
//  Created by admin on 8/03/23.
//

import XCTest
@testable import OpenMagicAI

final class ImagesApiTests: XCTestCase {
    
    private var sut: ImagesApi!
    override func setUpWithError() throws {
        sut = .init(apiKey: "", urlSession: URLSessionMock.getURLSession())
    }
    
    override func tearDownWithError() throws {
        MockURLProtocol.mockData = [:]
    }
    
    func testGenerations() throws {
        // Given
        let path = EndPoint.images(.generations).url.path
        let mock = try Mocks.createImage.getMock(type: OpenMagic.Images.self)
        MockURLProtocol.mockData[path] = mock.1
        let expecation: XCTestExpectation = .init(description: "testGenerations")
        // Case
        sut.generations(prompt: "test") { result in
            if case .success(let success) = result,
               success.created == mock.0.created {
                expecation.fulfill()
            }
        }
        // When
        wait(for: [expecation], timeout: 1)
    }
    
}


// MARK: Async
extension ImagesApiTests {
    func testGenerationsAsync() async throws -> Void {
        // Given
        let path = EndPoint.images(.generations).url.path
        let mock = try Mocks.createImage.getMock(type: OpenMagic.Images.self)
        MockURLProtocol.mockData[path] = mock.1
        // Case
        let result = try await sut.generations(prompt: "test")
        // When
        XCTAssertEqual(mock.0.created, result.created)
    }
}
