//
//  File.swift
//  
//
//  Created by Kai Shao on 2022/11/14.
//

import AppKit

public protocol OutlineList {
    associatedtype ViewController: OutlineListViewController
    
    func body(_ controller: ViewController) -> OLList
}

extension OutlineList {
    func untypedBody(_ controller: OutlineListViewController) -> OLList {
        body(controller as! ViewController)
    }
}
