//
//  EndpointQueryable.swift
//  OpenMagicAI
//
//  Created by admin on 6/03/23.
//

import Foundation

protocol EndpointQueryable {
    var method: String? {get}
    var url: URL { get }
}
