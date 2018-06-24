//
//  Manager.swift
//  MapaFGA
//
//  Created by Geovanni Oliveira de Jesus on 15/06/2018.
//  Copyright © 2018 Geovanni Oliveira de Jesus. All rights reserved.
//

import Foundation

class Manager {
  
  var segmentedControlIndex = 0
  var favoritePlaces: [Place] = []
  
  static let sharedInstance = Manager()
  
  init() {
    
  }
}
