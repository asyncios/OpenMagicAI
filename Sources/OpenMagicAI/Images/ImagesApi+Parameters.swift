//
//  ImagesApiRequests.swift
//  OpenMagicAI
//
//  Created by admin on 6/03/23.
//

import Foundation

extension ImagesApi {

    public enum ResponseFormat: String, Encodable {
        case url
        case b64json = "b64_json"
    }

    struct CreateImage: Encodable {
        let prompt: String
        let n: Int
        let size: String
        let responseFormat: ResponseFormat?
        let user: String?
        init(
            prompt: String,
            n: Int,
            size: ImageSize,
            responseFormat: ResponseFormat?,
            user: String?
        ) {
            self.prompt = prompt
            self.n = n
            self.size = "\(size.width)x\(size.height)"
            self.responseFormat = responseFormat
            self.user = user
        }
    }
}
