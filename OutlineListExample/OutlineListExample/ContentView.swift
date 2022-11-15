//
//  ContentView.swift
//  OutlineListExample
//
//  Created by Kai Shao on 2022/11/14.
//

import SwiftUI
import OutlineList
import AppKit
import MenuBuilder

struct ContentView: View {
    @StateObject var controller = MyController()
    
    var body: some View {
        VStack {
            TestList(controller)
            
            Button("Add") {
                controller.showing.toggle()
            }
        }
        .padding()
    }
}

struct TestList: OutlineListSwiftUIView {
    let controller: MyController
    
    init(_ controller: MyController) {
        self.controller = controller
    }
    
    var list: OLList {
        OLList {
            OLRow(id: "a1") {
                OLCellTextField(text: "\(controller.text)")
                OLCellTextField(text: "abc")
                OLCellSwiftUI {
                    Color.red
                }
            }
            .menus {
                MBMenu("hi") {
                    MBMenu("hi") { col in
                        print("col", col)
                    }
                }
                
                MBSeparator()
                
                MBSwiftUIMenu {
                    Button("test") {
                        controller.dismissMenu()
                    }
                }
                
                MBSeparator()
                
                MBSwiftUIMenu {
                    Color.red
                } children: {
                    MBSwiftUIMenu {
                        Color.green
                    }
                }
            }
            
            OLRow(id: "a2") {
                OLCellTextField(text: "the part of the human body that is on the opposite side to the chest, between the neck and the tops of the legs; the part of an animal’s body")
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
    @Published var text = "the part of the human body that is on the opposite side to the chest, between the neck and the tops of the legs; the part of an animal’s body"
    
    @Published var showing = false
    
    override var list: OLList {
        TestList(self).list
    }
    
    deinit {
        print("deinit")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
