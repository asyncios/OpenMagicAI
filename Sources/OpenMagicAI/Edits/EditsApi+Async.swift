//
//  EditsApi+Async.swift
//  OpenMagicAI
//
//  Created by admin on 6/03/23.
//

import Foundation

extension EditsApi {
    @available(swift 5.5)
    @available(macOS 10.15, iOS 13, watchOS 6, tvOS 13, *)
    /// Creates a new edit for the provided input, instruction, and parameters.
    ///
    /// - Parameters:
    ///   - model: ``CreateEditModel`` enum
    ///   - input: String?
    ///   - instruction: String
    ///
    /// - Returns: Async ``EditsCreated``
    public func createEdit(
        model: CreateEditModel = .textDavinciEdit001,
        input: String = "",
        instruction: String,
        n: Int? = 1,
        temperature: Int? = 1,
        topP: Int? = 1
    ) async throws -> EditsCreated {
        return try await withCheckedThrowingContinuation { continuation in
            createEdit(
                model: model,
                input: input,
                instruction: instruction,
                n: n,
                temperature: temperature,
                topP: topP
            ) { result in
                continuation.resume(with: result)
            }
        }
    }
}
