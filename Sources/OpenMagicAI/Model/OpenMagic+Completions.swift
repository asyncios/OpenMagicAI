//
//  OpenMagic+Completions.swift
//  OpenMagicAI
//
//  Created by admin on 6/03/23.
//

import Foundation

extension OpenMagic {

    public struct Completions: Codable {
        public let object: String
        public let model: String
        public let choices: [Choice]
    }

    public struct ChatCompletions: Codable {
        let id: String
        let object: String
        let created: Int
        let choices: [Choice]
        let usage: Usage
    }

}

extension OpenMagic.Completions {

    public struct Choice: Codable {
        public let text: String
    }

}

extension OpenMagic.ChatCompletions {

    public struct Choice: Codable {
        let index: Int
        let message: Message
        let finishReason: String
        enum CodingKeys: String, CodingKey {
            case index, message
            case finishReason = "finish_reason"
        }
    }

    public struct Message: Codable {
        let role: String
        let content: String
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
