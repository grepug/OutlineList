//
//  File.swift
//  
//
//  Created by Kai Shao on 2022/11/10.
//

import Foundation

protocol OLColumnConvertible {
    func asCoulmns() -> [OLColumn]
}

struct OLColumn: OLColumnConvertible {
    var id: String
    var cells: [OLCell]
    
    func asCoulmns() -> [OLColumn] {
        [self]
    }
    
    init(id: String, @OLBuilder cells: () -> [OLCell]) {
        self.id = id
        self.cells = cells()
    }
}

extension Array: OLColumnConvertible where Element == OLColumn {
    func asCoulmns() -> [OLColumn] {
        self
    }
}
