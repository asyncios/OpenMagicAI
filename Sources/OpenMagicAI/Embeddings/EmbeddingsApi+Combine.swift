//
//  EmbeddingsApi+Combine.swift
//  
//
//  Created by admin on 14/03/23.
//

import Foundation
import Combine

extension EmbeddingsApi {
    @available(swift 5.5)
    @available(macOS 10.15, iOS 13, watchOS 6, tvOS 13, *)
    /// Creates an embedding vector representing the input text.
    ///
    /// - Parameters:
    ///   - model: ``CreateEmbeddingsModel`` enum
    ///   - input: String
    ///   - user: String?
    ///   
    /// - Returns: Future ``EmbeddingsCreated``
    public func createEmbeddings(
        model: CreateEmbeddingsModel = .textEmbeddingAda002,
        input: String,
        user: String? = nil
    ) -> Future<EmbeddingsCreated, Error> {
        Future<EmbeddingsCreated, Error> { promise in
            self.createEmbeddings(
                model: model,
                input: input,
                user: user
            ) { result in
                promise(result)
            }
        }
    }
}