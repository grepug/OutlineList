//
//  File.swift
//  
//
//  Created by Kai Shao on 2022/11/14.
//

import AppKit
import SwiftUI

public protocol OutlineList {
    associatedtype ViewController: OutlineListViewController
    
    var controller: ViewController { get }
    var list: OLList { get }
}

public protocol OutlineListSwiftUIView: OutlineList, View {}

public extension OutlineListSwiftUIView {
    var body: some View {
        OutlineListViewControllerRepresentable<ViewController>(controller: controller)
    }
}
