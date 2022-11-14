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
            
            Button("Add") {
                
            }
        }
        .padding()
    }
}

struct TestList: OutlineList {
    func body(_ controller: MyController) -> OLList {
        OLList {
            OLRow(id: "a1") {
                OLCellTextField(text: "\(controller.text)")
                OLCellTextField(text: "abc")
                OLCellSwiftUI {
                    Color.red
                }
            }
            
            OLRow(id: "a2") {
                OLCellTextField(text: "abc")
                OLCellTextField(text: "abc1")
                OLCellSwiftUI {
                    Color.green
                }
            }
            .parentID("a1")
            .height(80)
        }
        .showColumnHeaders(true)
        .columns([
            .init(title: "a"),
            .init(title: "textField"),
            .init(title: "haha")
        ])
    }
}

class MyController: OutlineListViewController {
    var text = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
