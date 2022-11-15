//
//  File.swift
//  
//
//  Created by Kai Shao on 2022/11/15.
//

import Foundation
#if os(macOS)
import AppKit
#endif

public protocol MBMenuConvertible {
    var id: String { get }
    var action: (() -> Void)? { get }
    var children: [MBMenuConvertible]? { get }
    
    #if os(macOS)
    func makeMenuItem() -> NSMenuItem
    #endif
}

public struct MBMenu: MBMenuConvertible {
    var title: String?
    public var id: String = UUID().uuidString
    public var action: (() -> Void)?
    public var children: [MBMenuConvertible]?
    
    public func makeMenuItem() -> NSMenuItem {
        .init(title: title ?? "", action: nil, keyEquivalent: "")
    }
}

public extension MBMenu {
    init(_ title: String, @MenuBuilder children: () -> [MBMenuConvertible]) {
        self.title = title
        self.children = children()
    }
    
    init(_ title: String, action: @escaping () -> Void) {
        self.title = title
        self.action = action
    }
}
