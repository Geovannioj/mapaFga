//
//  TableViewCell.swift
//  MapaFGA
//
//  Created by Geovanni Oliveira de Jesus on 21/06/2018.
//  Copyright © 2018 Geovanni Oliveira de Jesus. All rights reserved.
//

import UIKit

class MapaFGATableViewCell: UITableViewCell {

  @IBOutlet weak var roomName: UILabel!
  @IBOutlet weak var favoriteButton: UIButton!
  
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
  @IBAction func favoriteAction(_ sender: Any) {
    
  }
  
}
