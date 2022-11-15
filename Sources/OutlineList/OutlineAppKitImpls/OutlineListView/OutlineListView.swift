//
//  OutlineListView.swift
//  
//
//  Created by Kai Shao on 2022/11/10.
//

import AppKit
import MenuBuilder

public class OutlineListView: NSOutlineView {
    typealias Item = NSString
    
    var list: OLList {
        didSet {
            idTree = makeIDTree(list: list)
        }
    }
    
    var referenceIDMap: [String: NSString] = [:]
    var idTree: [NSString?: [NSString]] = [:]
    
    private let menuHandler = MBMenuHandler()
    private var contextualRect = NSRect()
    public var currentMenu: NSMenu?
    
    init(list: OLList) {
        self.list = list
        super.init(frame: .zero)
        
        self.idTree = makeIDTree(list: list)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        
        if !contextualRect.isEmpty {
            // Draw the highlight.
            let rectPath = NSBezierPath(rect: contextualRect)
            let fillColor = NSColor.controlAccentColor
            rectPath.lineWidth = 2
            fillColor.set()
            rectPath.stroke()
        }
    }
    
    public override func menu(for event: NSEvent) -> NSMenu? {
        super.menu(for: event)
        
        // Reset the contextual menu frame for next use.
        contextualRect = NSRect()
 
        let targetRow = row(at: convert(event.locationInWindow, from: nil))
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
        
        let row = row(for: event)
        let col = column(for: event)
        
        guard row > -1 else { return nil }
        
        let menu = menuHandler.makeItems(mbMenus: list.rows[row].menus, column: col)
        currentMenu = menu
        
        return menu
    }
    
    public override func mouseDown(with event: NSEvent) {
        super.mouseDown(with: event)
        
        let row = row(for: event)
        
        guard row > -1 else { return }
        
        let col = column(for: event)
        let view = view(atColumn: col, row: row, makeIfNecessary: false)!
        
//        if event.clickCount == 2 {
//            onDoubleClicked?(row, col, view)
//        }
        
        if !contextualRect.isEmpty {
            // Clear the highlight if the user clicks away from the menu.
            contextualRect = NSRect()
            setNeedsDisplay(contextualRect)
        }
        
//        if let textField = view.subviews(ofType: NSTextField.self).first {
//            textField.mouseDown(with: event)
//        }
    }
}

extension OutlineListView {
    func setupColumns() {
        guard list.showingColumnHeaders else {
            tableColumns.forEach {
                removeTableColumn($0)
            }
            return
        }
        
        let columns = list.columnConfigurations

        for col in columns {
            let column = NSTableColumn(identifier: .init(col.title))
            column.title = col.title
            
            addTableColumn(column)
        }
    }
}

extension OutlineListView {
    func refID(_ id: String) -> NSString {
        if let id = referenceIDMap[id] {
            return id
        }
        
        let refID = NSString(string: id)
        referenceIDMap[id] = refID
        
        return refID
    }
    
    func makeIDTree(list: OLList) -> [NSString?: [NSString]] {
        var tree: [NSString?: [NSString]] = [:]
            
        for row in list.rows {
            let id = refID(row.id)
            let parentID = row.parentID.map { refID($0) }
            
            if tree[parentID] == nil {
                tree[parentID] = []
            }
            
            tree[parentID]!.append(id)
        }
        
        return tree
    }
}
