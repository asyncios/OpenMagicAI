//
//  OpenMagic+Completions.swift
//  OpenMagicAI
//
//  Created by admin on 6/03/23.
//

import Foundation


public struct Completions: Codable {
    public let object: String
    public let model: String
    public let choices: [Choice]
}

extension Completions {

    public struct Choice: Codable {
        public let text: String
    }

}
