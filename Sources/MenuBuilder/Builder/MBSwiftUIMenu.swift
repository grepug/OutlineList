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
    public var action: MBMenuAction?
    var content: Content
    var width: CGFloat = 80
    var height: CGFloat = 40
 
    public func makeMenuItem() -> NSMenuItem {
        let menuItem = NSMenuItem()
        let view = NSHostingView(rootView: content)
        view.frame = .init(x: 0, y: 0, width: width, height: height)
        menuItem.view = view
        
        return menuItem
    }
}

public extension MBSwiftUIMenu {
    init(_ width: CGFloat? = nil, _ height: CGFloat? = nil, @ViewBuilder content: () -> Content, @MenuBuilder children: () -> [MBMenuConvertible]) {
        self.content = content()
        self.children = children()
        
        if let width {
            self.width = width
        }
        
        if let height {
            self.height = height
        }
    }
    
    init(_ width: CGFloat? = nil, _ height: CGFloat? = nil, @ViewBuilder content: () -> Content) {
        self.content = content()
        
        if let width {
            self.width = width
        }
        
        if let height {
            self.height = height
        }
    }
}
