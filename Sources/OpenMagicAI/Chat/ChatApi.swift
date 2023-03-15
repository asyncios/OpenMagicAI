//
//  ChatApi.swift
//  
//
//  Created by admin on 9/03/23.
//

import Foundation

public final class ChatApi: ApiQueryable {

    private let apiKey: String
    private let urlSession: URLSession
    init(apiKey: String, urlSession: URLSession = .shared) {
        self.apiKey = apiKey
        self.urlSession = urlSession
    }

    /// Creates a completion for the chat message.
    ///
    /// - Parameters:
    ///   - model: String
    ///   - messages: array of message
    ///   - onCompletion: ``ChatCompletionsCreated``
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
        user: String? = nil,
        onCompletion: @escaping (Result<ChatCompletionsCreated, Error>) -> Void
    ) {
        let parameters = CreateChatCompletion.Parameters(
            model: model.rawValue,
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
        )
        openAiDataTask(urlSession: urlSession, endPoint: .chat(.createChatCompletion), apiKey: apiKey, parameters: parameters, onCompletion: onCompletion)
    }
}
