//
//  PokemonCell.swift
//  Pokedex-iOS
//
//  Created by Esther Huecas on 14/1/22.
//

import UIKit

class PokemonCell: UITableViewCell {
    
    @IBOutlet weak var ui_pokemonImage_iv: UIImageView!
    @IBOutlet weak var ui_pokemonId_lbl: UILabel!
    @IBOutlet weak var ui_pokemonType_lbl: UILabel!
    @IBOutlet weak var ui_pokemonName_lbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
