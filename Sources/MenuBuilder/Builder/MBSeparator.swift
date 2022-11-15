//
//  MBSeparator.swift
//  
//
//  Created by Kai Shao on 2022/11/15.
//

import AppKit

public struct MBSeparator: MBMenuConvertible {
    public var id: String = UUID().uuidString
    public var action: (() -> Void)?
    public var children: [MBMenuConvertible]?
    
    public func makeMenuItem() -> NSMenuItem {
        NSMenuItem.separator()
    }
    
    public init() {}
}
