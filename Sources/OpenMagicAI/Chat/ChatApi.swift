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
        onCompletion: @escaping (Result<ChatCompletions, Error>) -> Void
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
