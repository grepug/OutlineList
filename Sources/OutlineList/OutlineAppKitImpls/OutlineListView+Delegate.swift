//
//  OutlineListViewDelegate.swift
//  
//
//  Created by Kai Shao on 2022/11/10.
//

import AppKit
import SwiftUI

class OutlineListViewDelegate: NSObject, NSOutlineViewDelegate {
    func outlineView(_ outlineView: NSOutlineView, viewFor tableColumn: NSTableColumn?, item: Any) -> NSView? {
        let outlineView = outlineView as! OutlineListView
        let row = row(item, in: outlineView.list)
            
        let column = outlineView.tableColumns.firstIndex(of: tableColumn!)!
        let cell = row.cellConfigurations[column]
        
        return cell.nsView()
    }
    
    func outlineView(_ outlineView: NSOutlineView, heightOfRowByItem item: Any) -> CGFloat {
        let outlineView = outlineView as! OutlineListView
        let row = row(item, in: outlineView.list)
        
        return row.height ?? 22
    }
}

extension OutlineListViewDelegate {
    func row(_ item: Any, in list: OLList) -> OLRow {
        let rowID = item as! NSString
        
        guard let row = list.rows.first(where: { row in
            row.id == rowID as String
        }) else {
            fatalError()
        }
        
        return row
    }
}
