//
//  ModelsApi+Async.swift
//  Demo2OpenAI
//
//  Created by admin on 7/03/23.
//

import Foundation

extension ModelsApi {
    @available(swift 5.5)
    @available(macOS 10.15, iOS 13, watchOS 6, tvOS 13, *)
    public func listModels() async throws -> OpenMagic.ListModels {
        return try await withCheckedThrowingContinuation { continuation in
            listModels { result in
                continuation.resume(with: result)
            }
        }
    }
}
