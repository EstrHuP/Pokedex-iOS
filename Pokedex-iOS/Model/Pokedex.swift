//
//  Pokemon.swift
//  Pokedex-iOS
//
//  Created by Esther Huecas on 13/1/22.
//

import Foundation

struct Pokedex: Decodable {
    let number: String
    let name: String
    let slug: String
    let weight: Double
    let height: Double
    let abilities: [String]
    let weakness: [String]
    let type: [String]
    let ThumbnailAltText: String
    let ThumbnailImage: String
}

extension Pokedex {
    
    var pokemonImageURL: URL? {
        URL(string: "https://assets.pokemon.com/assets/cms2/img/pokedex/detail/\(number).png")
    }
    
    var toPokedexCellViewModel: PokedexTableCellViewModel {
        PokedexTableCellViewModel(pokemonImage: pokemonImageURL, name: name, number: number, typeImage: type)
    }
}
