//
//  ModelsApi.swift
//  Demo2OpenAI
//
//  Created by admin on 7/03/23.
//

import Foundation

public final class ModelsApi: ApiQueryable {

    private let apiKey: String
    private let urlSession: URLSession
    init(apiKey: String) {
        self.apiKey = apiKey
        self.urlSession = .shared
    }

    public func listModels(
        onCompletion: @escaping (Result<OpenMagic.ListModels, Error>) -> Void
    ) {
        openAiDataTask(urlSession: urlSession, endPoint: .models(.listModels), apiKey: apiKey, onCompletion: onCompletion)
    }
}
