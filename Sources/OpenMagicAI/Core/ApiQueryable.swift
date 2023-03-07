//
//  ApiRequestable.swift
//  Demo2OpenAI
//
//  Created by admin on 6/03/23.
//

import Foundation

protocol ApiQueryable {
}

extension ApiQueryable {

    func openAiDataTask<E: Encodable, D: Decodable>(
        urlSession: URLSession,
        endPoint: EndPoint,
        apiKey: String,
        parameters: E,
        onCompletion: @escaping (Result<D, Error>) -> Void
    ) {
        var request = prepareRequest(endPoint: endPoint, apiKey: apiKey)
        if let value = try? JSONEncoder().encode(parameters) {
            request.httpBody = value
        }
        openAiRequestDataTask(urlSession: urlSession, request: request, onCompletion: onCompletion)
    }

    func openAiDataTask<D: Decodable>(
        urlSession: URLSession,
        endPoint: EndPoint,
        apiKey: String,
        onCompletion: @escaping (Result<D, Error>) -> Void
    ) {
        let request = prepareRequest(endPoint: endPoint, apiKey: apiKey)
        openAiRequestDataTask(urlSession: urlSession, request: request, onCompletion: onCompletion)
    }

}

private extension ApiQueryable {

    func prepareRequest(endPoint: EndPoint, apiKey: String) -> URLRequest {
        var request = URLRequest(url: endPoint.url)
        request.setValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        if let value = endPoint.method {
            request.httpMethod = value
        }
        return request
    }

    func openAiRequestDataTask<D: Decodable>(
        urlSession: URLSession,
        request: URLRequest,
        onCompletion: @escaping (Result<D, Error>) -> Void
    ) {
        urlSession.dataTask(with: request) { data, _, error in
            if let error = error {
                onCompletion(.failure(error))
                return
            }
            guard let data = data else {
                onCompletion(.failure(OpenMagicAI.OMError.decodingError))
                return
            }
            do {
                let response = try JSONDecoder().decode(D.self, from: data)
                onCompletion(.success(response))
            } catch {
                onCompletion(.failure(OpenMagicAI.OMError.decodingError))
            }
        }.resume()
    }
}
