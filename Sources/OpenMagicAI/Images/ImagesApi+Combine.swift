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
    /// - Returns: Future ``ImagesCreated``
    public func createImageFuture(
        prompt: String,
        n: Int = 1,
        size: ImageSize = .large,
        responseFormat: ImagesResponseFormat? = .url,
        user: String? = nil
    ) -> Future<ImagesCreated, Error> {
        Future<ImagesCreated, Error> { promise in
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

    @available(swift 5.5)
    @available(macOS 10.15, iOS 13, watchOS 6, tvOS 13, *)
    /// Creates an edited or extended image given an original image and a prompt.
    ///
    /// - Parameters:
    ///   - image: Data
    ///   - mask: Data
    ///   - prompt: String
    ///
    /// - Returns: Future ``ImagesCreated``
    public func createImageEdit(
        image: Data,
        mask: Data?,
        prompt: String,
        n: Int = 1,
        size: ImageSize = .large,
        responseFormat: ImagesResponseFormat? = .url,
        user: String? = nil
    ) -> Future<ImagesCreated, Error> {
        Future<ImagesCreated, Error> { promise in
            self.createImageEdit(
                image: image,
                mask: mask,
                prompt: prompt,
                n: n,
                size: size,
                responseFormat: responseFormat,
                user: user
            ) { result in
                promise(result)
            }
        }
    }
}
