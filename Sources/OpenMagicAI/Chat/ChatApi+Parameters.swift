//
//  ChatApi+Parameters.swift
//  
//
//  Created by admin on 9/03/23.
//

import Foundation

extension ChatApi {
    enum CreateChatCompletion {
        struct Parameters: Encodable {
            let model: String
            let messages: [ChatMessage]
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
