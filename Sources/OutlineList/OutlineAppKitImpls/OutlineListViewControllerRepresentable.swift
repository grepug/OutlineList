//
//  OutlineListViewControllerRepresentable.swift
//  
//
//  Created by Kai Shao on 2022/11/15.
//

import SwiftUI

struct OutlineListViewControllerRepresentable<Controller: OutlineListViewController>: NSViewControllerRepresentable {
    typealias NSViewControllerType = Controller

    let controller: NSViewControllerType
    
    func makeNSViewController(context: Context) -> NSViewControllerType {
        controller
    }
    
    func updateNSViewController(_ nsViewController: NSViewControllerType, context: Context) {
        
    }
}
