//
//  CompletionsApi+Parameters.swift
//  OpenMagicAI
//
//  Created by admin on 6/03/23.
//

import Foundation

extension CompletionsApi {
    enum CreateCompletion {
        struct Parameters: Encodable {
            let model: String
            let prompt: [String]
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
}
