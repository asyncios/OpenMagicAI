//
//  ImageSize.swift
//  OpenMagicAI
//
//  Created by admin on 6/03/23.
//

import Foundation

public struct ImageSize {
    public let width: Int
    public let height: Int
    public init(width: Int, height: Int) {
        self.width = width
        self.height = height
    }
    
    public static let defaultSize = ImageSize(width: 1024, height: 1024)
    
    var stringValue: String {
        "\(width)x\(height)"
    }
}
