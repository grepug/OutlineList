//
//  File.swift
//  
//
//  Created by Kai Shao on 2022/11/15.
//

import Foundation

@resultBuilder
public enum MenuBuilder {
    public static func buildBlock(_ components: MBMenuConvertible...) -> [MBMenuConvertible] {
        components
    }
    
    public static func buildBlock(_ components: [MBMenuConvertible]) -> [MBMenuConvertible] {
        components
    }
}
