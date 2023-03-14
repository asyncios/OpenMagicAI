//
//  EmbeddingsApi+Parameters.swift
//  
//
//  Created by admin on 14/03/23.
//

import Foundation

extension EmbeddingsApi {
    enum CreateEmbeddings {
        struct Parameters: Encodable {
            let model: String
            let input: String
            let user: String?
            init(model: String, input: String, user: String?) {
                self.model = model
                self.input = input
                self.user = user
            }
        }
    }
}
