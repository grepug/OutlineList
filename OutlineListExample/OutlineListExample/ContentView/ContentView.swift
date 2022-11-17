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
    @StateObject var controller2 = MyController()
    
    var body: some View {
            NavigationSplitView {
                TestList {
                    controller
                }
            } detail: {
                TestList {
                    controller2
                }
            }

//            Button("Add") {
//                controller.getRowOne()
//            }
    }
}
