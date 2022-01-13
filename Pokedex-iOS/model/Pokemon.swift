//
//  Pokemon.swift
//  Pokedex-iOS
//
//  Created by Esther Huecas on 13/1/22.
//

import Foundation

struct Pokemon: Codable {
    var abilities: [String]
    var number: String
    var weight: Double
    var weakness: [String]
    var height: Double
    var featured: String
    var slug: String
    var name: String
    var id: Int
    var type: [String]
    var ThumbnailAltText: String
    var ThumbnailImage: String
}
