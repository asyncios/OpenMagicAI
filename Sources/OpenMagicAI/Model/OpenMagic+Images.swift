//
//  OpenMagic+Images.swift
//  OpenMagicAI
//
//  Created by admin on 6/03/23.
//

import Foundation

extension OpenMagic {

    public struct Images: Codable {
        public let created: Int
        public let data: [Photo]
    }

}

extension OpenMagic.Images {

    public struct Photo: Codable {
        public let url: String
    }

}
