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
                    FunctionConstants.shared.logMessage(message: "Request: \(String(describing: data))")
                    self.dataArray = pokemonList!
                }
                catch {
                    FunctionConstants.shared.logMessage(message: "Error: \(error)")
                }
            }
        }
        .resume()
    }
}

extension Data {
    func datafilter(removeString string: String) -> Data? {
        let dataString = String(data:self, encoding: .utf8)
        let parsedData = dataString?.replacingOccurrences(of: string, with: "")
        guard let data = parsedData?.data(using: .utf8) else { return nil }
        return data
    }
}
