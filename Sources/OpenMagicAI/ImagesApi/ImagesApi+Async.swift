//
//  ImagesApi+Async.swift
//  Demo2OpenAI
//
//  Created by admin on 6/03/23.
//

import Foundation

extension ImagesApi {
    @available(swift 5.5)
    @available(macOS 10.15, iOS 13, watchOS 6, tvOS 13, *)
    public func generations(
        prompt: String,
        n: Int = 1,
        size: ImageSize = .init(width: 256, height: 256)
    ) async throws -> OpenMagic.Images {
        return try await withCheckedThrowingContinuation { continuation in
            generations(prompt: prompt, n: n, size: size) { result in
                continuation.resume(with: result)
            }
        }
    }
}
