//
//  ChatApi+Input.swift
//  
//
//  Created by admin on 14/03/23.
//

import Foundation

public enum CreateChatCompletionModel: String {
    /// Limited beta
    case gpt4 = "gpt-4"
    /// Limited beta
    case gpt40134 = "gpt-4-0314"
    /// Limited beta
    case gpt432k = "gpt-4-32k"
    /// Limited beta
    case gpt432k0314 = "gpt-4-32k-0314"
    case gpt35Turbo = "gpt-3.5-turbo"
    case gpt35Turbo0301 = "gpt-3.5-turbo-0301"
}
