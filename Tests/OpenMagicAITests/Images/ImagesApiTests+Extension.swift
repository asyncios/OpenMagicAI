//
//  File.swift
//  
//
//  Created by admin on 8/03/23.
//

import Foundation
@testable import OpenMagicAI

extension ImagesApiTests {
    func getGenerationsMock() throws -> (OpenMagic.Images, Data) {
        let response = OpenMagic.Images(created: 0, data: [])
        let data = try JSONEncoder().encode(response)
        return (response, data)
    }
}
