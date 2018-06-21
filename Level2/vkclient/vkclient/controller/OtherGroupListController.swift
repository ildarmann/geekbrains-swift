//
//  OtherGroupListController.swift
//  vkclient
//
//  Created by Ильдар on 08.05.2018.
//  Copyright © 2018 mif. All rights reserved.
//

import UIKit

private let OTHER_GROUP_LIST_CELL_ID = "OtherGroupListCellID"



class OtherGroupListController: UIViewController {
    //let vkDataProvider: VkDataProvider = VkDataProvider()
    
    @IBOutlet weak var tableView: UITableView!
    
    let searchController = UISearchController(searchResultsController: nil)
    
    var otherGroupsToShow: [VkGroup]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup the Search Controller
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Введите название группы"
        navigationItem.searchController = searchController
        definesPresentationContext = true

        // Do any additional setup after loading the view.
        otherGroupsToShow = VkDataProvider.getOtherGroups()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension OtherGroupListController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if let otherGroups = otherGroupsToShow {
            return otherGroups.count
        } else {
            return 0
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: OTHER_GROUP_LIST_CELL_ID, for: indexPath) as! OtherGroupListCell
        
        
        if let otherGroups = otherGroupsToShow {
            let otherGroup = otherGroups[indexPath.row]
            cell.name.text = otherGroup.name
            cell.foto.image = otherGroup.foto
            cell.memberCount.text = String(otherGroup.memberCount)
        }
        return cell

    }
    
    
    func filterGroupsByName(_ searchText: String)  {
        print("filterGroupsByName.searchText = \(searchText)")
        if searchText.isEmpty {
            otherGroupsToShow = VkDataProvider.getOtherGroups()
        } else {
            otherGroupsToShow = VkDataProvider.getOtherGroups().filter({( group : VkGroup) -> Bool in
                return group.name.lowercased().contains(searchText.lowercased())
            })
        }
        tableView.reloadData()
    }
        
}

extension OtherGroupListController: UITableViewDelegate {
    
    // срабатывает при выборе строки в таблице
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("нажата строка № \(indexPath.row) в секции \(indexPath.section)")
        if let otherGroups = otherGroupsToShow {
            let selectedGroup = otherGroups[indexPath.row]
            VkDataProvider.addToMyGroups(selectedGroup.id) // добавили выбранную группу в список моих групп
        }
       
    }
}

extension OtherGroupListController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterGroupsByName(searchController.searchBar.text!)
    }
}




