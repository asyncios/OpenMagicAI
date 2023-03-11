//
//  ModelsApi+Combine.swift
//  
//
//  Created by admin on 10/03/23.
//

import Foundation
import Combine

extension ModelsApi {
    @available(swift 5.5)
    @available(macOS 10.15, iOS 13, watchOS 6, tvOS 13, *)
    /// Lists the currently available models, and provides basic information about each one such as the owner and availability.
    ///
    /// - Returns: Future ``ListModels``
    public func listModelsFuture() -> Future<ListModels, Error> {
        Future<ListModels, Error> { promise in
            self.listModels { result in
                promise(result)
            }
        }
    }
}
