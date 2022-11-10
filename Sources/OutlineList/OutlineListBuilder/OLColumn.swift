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

struct OLColumn {
    var id: String
    var cells: [OLCell]
    var title: String?
    var width: CGFloat?
    var fixedWidth: CGFloat?
    
    init(id: String, @OLBuilder cells: () -> [OLCell]) {
        self.id = id
        self.cells = cells()
    }
}

extension OLColumn {
    func title(_ title: String) -> Self {
        var me = self
        me.title = title
        return me
    }
    
    func width(_ width: CGFloat) -> Self {
        var me = self
        me.width = width
        return me
    }
    
    func width(fixed width: CGFloat) -> Self {
        var me = self
        me.fixedWidth = width
        return me
    }
}

extension OLColumn: OLColumnConvertible {
    func asCoulmns() -> [OLColumn] {
        [self]
    }
}

extension Array: OLColumnConvertible where Element == OLColumn {
    func asCoulmns() -> [OLColumn] {
        self
    }
}
