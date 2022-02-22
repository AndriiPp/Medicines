//
//  DetailVC.swift
//  Medicines
//
//  Created by Nutella on 22.02.2022.
//

import UIKit

class DetailVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
   
    var result: Result?
    
    let detailVM: MedicineDetailVM = MedicineDetailVM.init()
    let defaultsHelper : UserDefaultsHelper = UserDefaultsHelper.init()
    
    @IBAction func saveClick(_ sender: Any) {
        if let arr = defaultsHelper.getArr() {
            defaultsHelper.setArr(results: checkData(result: result, results: arr))
        } else {
            defaultsHelper.setArr(results: [result!])
        }
        loadMainVC()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
    }
    
    // MARK: - Setup Views
    
    private func setupTableView(){
       
        tableView.dataSource = detailVM
        tableView?.estimatedRowHeight = 1000
        tableView?.rowHeight = UITableView.automaticDimension
        tableView.register(UINib(nibName: "DetailCell", bundle: nil), forCellReuseIdentifier: "detailId")
       
        loadDate()
    }

 

    
    private func loadDate(){
            guard let myResult = result else { return }
            detailVM.result.append(myResult)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        
    }
    private func checkData(result: Result?, results: [Result]) -> [Result]{
        guard let myResult = result else { return results}
        for i in results {
            if i.id == myResult.id {
                return results
            }
        }
        var myResults: [Result] = results
        myResults.append(myResult)
        return myResults
    }
    
    private func loadMainVC(){
        let vc = VSBuilder.createMainVC()
        self.present(vc, animated: true, completion: nil)
    }
}
