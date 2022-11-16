//
//  OutlineListView+DataSource.swift
//  
//
//  Created by Kai Shao on 2022/11/10.
//

import AppKit

class OutlineListViewDataSource: NSObject, NSOutlineViewDataSource {
    func outlineView(_ outlineView: NSOutlineView, child index: Int, ofItem item: Any?) -> Any {
        let outlineView = outlineView as! OutlineListView
        let item = item.map(typedItem)
        let itemOfReturn = outlineView.idTree[item]?[index] as Any
        
        return itemOfReturn
    }
    
    func outlineView(_ outlineView: NSOutlineView, numberOfChildrenOfItem item: Any?) -> Int {
        let outlineView = outlineView as! OutlineListView
        let item = item.map(typedItem)
        let count = outlineView.idTree[item]?.count ?? 0
        
        return count
    }
    
    func outlineView(_ outlineView: NSOutlineView, isItemExpandable item: Any) -> Bool {
        let outlineView = outlineView as! OutlineListView
        let item = typedItem(item)
        let isExpandable = outlineView.idTree[item]?.isEmpty == false
        
        return isExpandable
    }
}

extension OutlineListViewDataSource {
    private func typedItem(_ item: Any) -> OutlineListView.ID {
        item as! OutlineListView.ID
    }
}
