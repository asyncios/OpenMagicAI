//
//  OpenMagic+Edits.swift
//  OpenMagicAI
//
//  Created by admin on 6/03/23.
//

import Foundation

extension OpenMagic {
    public struct Edits: Decodable {
        let object: String
        let created: Int
        let choices: [Choice]
        let usage: Usage
    }
}

extension OpenMagic.Edits {

    public struct Choice: Codable {
        let text: String
        let index: Int
    }

    public struct Usage: Codable {
        let promptTokens: Int
        let completionTokens: Int
        let totalTokens: Int

        enum CodingKeys: String, CodingKey {
            case promptTokens = "prompt_tokens"
            case completionTokens = "completion_tokens"
            case totalTokens = "total_tokens"
        }
    }

}
