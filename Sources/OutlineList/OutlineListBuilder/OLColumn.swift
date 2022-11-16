//
//  File.swift
//  
//
//  Created by Kai Shao on 2022/11/16.
//

import Foundation

public struct OLCoumn {
    public var id: String
    public var title: String
    
    public init() {
        self.title = ""
        self.id = "id"
    }
    
    public init(_ title: String) {
        assert(!title.isEmpty)
        
        self.id = title
        self.title = title
    }
}
