//
//  EditsApiTests.swift
//  
//
//  Created by admin on 8/03/23.
//

import XCTest
@testable import OpenMagicAI

final class EditsApiTests: XCTestCase {

    private var sut: EditsApi!
    override func setUpWithError() throws {
        sut = .init(apiKey: "", urlSession: URLSessionMock.getURLSession())
    }

    override func tearDownWithError() throws {
        MockURLProtocol.mockData = [:]
    }

    func testCreateEdit() throws {
        // Given
        let path = EndPoint.edits(.createEdit).url.path
        let mock = try Mocks.createEdit.getMock(type: OpenMagic.Edits.self)
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
        let mock = try Mocks.createEdit.getMock(type: OpenMagic.Edits.self)
        MockURLProtocol.mockData[path] = mock.1
        // Case
        let result = try await self.sut.createEdit(instruction: "test")
        // Then
        XCTAssertEqual(mock.0.object, result.object)
    }
}
