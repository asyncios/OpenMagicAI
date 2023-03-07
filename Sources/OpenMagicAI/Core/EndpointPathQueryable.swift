//
//  EndpointPathQueryable.swift
//  Demo2OpenAI
//
//  Created by admin on 6/03/23.
//

import Foundation

protocol EndpointPathQueryable: EndpointQueryable {
    var path: String? {get}
    var method: String? {get}
    var url: URL { get }
    static var basePath: String? {get}
}
