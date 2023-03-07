//
//  OpenMagic+Images.swift
//  Demo2OpenAI
//
//  Created by admin on 6/03/23.
//

import Foundation

extension OpenMagic {

    public struct Images: Decodable {
        let created: Int
        let data: [Photo]
    }

}

extension OpenMagic.Images {

    public struct Photo: Decodable {
        let url: String
    }

}
