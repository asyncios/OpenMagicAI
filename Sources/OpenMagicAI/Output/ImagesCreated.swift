//
//  ImagesCreated.swift
//  OpenMagicAI
//
//  Created by admin on 6/03/23.
//

import Foundation

public struct ImagesCreated: Codable {
    public let created: Int
    public let data: [Photo]
}

extension ImagesCreated {

    public struct Photo: Codable {
        public let url: String
    }

}
