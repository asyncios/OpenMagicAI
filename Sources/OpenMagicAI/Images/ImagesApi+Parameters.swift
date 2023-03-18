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

    struct CreateImageEdit: Encodable, TextFormFieldRequestable {
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
        var textFormFields: [(String, String)] {
            var result = [
                (CodingKeys.prompt.rawValue, prompt),
                (CodingKeys.n.rawValue, String(n)),
                (CodingKeys.size.rawValue, size)
            ]
            if let responseFormat = responseFormat {
                result.append((CodingKeys.responseFormat.rawValue, responseFormat.rawValue))
            }
            if let user = user {
                result.append((CodingKeys.user.rawValue, user))
            }
            return result
        }
    }
}
