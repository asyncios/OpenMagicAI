//
//  OpenMagicError.swift
//  OpenMagicAI
//
//  Created by admin on 6/03/23.
//

import Foundation

extension OpenMagicAI {
    public enum OMError: Error {
        case noApiKey
        case missingRequiredInput
        case decodingError(response: [String: Any]?)
    }
}
