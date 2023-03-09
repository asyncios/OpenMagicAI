//
//  OpenMagic+Models.swift
//  OpenMagicAI
//
//  Created by admin on 7/03/23.
//

import Foundation


public struct ListModels: Codable {
    public let data: [Model]
    public let object: String
}

public struct Model: Codable {
    public let id: String
    public let object: String
    public let ownedBy: String

    enum CodingKeys: String, CodingKey {
        case id, object
        case ownedBy = "owned_by"
    }
}
