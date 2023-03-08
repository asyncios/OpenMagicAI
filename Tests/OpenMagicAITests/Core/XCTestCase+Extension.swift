//
//  File.swift
//  
//
//  Created by admin on 7/03/23.
//

import Foundation
import XCTest

extension XCTestCase {

    enum TestsMockError: Error {
        case fileNotFound
    }
    
    func getMock<T: Codable>(type: T.Type, fromJsonFile file: String) throws -> (T, Data) {
        let bundle = Bundle(for: Self.self)
        guard let path = bundle.path(forResource: file, ofType: "json") else {
            throw TestsMockError.fileNotFound
        }
        let url = URL(fileURLWithPath: path)
        let data = try Data(contentsOf: url)
        let response = try JSONDecoder().decode(T.self, from: data)
        return (response, data)
    }

    func runAsyncTest(
        named testName: String = #function,
        in file: StaticString = #file,
        at line: UInt = #line,
        withTimeout timeout: TimeInterval = 10,
        test: @escaping () async throws -> Void
    ) {
        var thrownError: Error?
        let errorHandler = { thrownError = $0 }
        let expectation = expectation(description: testName)

        Task {
            do {
                try await test()
            } catch {
                errorHandler(error)
            }

            expectation.fulfill()
        }

        waitForExpectations(timeout: timeout)

        if let error = thrownError {
            XCTFail(
                "Async error thrown: \(error)",
                file: file,
                line: line
            )
        }
    }
}
