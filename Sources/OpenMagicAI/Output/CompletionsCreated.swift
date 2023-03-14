//
//  CompletionsCreated.swift
//  OpenMagicAI
//
//  Created by admin on 6/03/23.
//

import Foundation

public struct CompletionsCreated: Codable {
    public let object: String
    public let model: String
    public let choices: [Choice]
}

extension CompletionsCreated {

    public struct Choice: Codable {
        public let text: String
    }

}
