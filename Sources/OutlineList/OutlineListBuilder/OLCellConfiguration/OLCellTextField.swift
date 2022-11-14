//
//  File.swift
//  
//
//  Created by Kai Shao on 2022/11/10.
//

import AppKit
import SwiftUI

public struct OLCellTextField {
    public var text: String
    public var font: NSFont?
    
    public init(text: String) {
        self.text = text
    }
}

extension OLCellTextField: OLCellConfigurationConvertible {
    public func asConfig() -> [OLCellConfigurationConvertible] {
        [self]
    }
}
