//
//  ChatApi+Parameters.swift
//  
//
//  Created by admin on 9/03/23.
//

import Foundation

extension ChatApi {
    public enum ChatCompletion {
        public enum Model: String {
            case gpt35Turbo = "gpt-3.5-turbo"
            case gpt35Turbo0301 = "gpt-3.5-turbo-0301"
        }
        public struct Message: Codable {
            public let role: Role
            public let content: String
            public enum Role: String, Codable {
                case system
                case user
                case assistant
            }
            public init(role: Role, content: String) {
                self.role = role
                self.content = content
            }
        }
        struct Parameters: Encodable {
            let model: String
            let messages: [Message]
            let temperature: Int?
            let topP: Int?
            let n: Int?
            let stream: Bool?
            let stop: [String]?
            let maxTokens: Int?
            let presencePenalty: Int?
            let frequencyPenalty: Int?
            let user: String?
            enum CodingKeys: String, CodingKey {
                case model
                case messages
                case temperature
                case topP = "top_p"
                case n
                case stream
                case maxTokens = "max_tokens"
                case stop
                case presencePenalty = "presence_penalty"
                case frequencyPenalty = "frequency_penalty"
                case user
            }
        }
    }
}
