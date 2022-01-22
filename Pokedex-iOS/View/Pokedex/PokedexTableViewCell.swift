//
//  PokedexTableViewCell.swift
//  Pokedex-iOS
//
//  Created by Esther Huecas on 22/1/22.
//

import UIKit
import Kingfisher

struct PokedexTableCellViewModel {
    let pokemonImage: URL?
    let name: String
    let number: String
    let typeImage: [String]
}

class PokedexTableViewCell: UITableViewCell {

    @IBOutlet weak var ui_imagePokemon_iv: UIImageView!
    @IBOutlet weak var ui_namePokemon_lbl: UILabel!
    @IBOutlet weak var ui_idPokemon_lbl: UILabel!
    @IBOutlet weak var ui_typePokemon_iv: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

extension PokedexTableViewCell {
    func configure(viewModel: PokedexTableCellViewModel) {
        ui_imagePokemon_iv.kf.indicatorType = .activity
        ui_imagePokemon_iv.kf.setImage(with: viewModel.pokemonImage)
        
        ui_namePokemon_lbl.text = viewModel.name
        ui_idPokemon_lbl.text = viewModel.number
    }
}
