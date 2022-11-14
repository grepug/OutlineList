//
//  ContentView.swift
//  OutlineListExample
//
//  Created by Kai Shao on 2022/11/14.
//

import SwiftUI
import OutlineList
import AppKit

struct ContentView: View {
    var body: some View {
        VStack {
            MyControllerWrapper(list: TestList())
        }
        .padding()
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
        super.viewDidLoad()
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
