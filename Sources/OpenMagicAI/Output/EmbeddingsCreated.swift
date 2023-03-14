//
//  EmbeddingsCreated.swift
//  
//
//  Created by admin on 14/03/23.
//

import Foundation

public struct EmbeddingsCreated: Codable {
    public let object: String
    public let data: [Datum]
    public let model: String
    public let usage: Usage
}

extension EmbeddingsCreated {
    public struct Datum: Codable {
        public let object: String
        public let embedding: [Double]
        public let index: Int
    }

    public struct Usage: Codable {
        public let promptTokens: Int
        public let totalTokens: Int

        enum CodingKeys: String, CodingKey {
            case promptTokens = "prompt_tokens"
            case totalTokens = "total_tokens"
        }
    }
}

