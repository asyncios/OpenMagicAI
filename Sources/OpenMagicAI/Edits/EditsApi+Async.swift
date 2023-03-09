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
    public func createEdit(
        model: CreateEdit.Model = .textDavinciEdit001,
        input: String = "",
        instruction: String,
        n: Int? = 1,
        temperature: Int? = 1,
        topP: Int? = 1
    ) async throws -> Edits {
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
