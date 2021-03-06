//
//  ViewController.swift
//  MilesMeter
//
//  Created by Myroslav Kolodii on 03/03/2017.
//  Copyright © 2017 unagit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: Outlets
    @IBOutlet weak var valueTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var containerView: UIView!
    
    // Constraints
    @IBOutlet weak var heightPropotionForValueTextFieldConstraint: NSLayoutConstraint!
    
    
    // MARK: Properties
    fileprivate let searchController = UISearchController(searchResultsController: nil)
    fileprivate let cellReuseIdentifier = "searchTableCell"
    fileprivate let resultsVCIdentifier = "resultsViewController"
    fileprivate let units = Unit.getUnits()
    fileprivate var filteredUnits = [Unit]()
    fileprivate var userIsTyping = false
    fileprivate var results = [[String: String]]()
    fileprivate let brain = Brain()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Delegates
        valueTextField.delegate = self
        tableView.delegate = self
        
        // Initialize SearchController
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = true
        searchController.hidesNavigationBarDuringPresentation = false
        // definesPresentationContext = false
        tableView.tableHeaderView = searchController.searchBar
        searchController.searchBar.scopeButtonTitles = []
        searchController.searchBar.delegate = self
        
        // Change style of Value TextField
        /*
        valueTextField.backgroundColor = UIColor.yellow
        valueTextField.layer.borderWidth = 2
        valueTextField.layer.cornerRadius = 10
        valueTextField.layer.shadowRadius = 5
        valueTextField.layer.shadowColor = UIColor.red.cgColor
        valueTextField.layer.borderColor = UIColor.brown.cgColor
        */
        
        containerView.layer.borderWidth = 2
        containerView.layer.cornerRadius = 10
        containerView.layer.borderColor = UIColor.brown.cgColor
        
    }

    
    
    // MARK:Helpers
    func filterContentForSearchText(searchText: String) {
        
        // Filter results according to user's input
        filteredUnits = units.filter { unit in
            return unit.name.lowercased().contains(searchText.lowercased())
        }
        
        tableView.reloadData()
        
        
        /*
        filteredCandies: candies.filter { candy in
            let categoryMatch: (scope:= "All") || (candy.category:= scope)
            return categoryMatch && candy.name.lowercased().contains(searchText.lowercased())
        }
        
        tableView.reloadData()
        */
    }
    
    
    
    
}

extension ViewController: UISearchResultsUpdating {
    
    // MARK: SearhTab delegate functions
    func updateSearchResults(for searchController: UISearchController) {
        
        userIsTyping = true
        filterContentForSearchText(searchText: searchController.searchBar.text!)
        
        /*
        let searchBar: searchController.searchBar
        
        if let titles: searchBar.scopeButtonTitles {
            let scope: titles[searchBar.selectedScopeButtonIndex]
            filterContentForSearchText(searchText: searchController.searchBar.text!, scope: scope)
        
        } else {
        
            filterContentForSearchText(searchText: searchController.searchBar.text!)
        }
        */
        
        
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
        
        if userIsTyping {
            return filteredUnits.count
        } else {
            // print(results.count)
            return results.count
        }
        
    
    
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) else {
            return UITableViewCell()
        }
        
        if userIsTyping {
            
            let unit = filteredUnits[indexPath.row]
            var title = unit.name
            let upperCased = String(title[title.startIndex]).uppercased()
            title.replaceSubrange(title.startIndex...title.startIndex, with: upperCased)
            
            cell.textLabel?.text = title
            cell.detailTextLabel?.text = unit.name
            
            return cell
            
        } else {
            
            let result = results[indexPath.row]
            cell.textLabel?.text = result["name"]
            cell.detailTextLabel?.text = result["value"]
            return cell
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        userIsTyping = false
        let currentUnit = filteredUnits[indexPath.row]
        guard let value = valueTextField.text, let doubleValue = Double(value) else {
            // No value provided by a user in text field
            return
        }
        
        self.results = brain.getConvertedUnits(currentUnit, value: doubleValue)
        // print(results)
        
        
        tableView.reloadData()
        
    }
}


extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        //filterContentForSearchText(searchText: searchBar.text!, scope: searchBar.scopeButtonTitles![selectedScope])
    }
    
}

extension ViewController: UITextFieldDelegate {
    
    
}
 

    

