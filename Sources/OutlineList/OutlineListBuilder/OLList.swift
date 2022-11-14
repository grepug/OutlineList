//
//  File.swift
//  
//
//  Created by Kai Shao on 2022/11/10.
//

import AppKit

struct OLCoumnConfiguration {
    var title: String
}

struct OLList {
    var rows: [OLRow]
    var showingColumnHeaders: Bool = false
    var columnConfigurations: [OLCoumnConfiguration] = []
    
    init(@OLBuilder rows: () -> [OLRow]) {
        self.rows = rows()
    }
}

extension OLList {
    func showColumnHeaders(_ showing: Bool) -> Self {
        var me = self
        me.showingColumnHeaders = showing
        return me
    }
    
    func columnConfigurations(_ configs: [OLCoumnConfiguration]) -> Self {
        var me = self
        me.columnConfigurations = configs
        return me
    }
}
