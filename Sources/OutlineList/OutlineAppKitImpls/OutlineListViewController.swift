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
    
    public init(_ listBody: some OutlineList) {
        self.listBody = listBody
        super.init(nibName: nil, bundle: nil)
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
        reload()
    }
    
    open func reload() {
        outlineView.setupColumns()
    }
}
