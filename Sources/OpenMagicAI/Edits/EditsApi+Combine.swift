//
//  EditsApi+Combine.swift
//  
//
//  Created by admin on 10/03/23.
//

import Foundation
import Combine

extension EditsApi {
    @available(swift 5.5)
    @available(macOS 10.15, iOS 13, watchOS 6, tvOS 13, *)
    public func createEditFuture(
        model: CreateEdit.Model = .textDavinciEdit001,
        input: String = "",
        instruction: String,
        n: Int? = 1,
        temperature: Int? = 1,
        topP: Int? = 1
    ) -> Future<Edits, Error> {
        Future<Edits, Error> { promise in
            self.createEdit(
                model: model,
                input: input,
                instruction: instruction,
                n: n,
                temperature: temperature,
                topP: topP
            ) { result in
                promise(result)
            }
        }
    }
}
