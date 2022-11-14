//
//  File.swift
//  
//
//  Created by Kai Shao on 2022/11/14.
//

import Foundation

public struct OLRow {
    public var id: String
    public var parentID: String?
    public var cellConfigurations: [OLCellConfigurationConvertible]
    
    public init(id: String, @OLBuilder configurations: () -> [OLCellConfigurationConvertible]) {
        self.id = id
        self.cellConfigurations = configurations()
    }
}

public extension OLRow {
    func parentID(_ id: String) -> Self {
        var me = self
        me.parentID = id
        return me
    }
}
