//
//  OutlineListView.swift
//  
//
//  Created by Kai Shao on 2022/11/10.
//

import AppKit

public class OutlineListView: NSOutlineView {
    var list: OLList
    
    init(list: OLList) {
        self.list = list
        super.init(frame: .zero)
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

protocol OutlineItem: AnyObject {
    
}
