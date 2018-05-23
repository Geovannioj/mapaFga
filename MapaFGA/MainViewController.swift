//
//  ViewController.swift
//  MapaFGA
//
//  Created by Geovanni Oliveira de Jesus on 14/05/2018.
//  Copyright © 2018 Geovanni Oliveira de Jesus. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

  @IBOutlet weak var segmentedControl: UISegmentedControl!
  
  @IBOutlet weak var mapImage: UIImageView!
  @IBOutlet weak var subView: UIView!
  
  override func viewDidLoad() {
    super.viewDidLoad()

    
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBAction func changeMap(_ sender: Any) {
    
    switch segmentedControl.selectedSegmentIndex {
    case 0:
      mapImage.image = UIImage(named: "mapaGeral")
      
      break
    case 1:
      mapImage.image = UIImage(named: "UEDPlanta")
      break
    case 2:
      mapImage.image = UIImage(named: "UEDPlanta")
      break
    case 3:
      mapImage.image = UIImage(named: "UEDPlanta")
      break
    
    default: break
      
    }
  }
  

}

