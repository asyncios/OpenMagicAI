//
//  Mocks.swift
//  
//
//  Created by admin on 8/03/23.
//

import Foundation
@testable import OpenMagicAI

enum Mocks: String {

    case createCompletion = "CreateCompletion.json"

    var url: URL {
        let thisSourceFile = URL(fileURLWithPath: #file)
        let thisDirectory = thisSourceFile.deletingLastPathComponent()
        return thisDirectory.appendingPathComponent("Mocks/\(self.rawValue)")
    }

    func getMock<T: Codable>(type: T.Type) throws -> (T, Data) {
        let data = try Data(contentsOf: self.url)
        let response = try JSONDecoder().decode(T.self, from: data)
        return (response, data)
    }
}
