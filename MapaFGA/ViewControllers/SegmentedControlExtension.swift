//
//  SegmentedControlExtension.swift
//  MapaFGA
//
//  Created by Geovanni Oliveira de Jesus on 23/05/2018.
//  Copyright © 2018 Geovanni Oliveira de Jesus. All rights reserved.
//

import UIKit

extension UISegmentedControl {
  /// Present segments one below the other vertically.
  /// Be sure to re-set after inserting segments.
  var vertical : Bool {
    get {
      return fabs(transform.b) > 0.001
    }
    set {
      // rotate view
      self.transform = newValue ? CGAffineTransform(rotationAngle: CGFloat(Double.pi/2)) : CGAffineTransform.identity
      
      let padding : CGFloat = 8
      let maxSize = CGSize(width: CGFloat.greatestFiniteMagnitude, height: CGFloat.greatestFiniteMagnitude)
      var size : CGSize
      var maxHeight : CGFloat = 0
      var totalWidth : CGFloat = 0
      
      // reverse rotate segment content
      for segment in subviews {
        for contentView in segment.subviews {
          size = contentView.sizeThatFits(maxSize)
          maxHeight = max(maxHeight, newValue ? size.width : size.height)
          totalWidth += (newValue ? size.height : size.width) + padding
          contentView.transform = newValue ? CGAffineTransform(rotationAngle: -CGFloat(Double.pi/2)) : CGAffineTransform.identity
        }
      }
      
      // adjust size
      bounds = CGRect(x: 0, y: 0, width: totalWidth + padding, height: maxHeight + 2*padding)
    }
  }
  
  func scaleToFit(size: CGSize) { // keeps aspect ratio
    var frameSize = bounds.size
    if vertical { swap(&frameSize.width, &frameSize.height) }
    let scale = min(size.width / frameSize.width, size.height / frameSize.height)
    if scale < 1 {
      transform = transform.scaledBy(x: scale, y: scale)
      
    }
  }
}
