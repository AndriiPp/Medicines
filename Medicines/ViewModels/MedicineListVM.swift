//
//  MedicineListVM.swift
//  Medicines
//
//  Created by Nutella on 22.02.2022.
//

import Foundation
import UIKit

class MedicineListVM: NSObject {
   
    public var medicines : [Result] = []
    private var medicinesCount: Int { return medicines.count}
    var dataFetcherService = DataFetcherService()
    
    
}

extension MedicineListVM: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return medicinesCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let medecine = medicines[indexPath.row]
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as? MedicineCell else { return UITableViewCell()}
        cell.result = medecine
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
}
