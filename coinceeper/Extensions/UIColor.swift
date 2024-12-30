//
//  UIColor.swift
//  coinceeper
//
//  Created by Yasin Dalkılıç on 29.12.2024.
//

import Foundation
import UIKit

extension UIColor {
    
    
    
    static func getGradientLayer(bounds : CGRect, colors: [UIColor]?) -> CAGradientLayer{
    let gradient = CAGradientLayer()
    gradient.frame = bounds
    //order of gradient colors
    gradient.colors = colors?.map({$0.cgColor})
    // start and end points
    gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
    gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
    return gradient
    }
    
    static func gradientColor(bounds: CGRect, gradientLayer :CAGradientLayer) -> UIColor? {
    UIGraphicsBeginImageContext(gradientLayer.bounds.size)
      //create UIImage by rendering gradient layer.
    gradientLayer.render(in: UIGraphicsGetCurrentContext()!)
    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
      //get gradient UIcolor from gradient UIImage
    return UIColor(patternImage: image!)
    }
    
}

extension UIColor {
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}
