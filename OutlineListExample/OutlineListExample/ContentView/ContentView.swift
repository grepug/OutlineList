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
            TestList {
                controller
            }
            
            Button("Add") {
                controller.getRowOne()
            }
        }
        .padding()
    }
}
