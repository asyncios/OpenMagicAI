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
        size: ImageSize = .large,
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

    @available(swift 5.5)
    @available(macOS 10.15, iOS 13, watchOS 6, tvOS 13, *)
    /// Creates an edited or extended image given an original image and a prompt.
    ///
    /// - Parameters:
    ///   - image: Data
    ///   - mask: Data
    ///   - prompt: String
    ///
    /// - Returns: Async ``ImagesCreated``
    public func createImageEdit(
        image: Data,
        mask: Data?,
        prompt: String,
        n: Int = 1,
        size: ImageSize = .large,
        responseFormat: ImagesResponseFormat? = .url,
        user: String? = nil
    ) async throws -> ImagesCreated {
        return try await withCheckedThrowingContinuation { continuation in
            createImageEdit(
                image: image,
                mask: mask,
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
