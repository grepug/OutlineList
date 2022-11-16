//
//  File.swift
//  
//
//  Created by Kai Shao on 2022/11/15.
//

#if canImport(AppKit)
import AppKit

public class MBMenuHandler: NSObject {
    var contextMenuActions = [ActionKey: MBMenuAction]()
    
    @objc func handleMenuEvent(_ sender: Any) {
        let menuItem = sender as! NSMenuItem
        let id = menuItem.identifier!.rawValue
        let actionKey = ActionKey(menuIdentifier: id)
        
        contextMenuActions[actionKey]?()
    }
    
    public override init() {}
}

public extension MBMenuHandler {
    func makeItems(mbMenus: [MBMenuConvertible], column: Int, menu: NSMenu = .init(), removingAll: Bool = true) -> NSMenu {
        if removingAll {
            contextMenuActions.removeAll()
        }
        
        for mbMenu in mbMenus {
            if let children = mbMenu.children {
                let childMenu = makeItems(mbMenus: children,
                                          column: column,
                                          menu: .init(title: ""),
                                          removingAll: false)
                let menuItem = mbMenu.makeMenuItem()
                
                menuItem.submenu = childMenu
                menu.addItem(menuItem)
            } else {
                let menuItem = mbMenu.makeMenuItem()
                let actionKey = ActionKey(id: mbMenu.id, column: column)
                
                menuItem.target = self
                menuItem.identifier = .init(rawValue: actionKey.identifier)
                menuItem.action = #selector(handleMenuEvent(_:))
                menu.addItem(menuItem)
                contextMenuActions[actionKey] = mbMenu.action
            }
        }
        
        return menu
    }
}

extension MBMenuHandler {
    /// The struct to identify a menu item, which is meaningless right now, since we don't distinguish columns on menu items
    struct ActionKey: Hashable {
        private var id: String
        var column: Int
        
        init(id: String, column: Int) {
            self.id = id
            self.column = column
        }
        
        init(menuIdentifier: String) {
            let elements = menuIdentifier.split(separator: "@")
            self.id = String(elements[0])
            self.column = Int(String(elements[1]))!
        }
        
        var identifier: String {
            "\(id)@\(column)"
        }
    }
}
#endif
