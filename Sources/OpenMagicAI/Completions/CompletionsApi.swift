//
//  CompletionsApi.swift
//  OpenMagicAI
//
//  Created by admin on 6/03/23.
//

import Foundation

public final class CompletionsApi: ApiQueryable {
    private let apiKey: String
    private let urlSession: URLSession
    init(apiKey: String) {
        self.apiKey = apiKey
        self.urlSession = .shared
    }

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
        user: String? = nil,
        onCompletion: @escaping (Result<OpenMagic.Completions, Error>) -> Void
    ) {
        let parameters = CreateCompletion.Parameters(
            model: model.rawValue,
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
        )
        openAiDataTask(urlSession: urlSession, endPoint: .completions(.createCompletion), apiKey: apiKey, parameters: parameters, onCompletion: onCompletion)
    }

    public func chatCompletion(
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
        user: String? = nil,
        onCompletion: @escaping (Result<OpenMagic.ChatCompletions, Error>) -> Void
    ) {
        let parameters = ChatCompletion.Parameters(
            model: model.rawValue,
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
        )
        openAiDataTask(urlSession: urlSession, endPoint: .completions(.chatCompletion), apiKey: apiKey, parameters: parameters, onCompletion: onCompletion)
    }
}
