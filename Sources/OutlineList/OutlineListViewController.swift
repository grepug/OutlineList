//
//  OutlineListViewController.swift
//  
//
//  Created by Kai Shao on 2022/11/10.
//

import AppKit
import SwiftUI

class OutlineListViewController: NSViewController {
    var outlineView: OutlineListView!
    var listBody: any OutlineList
    
    init(_ listBody: some OutlineList) {
        self.listBody = listBody
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var list: OLList {
        listBody.untypedBody(self)
    }
    
    public override func loadView() {
        view = NSScrollView(frame: .zero)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        outlineView = .init(list: list)
        
        reload()
    }
}

extension OutlineListViewController {
    func reload() {
        outlineView.setupColumns()
    }
}

protocol OutlineList {
    associatedtype ViewController: OutlineListViewController
    
    func untypedBody(_ controller: OutlineListViewController) -> OLList
    func body(_ controller: ViewController) -> OLList
}

extension OutlineList {
    func untypedBody(_ controller: OutlineListViewController) -> OLList {
        body(controller as! ViewController)
    }
}

struct TestList: OutlineList {
    func body(_ controller: MyController) -> OLList {
        OLList {
            for _ in 0..<1 {
                OLRow(id: "") {
                    OLCellTextField(text: "")
                    OLCellTextField(text: "")
                    OLCellTextField(text: "")
                    OLCellSwiftUI {
                        
                    }
                }
                .parentID("1")
            }
        }
        .showColumnHeaders(true)
        .columnConfigurations([])
    }
}

class MyController: OutlineListViewController {
    var text = 1
    
    override func viewDidLoad() {
        reload()
    }
    
}

struct MyControllerWrapper: NSViewControllerRepresentable {
    typealias NSViewControllerType = MyController
    
    var list: any OutlineList
    
    func makeNSViewController(context: Context) -> MyController {
        .init(list)
    }
    
    func updateNSViewController(_ nsViewController: MyController, context: Context) {
        
    }
}
