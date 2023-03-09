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

    public func createImage(
        prompt: String,
        n: Int = 1,
        size: ImageSize = .init(width: 256, height: 256),
        onCompletion: @escaping (Result<OpenMagic.Images, Error>) -> Void
    ) {
        let parameters = Generations(prompt: prompt, n: n, size: size)
        openAiDataTask(urlSession: urlSession, endPoint: .images(.createEdit), apiKey: apiKey, parameters: parameters, onCompletion: onCompletion)
    }

}
