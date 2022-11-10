//
//  File.swift
//  
//
//  Created by Kai Shao on 2022/11/10.
//

import Foundation

protocol OLCellConvertible {
    func asCells() -> [OLCell]
}

struct OLCell {
    let id: String
    let parentID: String?
    var configurations: OLCellConfigurationConvertible
    
    init(id: String, parentID: String? = nil, @OLBuilder configurations: () -> OLCellConfigurationConvertible) {
        self.id = id
        self.parentID = parentID
        self.configurations = configurations()
    }
}

extension OLCell: OLCellConvertible {
    func asCells() -> [OLCell] {
        [self]
    }
}

extension Array: OLCellConvertible where Element == OLCell {
    func asCells() -> [OLCell] {
        self
    }
}
