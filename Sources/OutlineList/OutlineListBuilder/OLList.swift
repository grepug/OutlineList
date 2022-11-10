//
//  File.swift
//  
//
//  Created by Kai Shao on 2022/11/10.
//

import AppKit

struct OLList {
    var columns: [OLColumn]
    var showingColumnHeaders: Bool = false
    
    init(@OLBuilder columns: () -> [OLColumn]) {
        self.columns = columns()
    }
}

extension OLList {
    func showColumnHeaders(_ showing: Bool) -> Self {
        var me = self
        me.showingColumnHeaders = showing
        return me
    }
}
