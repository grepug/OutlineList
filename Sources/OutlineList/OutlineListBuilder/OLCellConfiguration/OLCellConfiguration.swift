//
//  File.swift
//  
//
//  Created by Kai Shao on 2022/11/10.
//

import Foundation

protocol OLCellConfigurationConvertible {
    func asConfig() -> [OLCellConfigurationConvertible]
}
