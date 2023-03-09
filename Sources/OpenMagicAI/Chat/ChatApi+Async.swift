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
    func chatCompletion(
        model: ChatCompletion.Model = .gpt35Turbo,
        messages: [ChatCompletion.Message],
        temperature: Int? = 1,
        topP: Int? = 1,
        n: Int? = 1,
        stream: Bool? = false,
        stop: [String]? = nil,
        maxTokens: Int? = 4096,
        presencePenalty: Int? = 0,
        frequencyPenalty: Int? = 0,
        user: String? = nil
    ) async throws -> ChatCompletions {
        return try await withCheckedThrowingContinuation { continuation in
            chatCompletion(
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
