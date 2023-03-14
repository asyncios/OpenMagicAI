//
//  EndPoints.swift
//  OpenMagicAI
//
//  Created by admin on 6/03/23.
//

import Foundation

enum EndPoint: EndpointQueryable {

    case images(Images)
    case completions(Completions)
    case edits(Edits)
    case models(Models)
    case chat(Chat)

    var url: URL {
        switch self {
        case .images(let value):
            return value.url
        case .completions(let value):
            return value.url
        case .edits(let value):
            return value.url
        case .models(let value):
            return value.url
        case .chat(let value):
            return value.url
        }
    }

    var method: String? {
        switch self {
        case .images(let value):
            return value.method
        case .completions(let value):
            return value.method
        case .edits(let value):
            return value.method
        case .models(let value):
            return value.method
        case .chat(let value):
            return value.method
        }
    }

    fileprivate static var baseURL: URL {
        .init(string: "https://api.openai.com/v1")!
    }
}

extension EndPoint {

    enum Images: String, EndpointPathQueryable {
        case createEdit
        case createImageEdit
    }

    enum Completions: EndpointPathQueryable {
        case createCompletion
    }

    enum Edits: EndpointPathQueryable {
        case createEdit
    }

    enum Models: EndpointPathQueryable {
        case listModels
    }

    enum Chat: EndpointPathQueryable {
        case createChatCompletion
    }

}

extension EndpointPathQueryable {
    var url: URL {
        var url = EndPoint.baseURL
        if let value = Self.basePath, !value.isEmpty {
            url = url.appendingPathComponent(value)
        }
        if let value = path, !value.isEmpty {
            url = url.appendingPathComponent(value)
        }
        return url
    }
}
