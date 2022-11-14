//
//  OutlineListViewController.swift
//  
//
//  Created by Kai Shao on 2022/11/10.
//

import AppKit
import SwiftUI

open class OutlineListViewController: NSViewController {
    public var outlineView: OutlineListView!
    var listBody: any OutlineList
    
    var dataSource: OutlineListViewDataSource
    var delegate: OutlineListViewDelegate
    
    public init(_ listBody: some OutlineList) {
        self.listBody = listBody
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
    
    var list: OLList {
        listBody.untypedBody(self)
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
//        outlineView.reloadData()
//        outlineView.reloadData(forRowIndexes: [0, 1], columnIndexes: [0])
//        outlineView.reloadItem(outlineView.refID("a1"), reloadChildren: true)
    }
}
