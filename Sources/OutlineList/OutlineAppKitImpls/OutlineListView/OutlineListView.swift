//
//  OutlineListView.swift
//  
//
//  Created by Kai Shao on 2022/11/10.
//

import AppKit

public class OutlineListView: NSOutlineView {
    var list: OLList {
        didSet {
            idTree = makeIDTree(list: list)
        }
    }
    
    var referenceIDMap: [String: NSString] = [:]
    var idTree: [NSString?: [NSString]] = [:]
    
    init(list: OLList) {
        self.list = list
        super.init(frame: .zero)
        
        self.idTree = makeIDTree(list: list)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
