//
//  UIButtonExtension.swift
//  wbzhan
//
//  Created by design on 2020/12/3.
//  Copyright © 2020年 design. All rights reserved.
//

import Foundation
import UIKit

@objc public enum Position : Int {
         case  imageLeft  // 图片在左，文字在右，默认
         case  imageRight     // 图片在右，文字在左
         case  imageTop      // 图片在上，文字在下
         case  imageBottom   // 图片在下，文字在上
   }


func associatedObject<ValueType: AnyObject>(
    base: AnyObject,
    key: UnsafePointer<UInt8>,
    initialiser: () -> ValueType)
    -> ValueType {
        if let associated = objc_getAssociatedObject(base, key)
            as? ValueType { return associated }
        let associated = initialiser()
        objc_setAssociatedObject(base, key, associated,
                                 .OBJC_ASSOCIATION_RETAIN)
        return associated
}
func associateObject<ValueType: AnyObject>(
    base: AnyObject,
    key: UnsafePointer<UInt8>,
    value: ValueType) {
    objc_setAssociatedObject(base, key, value,
                             .OBJC_ASSOCIATION_RETAIN)
}
 
private var topKey: UInt8 = 0
private var bottomKey: UInt8 = 0
private var leftKey: UInt8 = 0
private var rightKey: UInt8 = 0

@objc public extension UIButton {
    
   private var topEdg: NSNumber {
        get {
            return associatedObject(base: self, key: &topKey)
            { return 0 }
        }
        set {
            associateObject(base: self, key: &topKey, value: newValue)
        }
    }
    
    private var bottomEdg: NSNumber {
        get {
            return associatedObject(base: self, key: &bottomKey)
            { return 0 }
        }
        set {
            associateObject(base: self, key: &bottomKey, value: newValue)
        }
    }
    
    private var leftEdg: NSNumber {
        get {
            return associatedObject(base: self, key: &leftKey)
            { return 0 }
        }
        set {
            associateObject(base: self, key: &leftKey, value: newValue)
        }
    }
    
    private var rightEdg: NSNumber {
        get {
            return associatedObject(base: self, key: &rightKey)
            { return 0 }
        }
        set {
            associateObject(base: self, key: &rightKey, value: newValue)
        }
    }
    //扩大按钮点击范围
    func setEnlargeEdge(top: Float, bottom: Float, left: Float, right: Float) {
        self.topEdg = NSNumber.init(value: top)
        self.bottomEdg = NSNumber.init(value: bottom)
        self.leftEdg = NSNumber.init(value: left)
        self.rightEdg = NSNumber.init(value: right)
    }
    
    private func enlargedRect() -> CGRect {
        let top = self.topEdg
        let bottom = self.bottomEdg
        let left = self.leftEdg
        let right = self.rightEdg
        if top.floatValue >= 0, bottom.floatValue >= 0, left.floatValue >= 0, right.floatValue >= 0 {
            return CGRect.init(x: self.bounds.origin.x - CGFloat(left.floatValue),
                               y: self.bounds.origin.y - CGFloat(top.floatValue),
                               width: self.bounds.size.width + CGFloat(left.floatValue) + CGFloat(right.floatValue),
                               height: self.bounds.size.height + CGFloat(top.floatValue) + CGFloat(bottom.floatValue))
        }
        else {
            return self.bounds
        }
    }
    
     override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        let rect = self.enlargedRect()
        if rect.equalTo(self.bounds) {
            return super.point(inside: point, with: event)
        }
        return rect.contains(point) ? true : false
    }
    
    ///设置文字图片间隔
    func setImagePisition(postion:Position , spacing: CGFloat)
    {
        self.layoutIfNeeded()
        
        let imageWidth = self.imageView?.image?.size.width ?? 0
        let imageHeight = self.imageView?.image?.size.height ?? 0
        let txtStr = NSString.init(string: self.titleLabel?.text ?? "")
        
        var labelWidth = txtStr.size(withAttributes: [NSAttributedString.Key.font:self.titleLabel!.font ?? UIFont.systemFontSize]).width
        
        let labelHeight = txtStr.size(withAttributes: [NSAttributedString.Key.font:self.titleLabel!.font ?? UIFont.systemFontSize]).height

        if (postion == Position.imageLeft && labelWidth >= CGFloat(self.frame.size.width - imageWidth )) {
            labelWidth = self.frame.size.width - imageWidth;
        }

        
        let imageOffsetX = (imageWidth + labelWidth) / 2 - imageWidth / 2 //image中心移动的x距离
        let imageOffsetY = imageHeight / 2 + spacing / 2 //image中心移动的y距离
        let labelOffsetX = (imageWidth + labelWidth / 2) - (imageWidth + labelWidth) / 2 //label中心移动的x距离
        let labelOffsetY = labelHeight / 2 + spacing / 2 //label中心移动的y距离
        
        let tempWidth = max(labelWidth, imageWidth)
        let changedWidth = labelWidth + imageWidth - tempWidth
        let tempHeight = max(labelHeight, imageHeight)
        let changedHeight = labelHeight + imageHeight + spacing - tempHeight
        
        switch (postion) {
        case .imageLeft:
            self.imageEdgeInsets = UIEdgeInsets.init(top: 0,left: -spacing / 2,bottom : 0,right: spacing / 2)
                self.titleEdgeInsets = UIEdgeInsets.init(top:0,left:  spacing / 2, bottom :0,right:  -spacing / 2);
                self.contentEdgeInsets = UIEdgeInsets.init(top:0,left:  spacing / 2,bottom : 0,right:  spacing / 2);
                
            case .imageRight:
                self.imageEdgeInsets = UIEdgeInsets.init(top:0,left:  labelWidth + spacing / 2,bottom : 0,right:  -(labelWidth + spacing / 2));
                self.titleEdgeInsets = UIEdgeInsets.init(top:0,left:  -(imageWidth + spacing / 2),bottom : 0, right: imageWidth + spacing / 2);
                self.contentEdgeInsets = UIEdgeInsets.init(top:0,left:  spacing / 2,bottom : 0,right:  spacing / 2);
                
        case .imageTop:
                self.imageEdgeInsets = UIEdgeInsets.init(top:-imageOffsetY,left:  imageOffsetX,bottom : imageOffsetY,right:  -imageOffsetX);
                self.titleEdgeInsets = UIEdgeInsets.init(top:labelOffsetY,left:  -labelOffsetX,bottom : -labelOffsetY,right:  labelOffsetX);
                self.contentEdgeInsets = UIEdgeInsets.init(top:imageOffsetY,left:  -changedWidth / 2,bottom : changedHeight - imageOffsetY,right:  -changedWidth / 2);
                
        case .imageBottom:
                self.imageEdgeInsets = UIEdgeInsets.init(top:imageOffsetY,left:  imageOffsetX,bottom : -imageOffsetY,right:  -imageOffsetX);
                self.titleEdgeInsets = UIEdgeInsets.init(top:-labelOffsetY,left:  -labelOffsetX,bottom : labelOffsetY,right:  labelOffsetX);
                self.contentEdgeInsets = UIEdgeInsets.init(top:changedHeight - imageOffsetY,left:  -changedWidth / 2,bottom : imageOffsetY,right:  -changedWidth / 2);
                
        }
    }

    
    ///创建导航栏按钮
    class func kit_item(_ obj: Any?) -> UIButton {
        let btn = UIButton()
        btn.size = CGSize.init(width: kNavHeight, height: kNavHeight)
        if let title = obj as? String {
            btn.setTitle(title, for: .normal)
            btn.setTitleColor(UIColor.white, for: .normal)
        }else if let image = obj as? UIImage {
            btn.setImage(image, for: .normal)
        }
        
        return btn
    }
    
    class func kit_item(image: String, target: Any?, action: Selector?) -> UIButton {
        let btn = UIButton()
        btn.size = CGSize.init(width: kNavHeight, height: kNavHeight)
        if target != nil && action != nil {
            btn.addTarget(target!, action: action!, for: .touchUpInside)
        }
        btn.setImage(UIImage.kit_image(image), for: .normal)
        
        return btn
    }
    
    class func kit_item(title: String, target: Any?, action: Selector?) -> UIButton {
        let btn = UIButton()
        if target != nil && action != nil {
            btn.addTarget(target!, action: action!, for: .touchUpInside)
        }
        btn.setTitle(title, for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        btn.sizeToFit()
        btn.size = CGSize.init(width: max(kNavHeight, btn.width), height: kNavHeight)
        return btn
    }
    
    class func kit_button(image: String, target: Any?, action: Selector?) -> UIButton {
        let btn = UIButton()
        let img = UIImage.kit_image(image)
        btn.size = img?.size ?? .init(width: 0, height: 0)
        if target != nil && action != nil {
            btn.addTarget(target!, action: action!, for: .touchUpInside)
        }
        btn.setImage(img, for: .normal)
        
        return btn
    }
    
    class func kit_button(title: String, target: Any?, action: Selector?) -> UIButton {
        let btn = UIButton()
        if target != nil && action != nil {
            btn.addTarget(target!, action: action!, for: .touchUpInside)
        }
        btn.setTitle(title, for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.sizeToFit()
        btn.size = CGSize.init(width: btn.width + 12, height: btn.height + 8)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        return btn
    }
    
    class func kit_button(title: String) -> UIButton {
        let btn = UIButton()
        btn.setTitle(title, for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.sizeToFit()
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        return btn
    }
    
    class func kit_button(image: String) -> UIButton {
        let btn = UIButton()
        let img = UIImage.kit_image(image)
        btn.size = img?.size ?? .init(width: 0, height: 0)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        btn.setImage(img, for: .normal)
        
        return btn
    }
    
    class func kit_button(image: String, selectedImg: String) -> UIButton {
        let btn = UIButton.kit_button(image: image)
        btn.setImage(UIImage.kit_image(selectedImg), for: .selected)
        
        return btn
    }
}


