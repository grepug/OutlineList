//
//  File.swift
//  
//
//  Created by Kai Shao on 2022/11/10.
//

import Foundation

public protocol OLCellConfigurationConvertible {
    func asConfig() -> [OLCellConfigurationConvertible]
}
