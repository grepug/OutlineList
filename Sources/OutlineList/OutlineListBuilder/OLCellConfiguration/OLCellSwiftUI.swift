//
//  File.swift
//  
//
//  Created by Kai Shao on 2022/11/10.
//

import SwiftUI

public struct OLCellSwiftUI<Content: View>: OLCellConfigurationConvertible {
    var content: Content
    
    public init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    public func asConfig() -> [OLCellConfigurationConvertible] {
        [self]
    }
}
