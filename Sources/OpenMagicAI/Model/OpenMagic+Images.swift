//
//  OpenMagic+Images.swift
//  OpenMagicAI
//
//  Created by admin on 6/03/23.
//

import Foundation

extension OpenMagic {

    public struct Images: Codable {
        let created: Int
        let data: [Photo]
    }

}

extension OpenMagic.Images {

    public struct Photo: Codable {
        let url: String
    }

}
