//
//  ListPokemonViewModel.swift
//  Pokedex-iOS
//
//  Created by Esther Huecas on 13/1/22.
//

import Foundation
import Alamofire

class ListPokemonViewModel {
    
    //Connect View to ViewModel
    var refreshData = { () -> () in }
    
    //Data
    var dataArray: [Pokedex] = [] {
        didSet {
            refreshData()
        }
    }
    
    //Get data's API
    func getAllPokemon(completion: @escaping ([Pokedex]) -> Void ) {
        
        let url = ServicesConstants.baseURL
        var request = URLRequest(url: NSURL(string: url)! as URL)
        request.addValue("pokedex2.p.rapidapi.com", forHTTPHeaderField: "x-rapidapi-host")
        request.addValue("3ea7a7f534msh2f9b30f141d322cp1a7f3bjsnf991fd396886", forHTTPHeaderField: "x-rapidapi-key")
        
        //MARK: Alamofire
        AF.request(request).responseDecodable { (response: DataResponse<[Pokedex], AFError>) in
            switch response.result {
            case .success(let pokemons):
                print(pokemons)
                completion(pokemons)
            case .failure(let error):
                print(error)
            }
        }.validate()
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
