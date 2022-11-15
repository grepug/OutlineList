//
//  File.swift
//  
//
//  Created by Kai Shao on 2022/11/15.
//

#if canImport(AppKit)
import AppKit

public class MBMenuHandler: NSObject {
    var contextMenuActions = [String: () -> Void]()
    
    @objc func handleMenuEvent(_ sender: Any) {
        let menuItem = sender as! NSMenuItem
        let id = menuItem.identifier!.rawValue
        
        contextMenuActions[id]?()
    }
    
    public override init() {}
}

public extension MBMenuHandler {
    func makeItems(mbMenus: [MBMenuConvertible], menu: NSMenu = .init()) -> NSMenu {
        for mbMenu in mbMenus {
            if let children = mbMenu.children {
                let childMenu = makeItems(mbMenus: children, menu: .init(title: ""))
                let menuItem = mbMenu.makeMenuItem()
                
                menuItem.submenu = childMenu
                menu.addItem(menuItem)
            } else {
                let menuItem = mbMenu.makeMenuItem()
                menuItem.target = self
                menuItem.identifier = .init(rawValue: mbMenu.id)
                menuItem.action = #selector(handleMenuEvent(_:))
                menu.addItem(menuItem)
                contextMenuActions[mbMenu.id] = mbMenu.action
            }
        }
        
        return menu
    }
}
#endif
