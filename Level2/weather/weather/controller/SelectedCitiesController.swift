//
//  FirstTableTableViewController.swift
//  weather
//
//  Created by Гюзель Маннанова on 03.01.2018.
//  Copyright © 2018 mif. All rights reserved.
//

import UIKit

class SelectedCitiesController: UITableViewController {

    let icons = City.getIconNames()
    let cityProvider = City()
    var cities: [String] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // хотим подгрузить данные из источника 1 раз, правильно ли это делать здесь?
        cities = cityProvider.getSelectedCities()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear")
        tableView.reloadData()
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return cities.count
    }
    

    /*
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?{
        return "section 2"
    } */


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    
        cell.textLabel?.text = cities[indexPath.row]
        cell.detailTextLabel?.text = String (indexPath.row)

        cell.imageView?.image = UIImage(named: icons[indexPath.row % 3])
        
        return cell
    }
 
    
    //метод для возврата на этот контреллер через unwind segue
    @IBAction func addNewCity(​​unwindSegue: UIStoryboardSegue){
        
        guard ​​unwindSegue.identifier == "addCity" else {
            return
        }
        
        let sourceController = ​​unwindSegue.source as! AllCitiesController
        if let selectedIndexPath = sourceController.tableView.indexPathForSelectedRow {
            let selectedCity = sourceController.allCities[selectedIndexPath.row]
            
            if !cities.contains(selectedCity) { // не вставляем дубли
                cityProvider.addSelected(selectedCity) // типа измениили в источнике
                cities.append(selectedCity) // изменили локально на форме

            }
        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Включаем возможность удаления строк слайдом
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the city
            cities.remove(at: indexPath.row)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
        tableView.reloadData()
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
