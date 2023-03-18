//
//  ImagesApiTests.swift
//  
//
//  Created by admin on 8/03/23.
//

import XCTest
import Combine
@testable import OpenMagicAI

final class ImagesApiTests: XCTestCase {
    
    private var sut: ImagesApi!
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
    
    func testCreateImage() throws {
        // Given
        let path = EndPoint.images(.createImage).url.path
        let mock = try Mocks.createImage.getMock(type: ImagesCreated.self)
        MockURLProtocol.mockData[path] = mock.1
        let expecation: XCTestExpectation = .init(description: "testCreateImage")
        // Case
        sut.createImage(prompt: "test") { result in
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
    func testCreateImageAsync() async throws -> Void {
        // Given
        let path = EndPoint.images(.createImage).url.path
        let mock = try Mocks.createImage.getMock(type: ImagesCreated.self)
        MockURLProtocol.mockData[path] = mock.1
        // Case
        let result = try await sut.createImage(prompt: "test")
        // When
        XCTAssertEqual(mock.0.created, result.created)
    }
}

// MARK: Combine
extension ImagesApiTests {
    func testCreateImageFurure() async throws -> Void {
        // Given
        let path = EndPoint.images(.createImage).url.path
        let mock = try Mocks.createImage.getMock(type: ImagesCreated.self)
        MockURLProtocol.mockData[path] = mock.1
        let expectation: XCTestExpectation = .init(description: "testCreateImageFurure")
        var result: ImagesCreated?
        // Case
        sut.createImageFuture(prompt: "test").sink { result in
            if case .finished = result {
                expectation.fulfill()
            }
        } receiveValue: { value in
            result = value
        }.store(in: &cancellables)
        // Then
        wait(for: [expectation], timeout: 1)
        XCTAssertEqual(mock.0.created, result?.created)
    }
}
