//
//  ChatApi+Async.swift
//  
//
//  Created by admin on 9/03/23.
//

import Foundation

extension ChatApi {

    @available(swift 5.5)
    @available(macOS 10.15, iOS 13, watchOS 6, tvOS 13, *)
    /// Creates a completion for the chat message.
    ///
    /// - Parameters:
    ///   - model: String
    ///   - messages: array of message
    ///
    /// - Returns: Async ``ChatCompletionsCreated``
    public func createChatCompletion(
        model: CreateChatCompletionModel = .gpt35Turbo,
        messages: [ChatMessage],
        temperature: Int? = 1,
        topP: Int? = 1,
        n: Int? = 1,
        stream: Bool? = false,
        stop: [String]? = nil,
        maxTokens: Int? = 2000,
        presencePenalty: Int? = 0,
        frequencyPenalty: Int? = 0,
        user: String? = nil
    ) async throws -> ChatCompletionsCreated {
        return try await withCheckedThrowingContinuation { continuation in
            createChatCompletion(
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
                continuation.resume(with: result)
            }
        }
    }

}
