//
//  EmbeddingsApi.swift
//  
//
//  Created by admin on 14/03/23.
//

import Foundation

public final class EmbeddingsApi: ApiQueryable {
    private let apiKey: String
    private let urlSession: URLSession
    init(apiKey: String, urlSession: URLSession = .shared) {
        self.apiKey = apiKey
        self.urlSession = urlSession
    }

    /// Creates an embedding vector representing the input text.
    ///
    /// - Parameters:
    ///   - model: ``CreateEmbeddingsModel`` enum
    ///   - input: String
    ///   - user: String?
    ///   - onCompletion: ``EmbeddingsCreated``
    public func createEmbeddings(
        model: CreateEmbeddingsModel = .textEmbeddingAda002,
        input: String,
        user: String? = nil,
        onCompletion: @escaping (Result<EmbeddingsCreated, Error>) -> Void
    ) {
        if input.isEmpty {
            onCompletion(.failure(OpenMagicAI.OMError.missingRequiredInput))
            return
        }
        let parameters = CreateEmbeddings.Parameters(
            model: model.rawValue,
            input: input,
            user: user
        )
        openAiDataTask(urlSession: urlSession, endPoint: .embeddings(.createEmbeddings), apiKey: apiKey, parameters: parameters, onCompletion: onCompletion)
    }
}
