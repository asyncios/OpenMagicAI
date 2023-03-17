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
    ///   - model: ``CreateEditModel`` enum
    ///   - input: String?
    ///   - instruction: String
    ///   - onCompletion: ``EditsCreated``
    public func createEdit(
        model: CreateEditModel = .textDavinciEdit001,
        input: String = "",
        instruction: String,
        n: Int? = 1,
        temperature: Int? = 1,
        topP: Int? = 1,
        onCompletion: @escaping (Result<EditsCreated, Error>) -> Void
    ) {
        if instruction.isEmpty {
            onCompletion(.failure(OpenMagicAI.OMError.missingRequiredInput))
            return
        }
        let parameters = CreateEdit.Parameters(
            model: model.rawValue,
            input: input,
            instruction: instruction,
            n: n,
            temperature: temperature,
            topP: topP
        )
        dataTask(urlSession: urlSession, endPoint: .edits(.createEdit), apiKey: apiKey, parameters: parameters, onCompletion: onCompletion)
    }
}
