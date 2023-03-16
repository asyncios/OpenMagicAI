//
//  StringOrArray.swift
//  
//
//  Created by admin on 16/03/23.
//

import Foundation

public enum StringOrArray {
    case string(String)
    case array([String])

    func toArray() -> [String] {
        switch self {
        case .string(let string):
            return [string]
        case .array(let array):
            return array
        }
    }

    var isEmpty: Bool {
        switch self {
        case .string(let string):
            return string.isEmpty
        case .array(let array):
            return array.filter({$0.isEmpty}).isEmpty
        }
    }
}
