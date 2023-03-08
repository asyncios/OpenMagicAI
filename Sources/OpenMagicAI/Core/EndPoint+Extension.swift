//
//  EndPoint+Extension.swift
//  OpenMagicAI
//
//  Created by admin on 7/03/23.
//

import Foundation

extension EndPoint.Images {
    var method: String? {
        switch self {
        case .generations:
            return "POST"
        case .edits:
            return nil
        }
    }
    var path: String? {
        self.rawValue
    }
    static var basePath: String? {
        return "images"
    }
}

extension EndPoint.Completions {
    var method: String? {
        switch self {
        case .createCompletion:
            return "POST"
        case .chatCompletion:
            return "POST"
        }
    }
    var path: String? {
        switch self {
        case .createCompletion:
            return "completions"
        case .chatCompletion:
            return "chat/completions"
        }
    }
    static var basePath: String? {
        return nil
    }
}

extension EndPoint.Edits {
    var method: String? {
        switch self {
        case .createEdit:
            return "POST"
        }
    }
    var path: String? {
        switch self {
        case .createEdit:
            return nil
        }
    }
    static var basePath: String? {
        return "edits"
    }
}

extension EndPoint.Models {
    var path: String? {
        switch self {
        case .listModels:
            return nil
        }
    }
    var method: String? {
        switch self {
        case .listModels:
            return "GET"
        }
    }
    static var basePath: String? {
        return "models"
    }
}
