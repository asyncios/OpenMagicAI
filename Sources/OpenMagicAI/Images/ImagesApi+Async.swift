//
//  ImagesApi+Async.swift
//  OpenMagicAI
//
//  Created by admin on 6/03/23.
//

import Foundation

extension ImagesApi {
    @available(swift 5.5)
    @available(macOS 10.15, iOS 13, watchOS 6, tvOS 13, *)
    /// Creates an image given a prompt.
    ///
    /// - Parameters:
    ///   - prompt: String
    ///
    /// - Returns: Async ``ImagesCreated``
    public func createImage(
        prompt: String,
        n: Int = 1,
        size: ImageSize = .init(width: 256, height: 256),
        responseFormat: ImagesResponseFormat? = .url,
        user: String? = nil
    ) async throws -> ImagesCreated {
        return try await withCheckedThrowingContinuation { continuation in
            createImage(
                prompt: prompt,
                n: n,
                size: size,
                responseFormat: responseFormat,
                user: user
            ) { result in
                continuation.resume(with: result)
            }
        }
    }
}
