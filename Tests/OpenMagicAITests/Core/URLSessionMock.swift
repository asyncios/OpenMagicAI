//
//  File.swift
//  
//
//  Created by admin on 7/03/23.
//

import Foundation

enum URLSessionMock {
    static func getURLSession() -> URLSession {
        URLProtocol.registerClass(MockURLProtocol.self)
        let configurationWithMock = URLSessionConfiguration.default
        configurationWithMock.protocolClasses?.insert(MockURLProtocol.self, at: 0)
        return .init(configuration: configurationWithMock)
    }
}
