//
//  ImagesApi+Combine.swift
//  
//
//  Created by admin on 10/03/23.
//

import Foundation
import Combine

extension ImagesApi {
    @available(swift 5.5)
    @available(macOS 10.15, iOS 13, watchOS 6, tvOS 13, *)
    /// Creates an image given a prompt.
    ///
    /// - Parameters:
    ///   - prompt: String
    ///
    /// - Returns: Future ``Images``
    public func createImageFuture(
        prompt: String,
        n: Int = 1,
        size: ImageSize = .init(width: 256, height: 256),
        responseFormat: ResponseFormat? = .url,
        user: String? = nil
    ) -> Future<Images, Error> {
        Future<Images, Error> { promise in
            self.createImage(
                prompt: prompt,
                n: n,
                size: size,
                user: user
            ) { result in
                promise(result)
            }
        }
    }
}
