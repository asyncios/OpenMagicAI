//
//  CompletionsApiRequests.swift
//  Demo2OpenAI
//
//  Created by admin on 6/03/23.
//

import Foundation

extension CompletionsApi {
    enum CreateCompletion {
        struct Parameters: Encodable {
            let model: String
            let prompt: String
            let suffix: String?
            let maxTokens: Int?
            let temperature: Int?
            let topP: Int?
            let n: Int?
            let stream: Bool?
            let logprobs: Int?
            let echo: Bool?
            let stop: [String]?
            let presencePenalty: Int?
            let frequencyPenalty: Int?
            let bestOf: Int?
    //        let logitBias
            let user: String?
            enum CodingKeys: String, CodingKey {
                case model
                case prompt
                case suffix
                case maxTokens = "max_tokens"
                case temperature
                case topP = "top_p"
                case n
                case stream
                case logprobs
                case echo
                case stop
                case presencePenalty = "presence_penalty"
                case frequencyPenalty = "frequency_penalty"
                case bestOf = "best_of"
                case user
            }
        }
    }
    public enum ChatCompletion {
        public enum Model: String {
            case gpt35Turbo = "gpt-3.5-turbo"
            case gpt35Turbo0301 = "gpt-3.5-turbo-0301"
        }
        public struct Message: Codable {
            let role: Role
            let content: String
            enum Role: String, Codable {
                case system
                case user
                case assistant
            }
        }
        struct Parameters: Encodable {
            let model: String
            let messages: [Message]
            let temperature: Int?
            let topP: Int?
            let n: Int?
            let stream: Bool?
            let maxTokens: Int?
            let stop: [String]?
            let presencePenalty: Int?
            let frequencyPenalty: Int?
            let bestOf: Int?
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
                case bestOf = "best_of"
                case user
            }
        }
    }
}
