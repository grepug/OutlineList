//
//  File.swift
//  
//
//  Created by Kai Shao on 2022/11/10.
//

import SwiftUI

struct OLCellSwiftUI<Content: View>: OLCellConfigurationConvertible {
    var content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    func asConfig() -> [OLCellConfigurationConvertible] {
        [self]
    }
}
