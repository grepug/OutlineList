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
    public func nsView() -> NSView {
        let field = NSTextField(string: text)
        field.isEditable = false
        field.isBordered = false
        field.drawsBackground = false
        field.isBezeled = false
        field.cell?.wraps = false
        field.usesSingleLineMode = true
        field.maximumNumberOfLines = 1
        
        return field
    }
}
