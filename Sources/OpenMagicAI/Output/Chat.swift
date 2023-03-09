//
//  Chat.swift
//  
//
//  Created by admin on 9/03/23.
//

import Foundation

public struct ChatCompletions: Codable {
    public let id: String
    public let object: String
    public let created: Int
    public let choices: [Choice]
    public let usage: Usage
}

extension ChatCompletions {

    public struct Choice: Codable {
        public let index: Int
        public let message: Message
        public let finishReason: String
        enum CodingKeys: String, CodingKey {
            case index, message
            case finishReason = "finish_reason"
        }
    }

    public struct Message: Codable {
        public let role: String
        public let content: String
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
