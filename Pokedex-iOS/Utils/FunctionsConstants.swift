//
//  FunctionsConstants.swift
//  Pokedex-iOS
//
//  Created by Esther Huecas on 13/1/22.
//

import Foundation

class FunctionConstants {
    static let shared = FunctionConstants()
    
    //MARK: Logs
    //Parameter send: String(message)
    //Parameter return: void => Print for console
    func logMessage(message: String) {
        print("\(message)")
    }
    
    //MARK: DecodeAnyObjectDTO
    //Parameter send: Data(response) & Object Type
    //Parameter return: Object (Object Type entry)
    func decode<T>(data: Data?, modelType: T.Type) -> T where T: Decodable {
        let myStruct = try! JSONDecoder().decode(modelType, from: data!)
        return myStruct
    }
}
