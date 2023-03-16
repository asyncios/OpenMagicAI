//
//  ModelsApi+Async.swift
//  OpenMagicAI
//
//  Created by admin on 7/03/23.
//

import Foundation

extension ModelsApi {
    @available(swift 5.5)
    @available(macOS 10.15, iOS 13, watchOS 6, tvOS 13, *)
    /// Lists the currently available models, and provides basic information about each one such as the owner and availability.
    ///
    /// - Returns: Async ``ListModels``
    public func listModels() async throws -> ListModels {
        return try await withCheckedThrowingContinuation { continuation in
            listModels { result in
                continuation.resume(with: result)
            }
        }
    }

    @available(swift 5.5)
    @available(macOS 10.15, iOS 13, watchOS 6, tvOS 13, *)
    /// Retrieves a model instance, providing basic information about the model such as the owner and permissioning.
    ///
    /// - Parameters:
    ///   - model: String
    ///
    /// - Returns: Async ``Model``
    public func retreiveModel(model: String) async throws -> Model {
        return try await withCheckedThrowingContinuation { continuation in
            retreiveModel(model: model) { result in
                continuation.resume(with: result)
            }
        }
    }
}
