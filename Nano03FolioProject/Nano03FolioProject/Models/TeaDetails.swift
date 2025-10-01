//
//  TeaDetails.swift
//  Nano03FolioProject
//
//  Created by Lucas Dal Pra Brascher on 01/10/25.
//

import Foundation

enum TeaDetails: Codable {
    case homemade(ingredients: [String])
    case store(flavor: String, brand: String)
}
