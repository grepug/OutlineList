//
//  File.swift
//  
//
//  Created by Kai Shao on 2022/11/15.
//

import AppKit

extension NSTableView {
    func point(for event: NSEvent) -> NSPoint {
        let tableViewOrigin = superview!.convert(frame.origin, to: nil)
        return NSPoint(x: abs(event.locationInWindow.x - tableViewOrigin.x),
                       y: abs(event.locationInWindow.y - tableViewOrigin.y))
        
    }
    
    func row(for event: NSEvent) -> Int {
        row(at: point(for: event))
    }
    
    func column(for event: NSEvent) -> Int {
        column(at: point(for: event))
    }
}
