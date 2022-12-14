//
//  File.swift
//  
//
//  Created by Kai Shao on 2022/11/10.
//

import SwiftUI

public struct OLCellSwiftUI<Content: View>: OLCell {
    var content: Content
    
    public init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    public func nsView() -> NSView {
        NSHostingView(rootView: content)
    }
}
