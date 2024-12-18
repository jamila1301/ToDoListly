//
//  UIColor+Extensions.swift
//  ToDoListly
//
//  Created by Jamila Mahammadli on 10.11.24.
//

import UIKit

extension UIColor {
    convenience init(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
        
        var rgb: UInt64 = 0
        Scanner(string: hexSanitized).scanHexInt64(&rgb)
        
        let red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgb & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
    
    static let blueColor = UIColor(hex: "#0560FD") 
    static let blackColor = UIColor(hex: "#000000")
    static let greyColor = UIColor(hex: "#6E717A")
    static let lightGreyColor = UIColor(hex: "#F6F6F6")
    static let softGreyColor = UIColor(hex: "#EEEEEE")
    static let whiteColor = UIColor(hex: "#FFFFFF")
    static let redColor = UIColor(hex: "#FF0000")
    static let greenColor = UIColor(hex: "#00FF00")
    static let yellowColor = UIColor(hex: "#FFFF00")
}



