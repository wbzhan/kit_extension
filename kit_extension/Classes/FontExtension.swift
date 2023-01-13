//
//  FontExtension.swift
//  wbzhan
//
//  Created by design on 2020/12/3.
//  Copyright © 2020年 design. All rights reserved.
//

import Foundation
import UIKit

@objc public extension UIFont {
    //regular
    @objc class func font(_ size: CGFloat) -> UIFont {
        return UIFont.init(name: "Futura-Book", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    //medium
    @objc class func mediumFont(_ size:CGFloat ) ->UIFont {
        return UIFont.init(name: "Futura-Medium", size: size) ?? UIFont.boldSystemFont(ofSize: size)
    }
    //semibold
    @objc class func semiboldFont(_ size: CGFloat) -> UIFont {
        return UIFont.init(name: "Futura-Medium", size: size) ?? UIFont.boldSystemFont(ofSize: size)
    }
}
