//
//  ViewController.swift
//  Medicines
//
//  Created by Nutella on 21.02.2022.
//

import UIKit

class ListVC: UIViewController, UISearchBarDelegate, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var nextLink: String?
    let medicineListVM : MedicineListVM = MedicineListVM.init()
    let defaultsHelper : UserDefaultsHelper = UserDefaultsHelper.init()
    
    let searchController = UISearchController(searchResultsController: nil)
    var medicines : [Result] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        setupSearchBar()
       
    }
    
    // MARK: - Setup Views
    
    private func setupTableView(){
        
        tableView.dataSource = medicineListVM
        tableView.delegate = self
        tableView?.estimatedRowHeight = 1000
        tableView?.rowHeight = UITableView.automaticDimension
        tableView.register(MedicineCell.self, forCellReuseIdentifier: "cellId")
        checkInternet()
    }
    
    private func checkInternet(){
        if Reachability.isConnectedToNetwork(){
            loadDate(str: URLEnum.allUrlMedicines.rawValue)
            
        } else {
            getArr()
            
        }
    }
    
    // MARK: - Logic
    private func getDate(){
        guard let link = nextLink else {return}
        loadDate(str: link)
    }
    
    private func getArr(){
        if let arr =  defaultsHelper.getArr()  {
            self.medicines += arr
            medicineListVM.medicines += arr
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    private func loadDate(str: String){
        medicineListVM.dataFetcherService.fetchAllMedicines(urlMedicines: str, completion: { [self] medicines in
            guard let listResult = medicines?.results else {return}
            self.medicines += listResult
            self.nextLink = medicines?.next
            medicineListVM.medicines += listResult
            DispatchQueue.main.async {
                tableView.reloadData()
            }
        })
    }
    
    
    private func loadSearchData(str: String){
        medicineListVM.dataFetcherService.fetchSearchMedicines(searchWord: str) { [self] medicines in
            guard let listResult = medicines?.results else {return}
            
            self.medicines = listResult
            medicineListVM.medicines = listResult
            self.nextLink = medicines?.next
            DispatchQueue.main.async {
                tableView.reloadData()
            }
        }
    }

    private func loadDetailVC(id: Int){
        medicineListVM.dataFetcherService.fetchSelectMedicine(id: "\(id)") { result in
            guard let myResult = result else { return }
            let vc = VSBuilder.createDetailVC() as! DetailVC
            vc.result = myResult
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    private func loadDetailVCWhenNoInternet(result: Result){
        
            let vc = VSBuilder.createDetailVC() as! DetailVC
            vc.result = result
            self.navigationController?.pushViewController(vc, animated: true)
        
    }
}

extension ListVC {
   public func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastIndex = self.medicines.count - 1
        if indexPath.row == lastIndex {
            getDate()
        }
    }
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let id = medicines[indexPath.row].id {
            if Reachability.isConnectedToNetwork() {
                loadDetailVC(id: id)
            } else {
                loadDetailVCWhenNoInternet(result: medicines[indexPath.row])
            }
        }
    }
    



}

extension ListVC {
    private func setupSearchBar(){
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = "Search"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    private func searchBarIsEmpty() -> Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
}

extension ListVC: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        if  searchBarIsEmpty() {
            loadDate(str: URLEnum.allUrlMedicines.rawValue)
        } else {
            loadSearchData(str: searchController.searchBar.text!)
        }
    }
    
}



