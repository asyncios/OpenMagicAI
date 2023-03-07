//
//  ImagesApiRequests.swift
//  Demo2OpenAI
//
//  Created by admin on 6/03/23.
//

import Foundation

extension ImagesApi {
    struct Generations: Encodable {
        let prompt: String
        let n: Int
        let size: String
        init(prompt: String, n: Int, size: ImageSize) {
            self.prompt = prompt
            self.n = n
            self.size = "\(size.width)x\(size.height)"
        }
    }
}
