//
//  colorString.swift
//  wbzhan
//
//  Created by design on 2020/12/3.
//  Copyright © 2020年 design. All rights reserved.
//

import Foundation
import UIKit
@objc
public extension UIColor {
    
    @objc class func colorSrting(_ string: String) -> UIColor {
        return self.colorSrting(string, alpha: 1.0)
    }
    class func colorSrting(_ string: String, alpha: CGFloat) -> UIColor {
        
        var colorString : String!
        if (string.hasPrefix("#")) {
            colorString = String(string.suffix(string.count - 1))
        }
        if (colorString == nil || colorString.count != 6) {
            return UIColor.black
        }
        let rString = String(colorString.prefix(2))
        let gIndex = string.index(colorString.startIndex, offsetBy: 2)
        let gStr = String(colorString.suffix(from: gIndex))
        let gString = String(gStr.prefix(2))
        
        let bString = String(colorString.suffix(2))
        
        var r:CUnsignedInt = 0, g:CUnsignedInt = 0, b:CUnsignedInt = 0;
        
        Scanner(string: rString).scanHexInt32(&r)
        
        Scanner(string: gString).scanHexInt32(&g)
        
        Scanner(string: bString).scanHexInt32(&b)
                
        return UIColor(red:CGFloat(r) / 255.0,
                       green:CGFloat(g) / 255.0,
                       blue:CGFloat(b) / 255.0,
                       alpha: alpha)
    }
    
    class func rgbColor(_ red:Int,_ green:Int,_ blue:Int) -> UIColor {
        return UIColor.rgbaColor(red, green, blue, 1.0)
    }
    
    class func rgbaColor(_ red:Int,_ green:Int,_ blue:Int ,_ alpha:CGFloat) -> UIColor {
        return UIColor(red:CGFloat(red) / 255.0,
                       green:CGFloat(green) / 255.0,
                       blue:CGFloat(blue) / 255.0,
                       alpha: alpha)
    }
}
