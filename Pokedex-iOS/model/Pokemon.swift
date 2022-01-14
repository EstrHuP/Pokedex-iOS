//
//  Pokemon.swift
//  Pokedex-iOS
//
//  Created by Esther Huecas on 13/1/22.
//

import Foundation

struct Pokemon: Codable {
    var number: String
    var name: String
    var type: [String]
    var ThumbnailImage: String
}
