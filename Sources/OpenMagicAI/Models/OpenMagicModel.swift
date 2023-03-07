//
//  Model.swift
//  Demo2OpenAI
//
//  Created by admin on 6/03/23.
//

import Foundation

public enum OpenMagicModel {
    case chatGPT35(ChatGPT35)
    case codex(Codex)
    case chatGPT3(ChatGPT3)
    public var rawValue: String {
        switch self {
        case .chatGPT35(let value):
            return value.rawValue
        case .codex(let value):
            return value.rawValue
        case .chatGPT3(let value):
            return value.rawValue
        }
    }
}

extension OpenMagicModel {

    public enum ChatGPT35: String {
        case gpt35Turbo = "gpt-3.5-turbo"
        case gpt35Turbo0301 = "gpt-3.5-turbo-0301"
        case textDavinci003 = "text-davinci-003"
        case textDavinci002 = "text-davinci-002"
        case codeDavinci002 = "code-davinci-002"
    }
    public enum Codex: String {
        case codeDavinci002 = "code-davinci-002"
        case codeCushman001 = "code-cushman-001"
    }
    public enum ChatGPT3: String {
        case textCurie001 = "text-curie-001"
        case textBabbage001 = "text-babbage-001"
        case textAda001 = "text-ada-001"
        case davinci = "davinci"
        case curie = "curie"
        case babbage = "babbage"
        case ada = "ada"
    }

}

