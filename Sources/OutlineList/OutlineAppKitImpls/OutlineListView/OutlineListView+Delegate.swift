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
        let column = tableColumn.map {
            outlineView.tableColumns.firstIndex(of: $0)!
        } ?? 0
        
        let cell = row.cellConfigurations[column]
        let view = cell.nsView()
        
        return view
    }
    
    func outlineView(_ outlineView: NSOutlineView, didAdd rowView: NSTableRowView, forRow row: Int) {
        guard let cellView = rowView.subviews.first(where: { $0 is NSTableCellView }) else {
            return
        }
        
        cellView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cellView.trailingAnchor.constraint(equalTo: rowView.trailingAnchor, constant: -16),
            cellView.widthAnchor.constraint(lessThanOrEqualTo: outlineView.widthAnchor)
        ])
    }
    
    func outlineView(_ outlineView: NSOutlineView, isGroupItem item: Any) -> Bool {
        let outlineView = outlineView as! OutlineListView
        let row = row(item, in: outlineView.list)
        
        return row.isGroupItem
    }
}

extension OutlineListViewDelegate {
    func row(_ item: Any, in list: OLList) -> OLRow {
        let rowID = item as! OutlineListView.ID
        
        guard let row = list.rows.first(where: { row in
            row.id == rowID as String
        }) else {
            fatalError()
        }
        
        return row
    }
}
