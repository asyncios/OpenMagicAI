//
//  ImagesApiRequests.swift
//  OpenMagicAI
//
//  Created by admin on 6/03/23.
//

import Foundation

extension ImagesApi {

    struct CreateImage: Encodable {
        let prompt: String
        let n: Int
        let size: String
        let responseFormat: ImagesResponseFormat?
        let user: String?
        init(
            prompt: String,
            n: Int,
            size: ImageSize,
            responseFormat: ImagesResponseFormat?,
            user: String?
        ) {
            self.prompt = prompt
            self.n = n
            self.size = size.rawValue
            self.responseFormat = responseFormat
            self.user = user
        }
        enum CodingKeys: String, CodingKey {
            case prompt
            case n
            case size
            case responseFormat = "response_format"
            case user
        }
    }
}
