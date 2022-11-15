//
//  File.swift
//  
//
//  Created by Kai Shao on 2022/11/14.
//

import Foundation
import MenuBuilder

public struct OLRow {
    var id: String
    var parentID: String?
    var height: CGFloat?
    var cellConfigurations: [OLCellConfigurationConvertible]
    var menus: [MBMenuConvertible] = []
    
    public init(id: String, @OLBuilder configurations: () -> [OLCellConfigurationConvertible]) {
        self.id = id
        self.cellConfigurations = configurations()
    }
}

public extension OLRow {
    func parentID(_ id: String?) -> Self {
        var me = self
        me.parentID = id
        return me
    }
    
    func height(_ height: CGFloat?) -> Self {
        var me = self
        me.height = height
        return me
    }
    
    func menus(@MenuBuilder _ menus: () -> [MBMenuConvertible]) -> Self {
        var me = self
        me.menus = menus()
        return me
    }
}
