//
//  PokedexViewController.swift
//  Pokedex-iOS
//
//  Created by Esther Huecas on 13/1/22.
//

import UIKit
import Kingfisher

class PokedexViewController: UIViewController {
    
    @IBOutlet weak var ui_tableView_tv: UITableView!
    @IBOutlet weak var ui_indicatorView_aiv: UIActivityIndicatorView!
    
    var listPokemonVM = ListPokemonViewModel()
    
    private var pokemons = [Pokedex]() {
        didSet {
            DispatchQueue.main.async {
                self.ui_tableView_tv.reloadData()
                self.ui_indicatorView_aiv.stopAnimating()
                self.ui_indicatorView_aiv.isHidden = true
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        fetchPokedex()
    }
}

extension PokedexViewController {
    private func configureView() {
        self.ui_indicatorView_aiv.startAnimating()
        self.ui_indicatorView_aiv.isHidden = false
    }
    
    private func fetchPokedex() {
        listPokemonVM.getAllPokemon(completion: { pokemons in
            self.pokemons = pokemons
        })
    }
}

extension PokedexViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PokedexTableViewCell", for: indexPath) as! PokedexTableViewCell
        let pokemons = pokemons[indexPath.row]
        
        cell.configure(viewModel: pokemons.toPokedexCellViewModel)
        
        return cell
    }
}

