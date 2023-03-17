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
    init(apiKey: String, urlSession: URLSession = .shared) {
        self.apiKey = apiKey
        self.urlSession = urlSession
    }

    /// Creates a completion for the provided prompt and parameters
    ///
    /// - Parameters:
    ///   - model: ``CreateCompletionModel`` enum
    ///   - prompt: String or Array of strings ``StringOrArray``
    ///   - onCompletion: ``CompletionsCreated``
    public func createCompletion(
        model: CreateCompletionModel = .textDavinci003,
        prompt: StringOrArray,
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
        onCompletion: @escaping (Result<CompletionsCreated, Error>) -> Void
    ) {
        if prompt.isEmpty {
            onCompletion(.failure(OpenMagicAI.OMError.missingRequiredInput))
            return
        }
        let parameters = CreateCompletion.Parameters(
            model: model.rawValue,
            prompt: prompt.toArray(),
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
        dataTask(urlSession: urlSession, endPoint: .completions(.createCompletion), apiKey: apiKey, parameters: parameters, onCompletion: onCompletion)
    }

}
