//
//  EmbeddingsApi.swift
//  
//
//  Created by admin on 14/03/23.
//

import Foundation

final class EmbeddingsApi: ApiQueryable {
    private let apiKey: String
    private let urlSession: URLSession
    init(apiKey: String, urlSession: URLSession = .shared) {
        self.apiKey = apiKey
        self.urlSession = urlSession
    }

    func createEmbeddings(
        model: OpenMagicModel.Embeddings = .textEmbeddingAda002,
        input: String,
        user: String? = nil,
        onCompletion: @escaping (Result<EmbeddingsCreated, Error>) -> Void
    ) {
        let parameters = CreateEmbeddings.Parameters(
            model: model.rawValue,
            input: input,
            user: user
        )
        openAiDataTask(urlSession: urlSession, endPoint: .embeddings(.createEmbeddings), apiKey: apiKey, parameters: parameters, onCompletion: onCompletion)
    }
}
