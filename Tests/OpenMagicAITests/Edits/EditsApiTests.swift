//
//  EditsApiTests.swift
//  
//
//  Created by admin on 8/03/23.
//

import XCTest
import Combine
@testable import OpenMagicAI

final class EditsApiTests: XCTestCase {

    private var sut: EditsApi!
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

    func testCreateEdit() throws {
        // Given
        let path = EndPoint.edits(.createEdit).url.path
        let mock = try Mocks.createEdit.getMock(type: EditsCreated.self)
        MockURLProtocol.mockData[path] = mock.1
        let expectation: XCTestExpectation = .init(description: "testCreateEdit")
        // Case
        sut.createEdit(instruction: "test") { result in
            if case .success(let success) = result,
               success.object == mock.0.object {
                expectation.fulfill()
            }
        }
        // When
        wait(for: [expectation], timeout: 1)
    }

}

// MARK: Async
extension EditsApiTests {
    func testCreateEditAsync() async throws -> Void {
        // Given
        let path = EndPoint.edits(.createEdit).url.path
        let mock = try Mocks.createEdit.getMock(type: EditsCreated.self)
        MockURLProtocol.mockData[path] = mock.1
        // Case
        let result = try await self.sut.createEdit(instruction: "test")
        // Then
        XCTAssertEqual(mock.0.object, result.object)
    }
}

// MARK: Combine
extension EditsApiTests {
    func testCreateEditFuture() async throws -> Void {
        // Given
        let path = EndPoint.edits(.createEdit).url.path
        let mock = try Mocks.createEdit.getMock(type: EditsCreated.self)
        MockURLProtocol.mockData[path] = mock.1
        let expectation: XCTestExpectation = .init(description: "testCreateEditFuture")
        var result: EditsCreated?
        // Case
        sut.createEdit(instruction: "test").sink { result in
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
