//
//  TeaType.swift
//  Nano03FolioProject
//
//  Created by Lucas Dal Pra Brascher on 01/10/25.
//

import Foundation

enum TeaType: String, Codable {
    case teaBag = "teaBag"
    case teaCup = "teaCup"
    
    var displayName: String {
        switch self {
        case .teaBag:
            return "Saquinho de chá"
        case .teaCup:
            return "Xícara de chá"
        }
    }
    
    func assetName(variant: Int) -> String {
        return "\(self.rawValue)\(variant)"
    }
    
}
 
