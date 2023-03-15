//
//  CompletionsApi+Combine.swift
//  
//
//  Created by admin on 10/03/23.
//

import Foundation
import Combine

extension CompletionsApi {
    @available(swift 5.5)
    @available(macOS 10.15, iOS 13, watchOS 6, tvOS 13, *)
    /// Creates a completion for the provided prompt and parameters
    ///
    /// - Parameters:
    ///   - model: ``CreateCompletionModel`` enum
    ///   - prompt: String
    ///
    /// - Returns: Future ``CompletionsCreated``
    public func createCompletion(
        model: CreateCompletionModel = .textDavinci003,
        prompt: String,
        suffix: String? = nil,
        maxTokens: Int? = 16,
        temperature: Int? = 1,
        topP: Int? = 1,
        n: Int? = 1,
        stream: Bool? = false,
        logprobs: Int? = nil,
        echo: Bool? = false,
        stop: [String]? = nil,
        presencePenalty: Int? = 0,
        frequencyPenalty: Int? = 0,
        bestOf: Int? = 1,
        user: String? = nil
    ) -> Future<CompletionsCreated, Error> {
        Future<CompletionsCreated, Error> { promise in
            self.createCompletion(
                model: model,
                prompt: prompt,
                suffix: suffix,
                maxTokens: maxTokens,
                temperature: temperature,
                topP: topP,
                n: n,
                stream: stream,
                logprobs: logprobs,
                echo: echo,
                stop: stop,
                presencePenalty: presencePenalty,
                frequencyPenalty: frequencyPenalty,
                bestOf: bestOf,
                user: user
            ) { result in
                promise(result)
            }
        }
    }
}
