//
//  DataFetcherService.swift
//  Medicines
//
//  Created by Nutella on 22.02.2022.
//

import Foundation

class DataFetcherService {
    
    var networkDataFetcher: DataFetcher
    
    init(networkDataFetcher: DataFetcher = NetworkDataFetcher()) {
        self.networkDataFetcher = networkDataFetcher
       
    }
    
    func fetchAllMedicines(urlMedicines: String, completion: @escaping (Medicines?) -> Void) {
        networkDataFetcher.fetchGenericJSONData(urlString: urlMedicines, response: completion)
    }
    
    func fetchSearchMedicines(searchWord: String, completion: @escaping (Medicines?) -> Void) {
        
        let urlMedicines = "https://api.pills-prod.sdh.com.ua/v1/medicine/?search=\(searchWord)"
        if let encoded = urlMedicines.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed) {
            networkDataFetcher.fetchGenericJSONData(urlString: encoded, response: completion)
        } else {
            
            networkDataFetcher.fetchGenericJSONData(urlString: urlMedicines, response: completion)
        }
    }
    func fetchSelectMedicine(id: String, completion: @escaping (Result?) -> Void) {
        let urlMedicines = "https://api.pills-prod.sdh.com.ua/v1/medicine/\(id)"
        networkDataFetcher.fetchGenericJSONData(urlString: urlMedicines, response: completion)
    }
}
