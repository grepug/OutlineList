//
//  OutlineListView+EventHandlers.swift
//  
//
//  Created by Kai Shao on 2022/11/16.
//

import AppKit

extension OutlineListView {
    func drawContextualRect() {
        guard !contextualRect.isEmpty else {
            return
        }
        
        // Draw the highlight.
        let rectPath = NSBezierPath(rect: contextualRect)
        let fillColor = NSColor.controlAccentColor
        rectPath.lineWidth = 2
        fillColor.set()
        rectPath.stroke()
    }
    
    func setupContextualRect(for event: NSEvent) {
        // Reset the contextual menu frame for next use.
        contextualRect = NSRect()
        
        let targetRow = row(for: event)

        if targetRow != -1 {
            let rect = rect(ofRow: targetRow)
            
            if targetRow % 2 != 0 && usesAlternatingRowBackgroundColors {
                contextualRect = .init(x: rect.origin.x,
                                       y: rect.origin.y - 2.5,
                                       width: rect.width,
                                       height: rect.height + 5)
            } else {
                contextualRect = rect
            }
        }
        
        setNeedsDisplay(contextualRect) // Draw the highlight rectangle if necessary.
    }
    
    func clearContextualRect() {
        guard !contextualRect.isEmpty else {
            return
        }
        
        // Clear the highlight if the user clicks away from the menu.
        contextualRect = NSRect()
        setNeedsDisplay(bounds)
    }
}

extension OutlineListView {
    func makeMenus(for event: NSEvent) -> NSMenu? {
        let row = row(for: event)
        let col = column(for: event)
        
        guard row > -1 else {
            return nil
        }
        
        guard let mbMenus = list.rows[row].menus else {
            return nil
        }
        
        guard let menuHandler = menuHandler else {
            return nil
        }
        
        let menu = menuHandler.makeItems(mbMenus: mbMenus(col), column: col)
        currentMenu = menu
        
        return menu
    }
}
