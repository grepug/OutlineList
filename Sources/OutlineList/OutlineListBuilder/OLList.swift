//
//  File.swift
//  
//
//  Created by Kai Shao on 2022/11/10.
//

import AppKit

public struct OLList {
    var rows: [OLRow]
    var columns: [OLCoumn]
    var showingColumnHeaders: Bool = false
    var usesAlternatingRowBackgroundColors: Bool = false
    
    public init(@OLBuilder columns: () -> [OLCoumn], @OLBuilder rows: () -> [OLRow]) {
        self.columns = columns()
        self.rows = rows()
    }
    
    public init(@OLBuilder rows: () -> [OLRow]) {
        self.columns = [OLCoumn()]
        self.rows = rows()
    }
}

public extension OLList {
    func showColumnHeaders(_ showing: Bool) -> Self {
        var me = self
        me.showingColumnHeaders = showing
        return me
    }
    
    func useAlternatingRowBackgroundColors(_ isTrue: Bool) -> Self {
        var me = self
        me.usesAlternatingRowBackgroundColors = isTrue
        return me
    }
}
