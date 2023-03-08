//
//  EditsApiTests+Extension.swift
//  
//
//  Created by admin on 8/03/23.
//

import Foundation
@testable import OpenMagicAI

extension EditsApiTests {
    func getCreateEditMock() throws -> (OpenMagic.Edits, Data) {
        let response = OpenMagic.Edits(
            object: "1",
            created: 0, choices: [],
            usage: .init(
                promptTokens: 0,
                completionTokens: 0,
                totalTokens: 0
            )
        )
        let data = try JSONEncoder().encode(response)
        return (response, data)
    }
}
