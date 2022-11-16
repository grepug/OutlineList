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
    let controller: MyController
    
    init(_ controller: MyController) {
        self.controller = controller
    }
    
    var list: OLList {
        OLList {
            OLCoumn()
            OLCoumn("a")
            OLCoumn("b")
        } rows: { [unowned controller] in
            OLRow(id: "a1") {
                OLCellTextField(text: "\(controller.text)")
                OLCellSwiftUI {
                    Color.blue
                }
                OLCellSwiftUI {
                    Color.red
                }
            }
            .menus { col in
                TestMenus().menus(for: col)
            }
        }
        .showColumnHeaders(true)
        .useAlternatingRowBackgroundColors(true)
    }
    
   
}

struct TestMenus {
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
//                controller.dismissMenu()
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
}

struct CellView: View {
    @ObservedObject var controller: MyController
    
    var body: some View {
        Text("\(controller.count)")
    }
}

class MyController: OutlineListViewController {
    @Published var text = "the part of the human body that is on the opposite side to the chest, between the neck and the tops of the legs; the part of an animal’s body"
    @Published var showing = false
    @Published var count = 0
    
    override var list: OLList {
        TestList(self).list
    }
    
    deinit {
        print("deinit")
    }
    
    override func viewDidLoad() {
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
