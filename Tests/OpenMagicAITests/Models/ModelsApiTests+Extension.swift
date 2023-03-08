//
//  ModelsApiTests+Extension.swift
//  
//
//  Created by admin on 8/03/23.
//

import Foundation
@testable import OpenMagicAI

extension ModelsApiTests {
    func getListModelsMock() throws -> (OpenMagic.ListModels, Data) {
        let response = OpenMagic.ListModels(data: [], object: "1")
        let data = try JSONEncoder().encode(response)
        return (response, data)
    }
}
