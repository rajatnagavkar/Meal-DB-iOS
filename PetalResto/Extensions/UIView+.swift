//
//  UIView+.swift
//  PetalResto
//
//  Created by Rajat Nagavkar on 5/17/22.
//

import Foundation
import UIKit

extension UIView {
  func anchor(top: NSLayoutYAxisAnchor?,left: NSLayoutXAxisAnchor?, right: NSLayoutXAxisAnchor?,bottom: NSLayoutYAxisAnchor?,paddingTop: CGFloat,paddingLeft: CGFloat,paddingRight: CGFloat,paddingBottom: CGFloat,width: CGFloat,height: CGFloat){
    translatesAutoresizingMaskIntoConstraints = false
    if let top = top{
      self.topAnchor.constraint(equalTo: top,constant: paddingTop).isActive = true
    }
    if let left = left {
      self.leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
    }
    if let right = right{
      self.rightAnchor.constraint(equalTo: right, constant: paddingRight).isActive = true
    }
    if let bottom = bottom {
      self.bottomAnchor.constraint(equalTo: bottom, constant: paddingBottom).isActive = true
    }
    if width != 0{
      widthAnchor.constraint(equalToConstant: width).isActive = true
    }
    if height != 0 {
      heightAnchor.constraint(equalToConstant: height).isActive = true
    }
  }
}
