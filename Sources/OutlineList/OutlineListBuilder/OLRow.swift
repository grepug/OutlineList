//
//  File.swift
//  
//
//  Created by Kai Shao on 2022/11/14.
//

import Foundation

struct OLRow {
    var id: String
    var parentID: String?
    var cellConfigurations: [OLCellConfigurationConvertible]
    
    init(id: String, @OLBuilder configurations: () -> [OLCellConfigurationConvertible]) {
        self.id = id
        self.cellConfigurations = configurations()
    }
}

extension OLRow {
    func parentID(_ id: String) -> Self {
        var me = self
        me.parentID = id
        return me
    }
}
