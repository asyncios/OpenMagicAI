//
//  ChatMessage.swift
//  
//
//  Created by admin on 14/03/23.
//

import Foundation

public struct ChatMessage: Codable {
    public let role: Role
    public let content: String
    public enum Role: String, Codable {
        case system
        case user
        case assistant
    }
    public init(role: Role, content: String) {
        self.role = role
        self.content = content
    }
}
