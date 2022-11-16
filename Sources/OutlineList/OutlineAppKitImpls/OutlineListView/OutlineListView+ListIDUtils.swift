//
//  OutlineListView+ListIDUtils.swift
//  
//
//  Created by Kai Shao on 2022/11/16.
//

import Foundation

extension OutlineListView {
    public typealias ID = NSString
    
    public func refID(_ id: String) -> ID {
        if let id = referenceIDMap[id] {
            return id
        }
        
        let refID = ID(string: id)
        referenceIDMap[id] = refID
        
        return refID
    }
    
    func makeIDTree(list: OLList) -> [ID?: [ID]] {
        var tree: [ID?: [ID]] = [:]
            
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
