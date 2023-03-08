//
//  CompletionsApi+Async.swift
//  OpenMagicAI
//
//  Created by admin on 6/03/23.
//

import Foundation

extension CompletionsApi {
    @available(swift 5.5)
    @available(macOS 10.15, iOS 13, watchOS 6, tvOS 13, *)
    public func createCompletion(
        model: OpenMagicModel = .chatGPT35(.textDavinci003),
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
    ) async throws -> OpenMagic.Completions {
        return try await withCheckedThrowingContinuation { continuation in
            createCompletion(
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
                continuation.resume(with: result)
            }
        }
    }

    @available(swift 5.5)
    @available(macOS 10.15, iOS 13, watchOS 6, tvOS 13, *)
    func chatCompletion(
        model: ChatCompletion.Model = .gpt35Turbo,
        messages: [ChatCompletion.Message],
        temperature: Int? = 1,
        topP: Int? = 1,
        n: Int? = 1,
        stream: Bool? = false,
        maxTokens: Int? = 4096,
        stop: [String]? = nil,
        presencePenalty: Int? = 0,
        frequencyPenalty: Int? = 0,
        bestOf: Int? = 1,
        user: String? = nil
    ) async throws -> OpenMagic.ChatCompletions {
        return try await withCheckedThrowingContinuation { continuation in
            chatCompletion(
                model: model,
                messages: messages,
                temperature: temperature,
                topP: topP,
                n: n,
                stream: stream,
                maxTokens: maxTokens,
                stop: stop,
                presencePenalty: presencePenalty,
                frequencyPenalty: frequencyPenalty,
                bestOf: bestOf,
                user: user
            ) { result in
                continuation.resume(with: result)
            }
        }
    }
}
