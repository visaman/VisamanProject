//
//  DesignView.swift
//  VisaMan
//
//  Created by mac on 24/11/20.
//

import Foundation
import UIKit
@IBDesignable class DesignView:UIView
{
    var cornerRadius1: CGFloat = 10
    var shadowColor: UIColor? = UIColor.black
    var shadowOffsetWidth: Int = 0
    var shadowOffsetHeight: Int = 1
    var shadowOpacity1: CGFloat = 0.4
    
    override func layoutSubviews() {
        layer.cornerRadius = cornerRadius1
        layer.shadowColor = shadowColor?.cgColor
        layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight)
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius1)
        layer.shadowPath = shadowPath.cgPath
        layer.shadowOpacity = Float(shadowOpacity1)
    }
    
}

@IBDesignable class DesignLabel:UILabel
{
    var cornerRadius1: CGFloat = 5
    var shadowColor1: UIColor? = UIColor.black
    var shadowOffsetWidth: Int = 0
    var shadowOffsetHeight: Int = 1
    var shadowOpacity1: CGFloat = 0.4
    
    override func layoutSubviews() {
        layer.cornerRadius = cornerRadius1
        layer.shadowColor = shadowColor1?.cgColor
        layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight)
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius1)
        layer.shadowPath = shadowPath.cgPath
        layer.shadowOpacity = Float(shadowOpacity1)
    }
    
}
