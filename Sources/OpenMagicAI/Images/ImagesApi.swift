//
//  ImagesApi.swift
//  OpenMagicAI
//
//  Created by admin on 6/03/23.
//

import Foundation

public final class ImagesApi: ApiQueryable {

    private let apiKey: String
    private let urlSession: URLSession
    init(apiKey: String, urlSession: URLSession = .shared) {
        self.apiKey = apiKey
        self.urlSession = urlSession
    }

    /// Creates an image given a prompt.
    ///
    /// - Parameters:
    ///   - prompt: String
    ///   - onCompletion: ``ImagesCreated``
    public func createImage(
        prompt: String,
        n: Int = 1,
        size: ImageSize = .init(width: 256, height: 256),
        responseFormat: ImagesResponseFormat? = .url,
        user: String? = nil,
        onCompletion: @escaping (Result<ImagesCreated, Error>) -> Void
    ) {
        let parameters = CreateImage(
            prompt: prompt,
            n: n,
            size: size,
            responseFormat: responseFormat,
            user: user
        )
        openAiDataTask(urlSession: urlSession, endPoint: .images(.createEdit), apiKey: apiKey, parameters: parameters, onCompletion: onCompletion)
    }

}
