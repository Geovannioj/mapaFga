//
//  FavoritesController.swift
//  MapaFGA
//
//  Created by Geovanni Oliveira de Jesus on 16/05/2018.
//  Copyright © 2018 Geovanni Oliveira de Jesus. All rights reserved.
//

import Foundation
import UIKit

class FavoritesController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  

  @IBOutlet weak var tableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.delegate = self
    tableView.dataSource = self
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(true)
    tableView.reloadData()
    
  }
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return Manager.sharedInstance.favoritePlaces.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    cell.textLabel?.text = Manager.sharedInstance.favoritePlaces[indexPath.row].name
    cell.detailTextLabel?.text = Manager.sharedInstance.favoritePlaces[indexPath.row].name
    
    return cell
  }
  
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
  }
  
}
