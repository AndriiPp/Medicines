//
//  UserDefaultsHelper.swift
//  Medicines
//
//  Created by Nutella on 22.02.2022.
//

import Foundation

class UserDefaultsHelper {
    func getArr() -> [Result]?{
        if let savedArr = UserDefaults.standard.object(forKey: "savedArr") as? Data {
            let decoder = JSONDecoder()
            if let loadedArr = try? decoder.decode([Result].self, from: savedArr) {
               return loadedArr
            }
        }
        return nil
    }
    
    func setArr(results: [Result]){
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(results) {
            let defaults = UserDefaults.standard
            defaults.set(encoded, forKey: "savedArr")
        }
    }
}
