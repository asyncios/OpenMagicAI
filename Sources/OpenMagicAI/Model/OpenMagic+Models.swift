//
//  OpenMagic+Models.swift
//  Demo2OpenAI
//
//  Created by admin on 7/03/23.
//

import Foundation


extension OpenMagic {

    public struct ListModels: Codable {
        let data: [Model]
        let object: String
    }

    public struct Model: Codable {
        let id: String
        let object: String
        let ownedBy: String

        enum CodingKeys: String, CodingKey {
            case id, object
            case ownedBy = "owned_by"
        }
    }

}
