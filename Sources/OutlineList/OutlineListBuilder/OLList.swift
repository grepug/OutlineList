//
//  File.swift
//  
//
//  Created by Kai Shao on 2022/11/10.
//

import Foundation

struct OLList {
    var columns: [OLColumn]
    
    init(@OLBuilder columns: () -> [OLColumn]) {
        self.columns = columns()
    }
}
