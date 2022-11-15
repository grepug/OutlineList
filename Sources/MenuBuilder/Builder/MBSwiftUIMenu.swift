//
//  MBSwiftUIMenu.swift
//  
//
//  Created by Kai Shao on 2022/11/15.
//

import SwiftUI

public struct MBSwiftUIMenu<Content: View>: MBMenuConvertible {
    public var id: String = UUID().uuidString
    public var children: [MBMenuConvertible]?
    public var action: (() -> Void)?
    var content: Content
 
    public func makeMenuItem() -> NSMenuItem {
        let menuItem = NSMenuItem()
        menuItem.view = NSHostingView(rootView: content)
        
        return menuItem
    }
}

public extension MBSwiftUIMenu {
    init(@ViewBuilder content: () -> Content, @MenuBuilder children: () -> [MBMenuConvertible]) {
        self.content = content()
        self.children = children()
    }
    
    init(@ViewBuilder content: () -> Content, action: @escaping () -> Void) {
        self.content = content()
        self.action = action
    }
}
