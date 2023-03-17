//
//  ModelsApi.swift
//  OpenMagicAI
//
//  Created by admin on 7/03/23.
//

import Foundation

public final class ModelsApi: ApiQueryable {

    private let apiKey: String
    private let urlSession: URLSession
    init(apiKey: String, urlSession: URLSession = .shared) {
        self.apiKey = apiKey
        self.urlSession = urlSession
    }

    /// Lists the currently available models, and provides basic information about each one such as the owner and availability.
    ///
    /// - Parameters:
    ///   - onCompletion: ``ListModels``
    public func listModels(
        onCompletion: @escaping (Result<ListModels, Error>) -> Void
    ) {
        dataTask(urlSession: urlSession, endPoint: .models(.listModels), apiKey: apiKey, onCompletion: onCompletion)
    }

    /// Retrieves a model instance, providing basic information about the model such as the owner and permissioning.
    ///
    /// - Parameters:
    ///   - model: String
    ///   - onCompletion: ``Model``
    public func retreiveModel(
        model: String,
        onCompletion: @escaping (Result<Model, Error>) -> Void
    ) {
        dataTask(urlSession: urlSession, endPoint: .models(.retreiveModel(model: model)), apiKey: apiKey, onCompletion: onCompletion)
    }
}
