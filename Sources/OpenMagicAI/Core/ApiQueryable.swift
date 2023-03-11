//
//  ApiRequestable.swift
//  OpenMagicAI
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
        do {
            var request = try prepareRequest(endPoint: endPoint, apiKey: apiKey)
            if let value = try? JSONEncoder().encode(parameters) {
                request.httpBody = value
            }
            openAiRequestDataTask(urlSession: urlSession, request: request, onCompletion: onCompletion)
        } catch {
            onCompletion(.failure(error))
        }
    }

    func openAiDataTask<D: Decodable>(
        urlSession: URLSession,
        endPoint: EndPoint,
        apiKey: String,
        onCompletion: @escaping (Result<D, Error>) -> Void
    ) {
        do {
            let request = try prepareRequest(endPoint: endPoint, apiKey: apiKey)
            openAiRequestDataTask(urlSession: urlSession, request: request, onCompletion: onCompletion)
        } catch {
            onCompletion(.failure(error))
        }
    }

}

private extension ApiQueryable {

    func prepareRequest(endPoint: EndPoint, apiKey: String) throws -> URLRequest {
        if apiKey.isEmpty {
            throw OpenMagicAI.OMError.noApiKey
        }
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
                onCompletion(.failure(OpenMagicAI.OMError.decodingError(response: nil)))
                return
            }
            do {
                let response = try JSONDecoder().decode(D.self, from: data)
                onCompletion(.success(response))
            } catch {
                let response = try? JSONSerialization.jsonObject(with: data) as? [String: Any]
                onCompletion(.failure(OpenMagicAI.OMError.decodingError(response: response)))
            }
        }.resume()
    }
}
