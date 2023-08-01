//
//  FontExtension.swift
//  wbzhan
//
//  Created by design on 2020/12/3.
//  Copyright © 2020年 design. All rights reserved.
//

import Foundation
import UIKit
public var KitFontNameRegular = "Futura-Book"
public var KitFontNameMedium = "Futura-Medium"
public var KitFontNameBold = "Futura-Medium"

@objc public extension UIFont {
    //regular
    @objc class func font(_ size: CGFloat) -> UIFont {
        return UIFont.init(name: KitFontNameRegular, size: size) ?? UIFont.systemFont(ofSize: size)
    }
    //medium
    @objc class func mediumFont(_ size:CGFloat ) ->UIFont {
        return UIFont.init(name: KitFontNameMedium, size: size) ?? UIFont.boldSystemFont(ofSize: size)
    }
    //semibold
    @objc class func semiboldFont(_ size: CGFloat) -> UIFont {
        return UIFont.init(name: KitFontNameBold, size: size) ?? UIFont.boldSystemFont(ofSize: size)
    }
}

