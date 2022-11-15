//
//  OutlineListExampleApp.swift
//  OutlineListExample
//
//  Created by Kai Shao on 2022/11/14.
//

import SwiftUI

@main
struct OutlineListExampleApp: App {
    @State var showing = true
    
    var body: some Scene {
        WindowGroup {
            VStack {
                Button("Toggle") {
                    showing.toggle()
                }
                
                if showing {
                    ContentView()
                }
            }
        }
    }
}
