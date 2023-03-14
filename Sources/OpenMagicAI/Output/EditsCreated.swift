//
//  EditsCreated.swift
//  OpenMagicAI
//
//  Created by admin on 6/03/23.
//

import Foundation

public struct EditsCreated: Codable {
    public let object: String
    public let created: Int
    public let choices: [Choice]
    public let usage: Usage
}

extension EditsCreated {

    public struct Choice: Codable {
        public let text: String
        public let index: Int
    }

    public struct Usage: Codable {
        public let promptTokens: Int
        public let completionTokens: Int
        public let totalTokens: Int

        enum CodingKeys: String, CodingKey {
            case promptTokens = "prompt_tokens"
            case completionTokens = "completion_tokens"
            case totalTokens = "total_tokens"
        }
    }

}
