//
//  File.swift
//  
//
//  Created by Kai Shao on 2022/11/10.
//

import AppKit
import SwiftUI

struct OLCellTextField {
    var text: String
    var font: NSFont?
    
    init(text: String) {
        self.text = text
    }
}

extension OLCellTextField: OLCellConfigurationConvertible {
    func asConfig() -> [OLCellConfigurationConvertible] {
        [self]
    }
}
