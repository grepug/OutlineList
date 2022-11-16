//
//  File.swift
//  
//
//  Created by Kai Shao on 2022/11/10.
//

import Foundation

@resultBuilder
public struct OLBuilder {}

public extension OLBuilder {
    static func buildBlock(_ components: OLList) -> OLList {
        components
    }
    
    static func buildBlock(_ components: OLRow...) -> [OLRow] {
        components
    }
    
    static func buildBlock(_ components: [OLRow]) -> [OLRow] {
        components
    }
}

public extension OLBuilder {
    static func buildArray(_ components: [OLRow]) -> [OLRow] {
        components
    }
    
    static func buildArray(_ components: [[OLRow]]) -> [OLRow] {
        components.flatMap { $0 }
    }
    
    static func buildOptional(_ component: [OLRow]?) -> [OLRow] {
        component ?? []
    }
    
    static func buildEither(first component: [OLRow]) -> [OLRow] {
        component
    }
    
    static func buildEither(second component: [OLRow]) -> [OLRow] {
        component
    }
}

public extension OLBuilder {
    static func buildBlock(_ components: OLCellConfigurationConvertible...) -> [OLCellConfigurationConvertible] {
        components
    }
}

public extension OLBuilder {
    static func buildBlock(_ components: OLCoumn...) -> [OLCoumn] {
        components
    }
}
