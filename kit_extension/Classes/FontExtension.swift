//
//  FontExtension.swift
//  wbzhan
//
//  Created by design on 2020/12/3.
//  Copyright © 2020年 design. All rights reserved.
//

import Foundation
import UIKit
public var KitFontNameRegular = "PingFangSC-Regular"//平方细体
public var KitFontNameMedium = "PingFangSC-Medium"//平方中粗体
public var KitFontNameBold = "PingFangSC-Medium"//平方中粗体

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

