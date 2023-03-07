//
//  EditsApi+Parameters.swift
//  Demo2OpenAI
//
//  Created by admin on 6/03/23.
//

import Foundation

extension EditsApi {
    public enum CreateEdit {
        public enum Model: String {
            case textDavinciEdit001 = "text-davinci-edit-001"
            case codeDavinciEdit001 = "code-davinci-edit-001"
        }
        struct Parameters: Encodable {
            let model: String
            let input: String
            let instruction: String
            let n: Int?
            let temperature: Int?
            let topP: Int?
            enum CodingKeys: String, CodingKey {
                case model
                case input
                case instruction
                case n
                case temperature
                case topP = "top_p"
            }
        }
    }
    
}
