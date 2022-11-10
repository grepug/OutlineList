//
//  File.swift
//  
//
//  Created by Kai Shao on 2022/11/10.
//

import Foundation

@resultBuilder
struct OLBuilder {
    static func buildBlock() -> [OLColumn] {
        []
    }
}

extension OLBuilder {
    static func buildBlock(_ components: OLList) -> OLList {
        components
    }
    
    static func buildBlock(_ components: OLColumnConvertible...) -> [OLColumn] {
        components.flatMap { $0.asCoulmns() }
    }
    
    static func buildBlock(_ components: OLCellConvertible...) -> [OLCell] {
        components.flatMap { $0.asCells() }
    }
}

extension OLBuilder {
    static func buildArray(_ components: [[OLColumnConvertible]]) -> [OLColumn] {
        components.flatMap { $0.flatMap { $0.asCoulmns() } }
    }
    
    static func buildOptional(_ component: [OLColumnConvertible]?) -> [OLColumn] {
        (component ?? []).flatMap { $0.asCoulmns() }
    }
    
    static func buildEither(first component: [OLColumnConvertible]) -> [OLColumn] {
        component.flatMap { $0.asCoulmns() }
    }
    
    static func buildEither(second component: [OLColumnConvertible]) -> [OLColumn] {
        component.flatMap { $0.asCoulmns() }
    }
}

extension OLBuilder {
    static func buildArray(_ components: [[OLCellConvertible]]) -> [OLCell] {
        components.flatMap { $0.flatMap { $0.asCells() } }
    }
    
    static func buildOptional(_ component: [OLCellConvertible]?) -> [OLCell] {
        (component ?? []).flatMap { $0.asCells() }
    }
    
    static func buildEither(first component: [OLCellConvertible]) -> [OLCell] {
        component.flatMap { $0.asCells() }
    }
    
    static func buildEither(second component: [OLCellConvertible]) -> [OLCell] {
        component.flatMap { $0.asCells() }
    }
}

extension OLBuilder {
    static func buildBlock(_ components: OLCellConfigurationConvertible) -> OLCellConfigurationConvertible {
        components
    }
}
