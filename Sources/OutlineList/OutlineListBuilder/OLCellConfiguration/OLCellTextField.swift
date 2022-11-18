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

extension OLCellTextField: OLCell {
    public func nsView() -> NSView {
        let container = NSTableCellView()
        let field = CustomTextField(string: text)
        field.isEditable = false
        field.isBordered = false
        field.drawsBackground = false
        field.isBezeled = false
        field.lineBreakMode = .byTruncatingMiddle
        field.cell?.wraps = true
        field.usesSingleLineMode = false
        field.maximumNumberOfLines = 0
        
        container.addSubview(field)

        field.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            field.topAnchor.constraint(equalTo: container.topAnchor),
            field.heightAnchor.constraint(equalTo: container.heightAnchor),
            field.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            field.trailingAnchor.constraint(equalTo: container.trailingAnchor),
        ])
        
        return container
    }
}

public class CustomTextField: NSTextField {
    var onDoubleClick: (() -> Void)?
    
    init(string: String) {
        super.init(frame: .zero)

        stringValue = string
        isBezeled = false
        drawsBackground = false
        usesSingleLineMode = true
        cell?.wraps = true
        cell?.isScrollable = false
    }
    
    deinit {
        print("deinit textField")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func becomeFirstResponder() -> Bool {
        if super.becomeFirstResponder() {
            drawsBackground = true
            return true
        }
        
        return false
    }
    
    public override func textDidEndEditing(_ notification: Notification) {
        super.textDidEndEditing(notification)
        
        drawsBackground = false
    }
    
    public override func mouseDown(with event: NSEvent) {
        if event.clickCount == 2 {
            onDoubleClick?()
        }
    }
    
    public override func rightMouseDown(with event: NSEvent) {
        nextResponder?.rightMouseDown(with: event)
    }
}
