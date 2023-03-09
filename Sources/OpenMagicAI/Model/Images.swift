//
//  OpenMagic+Images.swift
//  OpenMagicAI
//
//  Created by admin on 6/03/23.
//

import Foundation

public struct Images: Codable {
    public let created: Int
    public let data: [Photo]
}

extension Images {

    public struct Photo: Codable {
        public let url: String
    }

}
