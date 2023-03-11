//
//  EditsApi.swift
//  OpenMagicAI
//
//  Created by admin on 6/03/23.
//

import Foundation

public final class EditsApi: ApiQueryable {
    private let apiKey: String
    private let urlSession: URLSession
    init(apiKey: String, urlSession: URLSession = .shared) {
        self.apiKey = apiKey
        self.urlSession = urlSession
    }

    /// Creates a new edit for the provided input, instruction, and parameters.
    ///
    /// - Parameters:
    ///   - model: String
    ///   - input: String (optional)
    ///   - instruction: String
    ///   - onCompletion: ``Edits``
    public func createEdit(
        model: CreateEdit.Model = .textDavinciEdit001,
        input: String = "",
        instruction: String,
        n: Int? = 1,
        temperature: Int? = 1,
        topP: Int? = 1,
        onCompletion: @escaping (Result<Edits, Error>) -> Void
    ) {
        let parameters = CreateEdit.Parameters(
            model: model.rawValue,
            input: input,
            instruction: instruction,
            n: n,
            temperature: temperature,
            topP: topP
        )
        openAiDataTask(urlSession: urlSession, endPoint: .edits(.createEdit), apiKey: apiKey, parameters: parameters, onCompletion: onCompletion)
    }
}
