//
//  TestList.swift
//  OutlineListExample
//
//  Created by Kai Shao on 2022/11/16.
//

import SwiftUI
import MenuBuilder
import OutlineList

struct TestList: OutlineListSwiftUIView {
    var vc: () -> MyController
    
    var list: OLList {
        OLList {
            OLCoumn()
//            OLCoumn("properties")
        } rows: {
            OLRow(id: "title") {
                OLCellSwiftUI {
                    Text("get 1")
                        .font(.headline)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.vertical, 4)
                }
            }
            
            OLRow(id: "pos1") {
                OLCellTextField(text: "get verb")
            }
            .parentID("title")
            
            OLRow(id: "def1") {
                OLCellTextField(text: "1. get something to receive something")
            }
            .parentID("pos1")
            
            OLRow(id: "def2") {
                OLCellTextField(text: "2. to obtain something")
            }
            .parentID("pos1")
            
            OLRow(id: "pos2") {
                OLCellTextField(text: "get noun")
            }
            .parentID("title")
            
            OLRow(id: "def2-1") {
                OLCellTextField(text: "1. get something to receive something")
            }
            .parentID("pos2")
            
            OLRow(id: "def2-2") {
                OLCellTextField(text: "2. to obtain something")
            }
            .parentID("pos2")
        }
        .showColumnHeaders(false)
    }
    
    @MenuBuilder
    func menus(for col: Int) -> [MBMenuConvertible] {
        MBMenu("hi") {
            MBMenu("hi") {
                print("col", col)
            }
        }
        MBSeparator()
        MBSwiftUIMenu {
            Button("test") {
                vc().dismissMenu()
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
    
    var swiftUICell: some OLCell {
        OLCellSwiftUI {
            Button("test") {
                Task {
                    try! await Task.sleep(nanoseconds: 2_000_000_000)
                    await print(vc().testID, vc().isShowing)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

struct CellView: View {
    var count: Int
    
    var body: some View {
        Text("\(count)")
    }
}

class MyController: OutlineListViewController {
    @Published var text = "the part of the human body that is on the opposite side to the chest, between the neck and the tops of the legs; the part of an animal’s body"
    @Published var showing = false
    @Published var count = 0
    
    var data: [String] = ["a1", "a2", "3", "4"]
    
    var testID = UUID().uuidString
    
    override var list: OLList {
        TestList(vc: { [unowned self] in self }).list
    }
    
    deinit {
        print("deinit", testID)
    }
    
    override func viewDidLoad() {
        print("init", testID)
        super.viewDidLoad()
    }
    
    func getRowOne() {
        let rowID = outlineView.refID("a1")
        let rowIndex = outlineView.row(forItem: rowID)
        let rowView = outlineView.view(atColumn: 0, row: rowIndex, makeIfNecessary: false)
        let textField = rowView?.subviews(ofType: NSTextField.self).first
        
        textField?.stringValue = "hahahahaha"
        count += 1
    }
}

public extension NSView {
    func subviews<T: NSView>(ofType type: T.Type) -> [T] {
        var result = subviews.compactMap { $0 as? T }
        
        for sub in subviews {
            result.append(contentsOf: sub.subviews(ofType: type))
        }
        
        return result
    }
}
