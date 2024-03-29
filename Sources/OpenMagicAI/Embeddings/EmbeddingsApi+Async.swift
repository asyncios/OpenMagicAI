//
//  EmbeddingsApi+Async.swift
//  
//
//  Created by admin on 14/03/23.
//

import Foundation

extension EmbeddingsApi {
    @available(swift 5.5)
    @available(macOS 10.15, iOS 13, watchOS 6, tvOS 13, *)
    /// Creates an embedding vector representing the input text.
    ///
    /// - Parameters:
    ///   - model: ``CreateEmbeddingsModel`` enum
    ///   - input: String or Array of strings ``StringOrArray``
    ///   - user: String?
    ///
    /// - Returns: Async ``EmbeddingsCreated``
    public func createEmbeddings(
        model: CreateEmbeddingsModel = .textEmbeddingAda002,
        input: StringOrArray,
        user: String? = nil
    ) async throws -> EmbeddingsCreated {
        return try await withCheckedThrowingContinuation { continuation in
            createEmbeddings(
                model: model,
                input: input,
                user: user
            ) { result in
                continuation.resume(with: result)
            }
        }
    }
}
