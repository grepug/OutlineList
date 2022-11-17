//
//  OutlineListView.swift
//  
//
//  Created by Kai Shao on 2022/11/10.
//

import AppKit
import MenuBuilder

public class OutlineListView: NSOutlineView {
    var list: OLList {
        didSet {
            idTree = makeIDTree(list: list)
        }
    }
    
    var referenceIDMap: [String: ID] = [:]
    var idTree: [ID?: [ID]] = [:]
    
    weak var menuHandler: MBMenuHandler?
    var contextualRect = NSRect()
    public var currentMenu: NSMenu?
    
    init(list: OLList, menuHandler: MBMenuHandler?) {
        self.list = list
        self.menuHandler = menuHandler
        super.init(frame: .zero)
        
        self.idTree = makeIDTree(list: list)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        drawContextualRect()
    }
    
    public override func menu(for event: NSEvent) -> NSMenu? {
        setupContextualRect(for: event)
        return makeMenus(for: event)
    }
    
    public override func mouseDown(with event: NSEvent) {
        super.mouseDown(with: event)
        clearContextualRect()
    }
    
    public override func didCloseMenu(_ menu: NSMenu, with event: NSEvent?) {
        super.didCloseMenu(menu, with: event)
        clearContextualRect()
    }
    
    public override func selectRowIndexes(_ indexes: IndexSet, byExtendingSelection extend: Bool) {
        super.selectRowIndexes(indexes, byExtendingSelection: extend)
    }
    
    func setup() {
        setupColumns()
        setupProperties()
        expandItem(nil, expandChildren: true)
    }
}

private extension OutlineListView {
    func setupColumns() {
        if !list.showingColumnHeaders {
            headerView = nil
        }
        
        let columns = list.columns

        for col in columns {
            let column = NSTableColumn(identifier: .init(col.id))
            column.title = col.title

            addTableColumn(column)
        }
    }
    
    func setupProperties() {
        usesAlternatingRowBackgroundColors = list.usesAlternatingRowBackgroundColors
    }
}
