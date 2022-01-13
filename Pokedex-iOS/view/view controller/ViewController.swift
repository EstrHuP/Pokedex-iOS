//
//  ViewController.swift
//  Pokedex-iOS
//
//  Created by Esther Huecas on 13/1/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ui_chargeActivity_lai: UIActivityIndicatorView!
    @IBOutlet weak var ui_tablePokemons_tv: UITableView!
    
    var listPokemonVM = ListPokemonViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        bindViewToViewModel()
    }

    private func configureView() {
        self.ui_chargeActivity_lai.startAnimating()
        self.ui_chargeActivity_lai.isHidden = false
        listPokemonVM.getAllPokemon() //api call
    }
    
    private func bindViewToViewModel() {
        listPokemonVM.refreshData = { [weak self] () in
            DispatchQueue.main.async {
                self?.ui_tablePokemons_tv.reloadData()
                self?.ui_chargeActivity_lai.stopAnimating()
                self?.ui_chargeActivity_lai.isHidden = true
            }
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listPokemonVM.dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listPokemonCell")!
        
        let object = listPokemonVM.dataArray[indexPath.row]
        
        cell.textLabel?.text = object.name
        cell.detailTextLabel?.text = object.id.description
        
        return cell
    }
}

