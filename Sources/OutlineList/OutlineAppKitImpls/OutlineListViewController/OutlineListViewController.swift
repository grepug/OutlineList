//
//  OutlineListViewController.swift
//  
//
//  Created by Kai Shao on 2022/11/10.
//

import AppKit
import SwiftUI
import MenuBuilder

open class OutlineListViewController: NSViewController, ObservableObject {
    public var outlineView: OutlineListView!
    
    var dataSource: OutlineListViewDataSource
    var delegate: OutlineListViewDelegate
    public var isShowing = false
    lazy var menuHandler: MBMenuHandler = .init()
    
    required public init() {
        self.dataSource = .init()
        self.delegate = .init()
        super.init(nibName: nil, bundle: nil)
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open var list: OLList {
        fatalError("has not been implemented")
    }
    
    public var swiftUI: some View {
        OutlineListViewControllerRepresentable(controller: self)
    }
    
    public override func loadView() {
        view = NSScrollView(frame: .zero)
    }
    
    open override func viewDidAppear() {
        super.viewDidAppear()
        isShowing = true
    }
    
    open override func viewDidDisappear() {
        super.viewDidDisappear()
        isShowing = false
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        outlineView = .init(list: list, menuHandler: menuHandler)
        outlineView.delegate = delegate
        outlineView.dataSource = dataSource
        outlineView.rowSizeStyle = .default
        outlineView.columnAutoresizingStyle = .uniformColumnAutoresizingStyle
        outlineView.autoresizesOutlineColumn = false
        
        let scrollView = view as! NSScrollView
        scrollView.documentView = outlineView
        scrollView.hasVerticalScroller = true

        Task {
            await reload()
        }
    }
    
    open func reload() async {
        outlineView.list = list
        outlineView.setup()
        outlineView.reloadData()
        outlineView.expandItem(nil, expandChildren: true)
        outlineView.usesAutomaticRowHeights = true
    }
}

public extension OutlineListViewController {
    func dismissMenu() {
        outlineView.currentMenu?.cancelTracking()
    }
}
