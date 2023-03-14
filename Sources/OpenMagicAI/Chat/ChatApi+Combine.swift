//
//  ChatApi+Combine.swift
//  
//
//  Created by admin on 10/03/23.
//

import Foundation
import Combine

extension ChatApi {
    @available(swift 5.5)
    @available(macOS 10.15, iOS 13, watchOS 6, tvOS 13, *)
    /// Creates a completion for the chat message.
    ///
    /// - Parameters:
    ///   - model: String
    ///   - messages: array of message
    ///
    /// - Returns: Future ``ChatCompletionsCreated``
    public func createChatCompletionFuture(
        model: ChatCompletion.Model = .gpt35Turbo,
        messages: [ChatCompletion.Message],
        temperature: Int? = 1,
        topP: Int? = 1,
        n: Int? = 1,
        stream: Bool? = false,
        stop: [String]? = nil,
        maxTokens: Int? = 2000,
        presencePenalty: Int? = 0,
        frequencyPenalty: Int? = 0,
        user: String? = nil
    ) -> Future<ChatCompletionsCreated, Error> {
        Future<ChatCompletionsCreated, Error> { promise in
            self.createChatCompletion(
                model: model,
                messages: messages,
                temperature: temperature,
                topP: topP,
                n: n,
                stream: stream,
                stop: stop,
                maxTokens: maxTokens,
                presencePenalty: presencePenalty,
                frequencyPenalty: frequencyPenalty,
                user: user
            ) { result in
                promise(result)
            }
        }
    }
}
