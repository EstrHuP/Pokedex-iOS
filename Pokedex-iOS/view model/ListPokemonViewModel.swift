//
//  ListPokemonViewModel.swift
//  Pokedex-iOS
//
//  Created by Esther Huecas on 13/1/22.
//

import Foundation

class ListPokemonViewModel {
    
    //Connect View to ViewModel
    var refreshData = { () -> () in }
    
    //Data
    var dataArray: [Pokemon] = [] {
        didSet {
            refreshData()
        }
    }
    
    //Get data's API
    func getAllPokemon() {
        
        let currentURL: String = ServicesConstants.baseURL
        
        var request = URLRequest(url: NSURL(string: currentURL)! as URL)
        request.addValue("pokedex2.p.rapidapi.com", forHTTPHeaderField: "x-rapidapi-host")
        request.addValue("3ea7a7f534msh2f9b30f141d322cp1a7f3bjsnf991fd396886", forHTTPHeaderField: "x-rapidapi-key")

        request.httpMethod = "GET"
        
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            if error == nil && data != nil {
                do {
                    let pokemonList = try? JSONDecoder().decode([Pokemon].self, from: data!)
                    self.dataArray = pokemonList!
                    FunctionConstants.shared.logMessage(message: "Request: \(String(describing: pokemonList))")
                }
                catch {
                    FunctionConstants.shared.logMessage(message: "Error: \(error)")
                }
            }
        }
        .resume()
    }
}
