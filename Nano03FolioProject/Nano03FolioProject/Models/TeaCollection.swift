//
//  TeaCollection.swift
//  Nano03FolioProject
//
//  Created by Lucas Dal Pra Brascher on 01/10/25.
//

import Foundation

struct TeaCollection: Identifiable, Codable {
    let id: UUID
    var name: String
    var boxColor: Int
    var dateCreated: Date
    var teas: [Tea]
    
    init(
        id: UUID = UUID(),
        name: String,
        boxColor: Int,
        dateCreated: Date = Date(),
        teas: [Tea] = []
    ){
        self.id = id
        self.name = name
        self.box
    }
}
