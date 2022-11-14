//
//  File.swift
//  
//
//  Created by Kai Shao on 2022/11/10.
//

import AppKit

class OutlineListView: NSOutlineView {
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
        
//        let columns = list.columns
//        
//        for col in columns {
//            let column = NSTableColumn(identifier: .init(col.id))
//            
//            if let title = col.title {
//                column.title = title
//            }
//            
//            addTableColumn(column)
//        }
    }
}

protocol OutlineItem: AnyObject {
    
}
