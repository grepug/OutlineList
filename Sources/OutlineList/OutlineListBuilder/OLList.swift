//
//  File.swift
//  
//
//  Created by Kai Shao on 2022/11/10.
//

import AppKit

public struct OLCoumnConfiguration {
    public var title: String
    
    public init(title: String) {
        self.title = title
    }
}

public struct OLList {
    var rows: [OLRow]
    var showingColumnHeaders: Bool = false
    var columnConfigurations: [OLCoumnConfiguration] = []
    
    public init(@OLBuilder rows: () -> [OLRow]) {
        self.rows = rows()
    }
}

public extension OLList {
    func showColumnHeaders(_ showing: Bool) -> Self {
        var me = self
        me.showingColumnHeaders = showing
        return me
    }
    
    func columns(_ configs: [OLCoumnConfiguration]) -> Self {
        var me = self
        me.columnConfigurations = configs
        return me
    }
}
