//
//  MedicineDetailVM.swift
//  Medicines
//
//  Created by Nutella on 22.02.2022.
//

import Foundation
import UIKit

class MedicineDetailVM : NSObject {
    public var result : [Result] = []
    var dataFetcherService = DataFetcherService()
    
}

extension MedicineDetailVM : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return result.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let medecine = result[indexPath.row]
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "detailId", for: indexPath) as? DetailCell else { return UITableViewCell()}
        cell.result = medecine
        return cell
    }
}
