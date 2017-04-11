//
//  ViewController.swift
//  MilesMeter
//
//  Created by Myroslav Kolodii on 03/03/2017.
//  Copyright © 2017 unagit. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    // MARK: Outlets
    @IBOutlet weak var valueTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Properties
    fileprivate let searchController = UISearchController(searchResultsController: nil)
    fileprivate let cellReuseIdentifier = "searchTableCell"
    fileprivate let resultsVCIdentifier = "resultsViewController"
    fileprivate var filteredCandies = [Candy]()
    fileprivate let units = Unit.getUnits()
    
    fileprivate let candies = [
        Candy(category:"Chocolate", name:"Chocolate Bar"),
        Candy(category:"Chocolate", name:"Chocolate Chip"),
        Candy(category:"Chocolate", name:"Dark Chocolate"),
        Candy(category:"Hard", name:"Lollipop"),
        Candy(category:"Hard", name:"Candy Cane"),
        Candy(category:"Hard", name:"Jaw Breaker"),
        Candy(category:"Other", name:"Caramel"),
        Candy(category:"Other", name:"Sour Chew"),
        Candy(category:"Other", name:"Gummi Bear")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Delegates
        valueTextField.delegate = self
        tableView.delegate = self
        
        // Initialize SearchController
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
        // searchController.searchBar.scopeButtonTitles = ["All", "Chocolate", "Hard", "Other"]
        searchController.searchBar.delegate = self
    }

    
    
        // MARK:Helpers
    
    func filterContentForSearchText(searchText: String, scope: String = "All") {
        filteredCandies = candies.filter { candy in
            let categoryMatch = (scope == "All") || (candy.category == scope)
            return categoryMatch && candy.name.lowercased().contains(searchText.lowercased())
        }
        
        tableView.reloadData()
        
    }
    
    


}

extension ViewController: UISearchResultsUpdating {
    
    // MARK: SearhTab delegate functions
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        
        if let titles = searchBar.scopeButtonTitles {
            let scope = titles[searchBar.selectedScopeButtonIndex]
            filterContentForSearchText(searchText: searchController.searchBar.text!, scope: scope)
        
        } else {
        
            filterContentForSearchText(searchText: searchController.searchBar.text!)
        }
        
        
        
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    // MARK: Table View delegate functions
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        /*
        if searchController.isActive && searchController.searchBar.text != "" {
            return filteredCandies.count
        }
        return candies.count
        */
        
        return units.count
    
    
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) else {
            return UITableViewCell()
        }
        
        /*
        
        let candy: Candy
        if searchController.isActive && searchController.searchBar.text != "" {
            candy = filteredCandies[indexPath.row]
        } else {
            candy = candies[indexPath.row]
        }
        
        cell.textLabel?.text = candy.name
        cell.detailTextLabel?.text = candy.category
        */
        
        let unit = units[indexPath.row]
        var title = unit.name
        let upperCased = String(title[title.startIndex]).uppercased()
        title.replaceSubrange(title.startIndex...title.startIndex, with: upperCased)
        
        cell.textLabel?.text = title
        cell.detailTextLabel?.text = unit.shortname

 
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let unitID = indexPath.row
        
        let resultsVC = storyboard?.instantiateViewController(withIdentifier: resultsVCIdentifier) as! ResultsViewController
        resultsVC.unitID = unitID
        navigationController?.pushViewController(resultsVC, animated: true)
        
    }
}

extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        filterContentForSearchText(searchText: searchBar.text!, scope: searchBar.scopeButtonTitles![selectedScope])
    }
    
    
    
}
