//
//  SearchController.swift
//  MapaFGA
//
//  Created by Geovanni Oliveira de Jesus on 16/05/2018.
//  Copyright © 2018 Geovanni Oliveira de Jesus. All rights reserved.
//

import Foundation
import UIKit

class SearchController: UITableViewController, UISearchBarDelegate {
  
  
  @IBOutlet weak var searchBar: UISearchBar!
  var filteredData = [String]()
  var isSearching = false
  var sections = ["UAC", "UED","MESP"]
  var uac = ["I1","I2","I3","I4","I5","I6","I7","I8","I9","I10","S1","S2","S3","S4","S5","S6","S1","S7","S8","S9","S10"]
  var ued = ["Sala1","Sala2","Sala3","Sala4","Sala5","Sala6","Sala7","Sala8","Sala9","Sala10","Sala11","Sala12","Sala13","Sala14","Sala15","Sala16","Sala17","Sala18","Sala19","Sala20","Sala21","Sala22","Sala23","Sala24","Sala25","Sala26","Sala27","Sala28","Sala29","Sala30","Sala31","Sala32","Sala33","Sala34","Sala35","Sala36","Sala37"]
  var roomsUAC = [            ["I1","I2","I3","I4","I5","I6","I7","I8","I9","I10","S1","S2","S3","S4","S5","S6","S1","S7","S8","S9","S10"], //RoomsUAC
["Sala1","Sala2","Sala3","Sala4","Sala5","Sala6","Sala7","Sala8","Sala9","Sala10","Sala11","Sala12","Sala13","Sala14","Sala15","Sala16","Sala17","Sala18","Sala19","Sala20","Sala21","Sala22","Sala23","Sala24","Sala25","Sala26","Sala27","Sala28","Sala29","Sala30","Sala31","Sala32","Sala33","Sala34","Sala35","Sala36","Sala37"],//Rooms UED
    []
                  
  
  ]
  
  var favoriteController = FavoritesController()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    searchBar.delegate = self
    searchBar.returnKeyType = UIReturnKeyType.done
    
    let nib = UINib.init(nibName: "MapaFGATableViewCell", bundle: nil)
    self.tableView.register(nib, forCellReuseIdentifier: "cell")
    

  }

  override func numberOfSections(in tableView: UITableView) -> Int {
    return sections.count
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    if isSearching {
      return filteredData.count
    }
    return self.self.roomsUAC[section].count
  }

  override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return self.sections[section]
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MapaFGATableViewCell
    
    if isSearching {
      cell.roomName.text = self.filteredData[indexPath.row]
    } else {
        cell.roomName.text = self.roomsUAC[indexPath.section][indexPath.row]
    }

    return cell
  }

  
  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    
    if searchBar.text == nil || searchBar.text == "" {
      isSearching = false
      view.endEditing(true)
      tableView.reloadData()
    } else {
      isSearching = true
      filteredData = self.roomsUAC[0].filter({$0.contains(searchBar.text!)})
      filteredData.append(contentsOf: self.roomsUAC[1].filter({$0.contains(searchBar.text!)}))
//      filteredData.append(self.roomsUAC[1].filter({$0.contains(searchBar.text!)}))
      tableView.reloadData()
    }
    
  }
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    let allert = UIAlertController(title: "O que deseja?", message: "Ver mapa ou adicionar aos favoritos?", preferredStyle: .alert)
    
    let action1 = UIAlertAction(title: "Ver Mapa", style: .default) { (action:UIAlertAction) in
      if Int(indexPath.section) == 0 {
        
        Manager.sharedInstance.segmentedControlIndex = 1
        self.tabBarController?.selectedIndex = 1
        
        //      print(Manager.sharedInstance.segmentedControlIndex)
        
      } else if Int(indexPath.section) == 1 {
        
        Manager.sharedInstance.segmentedControlIndex = 2
        self.tabBarController?.selectedIndex = 1
        
        //      print(Manager.sharedInstance.segmentedControlIndex)
        
        
      } else if Int(indexPath.section) == 2{
        Manager.sharedInstance.segmentedControlIndex = 3
        self.tabBarController?.selectedIndex = 1
        
        //      print(Manager.sharedInstance.segmentedControlIndex)
        
      } else {
        
        //NOTHING TO DO
      }
      
    }
    allert.addAction(action1)
    
    let action2 = UIAlertAction(title: "Favoritar", style: .default) { (action:UIAlertAction) in
      Manager.sharedInstance.favoritePlaces.append(Place(name: self.roomsUAC[indexPath.section][indexPath.row], building: "UAC"))
      
      let allert2 = UIAlertController(title: "Adicionado com sucesso", message: "A sala foi favoritada com sucesso!", preferredStyle: .alert)
      
      let actionOK = UIAlertAction(title: "OK", style: .default, handler: { (action:UIAlertAction) in
        
        
      })
      allert2.addAction(actionOK)
      self.present(allert2,animated: true, completion:  nil)
    }
    
    allert.addAction(action2)
    self.present(allert, animated: true, completion: nil)
   
    
  }
  @IBAction func addI2(_ sender: Any) {
    Manager.sharedInstance.favoritePlaces.append(Place(name: "I2", building: "UAC"))
    let allert = UIAlertController(title: "Adicionado com sucesso", message: "A sala foi adicionada com sucesso.", preferredStyle: .alert)
    
    let action1 = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction) in
      print("You've pressed default");
    }
    
    allert.addAction(action1)
    self.present(allert, animated: true, completion: nil)
  }
  
  @IBAction func addSala4(_ sender: Any) {
    Manager.sharedInstance.favoritePlaces.append(Place(name: "Sala4", building: "UED"))
  }
  
  
}
