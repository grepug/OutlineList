//
//  OutlineListViewController.swift
//  
//
//  Created by Kai Shao on 2022/11/10.
//

import AppKit
import SwiftUI

open class OutlineListViewController: NSViewController, ObservableObject {
    public var outlineView: OutlineListView!
    
    var dataSource: OutlineListViewDataSource
    var delegate: OutlineListViewDelegate
    
    required public init() {
        self.dataSource = .init()
        self.delegate = .init()
        super.init(nibName: nil, bundle: nil)
        
        let scrollView = view as! NSScrollView
        scrollView.documentView = outlineView
        scrollView.hasVerticalScroller = true
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open var list: OLList {
        fatalError("has not been implemented")
    }
    
    public override func loadView() {
        view = NSScrollView(frame: .zero)
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        outlineView = .init(list: list)
        outlineView.delegate = delegate
        outlineView.dataSource = dataSource
        outlineView.rowSizeStyle = .default
        outlineView.columnAutoresizingStyle = .uniformColumnAutoresizingStyle
        outlineView.autoresizesOutlineColumn = false

        reload()
    }
    
    open func reload() {
        outlineView.setupColumns()
    }
}
