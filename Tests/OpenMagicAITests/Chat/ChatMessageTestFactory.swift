//
//  ChatMessageTestFactory.swift
//  
//
//  Created by admin on 15/03/23.
//

import Foundation
@testable import OpenMagicAI

enum ChatMessageTestFactory {
    static func getChatMessageMock() -> ChatMessage {
        .init(role: .user, content: "test")
    }
}
