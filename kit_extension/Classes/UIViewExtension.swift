//
//  UIViewExtension.swift.swift
//  wbzhan
//
//  Created by design on 2020/12/3.
//  Copyright © 2020年 design. All rights reserved.
//

import Foundation
import UIKit


//MARK:   --    分类设置
@objc public extension UIView {
    //阴影类型
   @objc enum ShadowType : Int {
         case top
         case bottom
         case left
         case right
         case all
     }
    
    var left:CGFloat {
       get {
           return self.frame.origin.x
       }
       set(newLeft) {
           var frame = self.frame
           frame.origin.x = newLeft
           self.frame = frame
       }
   }
   
    var top:CGFloat {
       get {
           return self.frame.origin.y
       }
       
       set(newTop) {
           var frame = self.frame
           frame.origin.y = newTop
           self.frame = frame
       }
   }
   
   var width:CGFloat {
       get {
           return self.frame.size.width
       }
       
       set(newWidth) {
           var frame = self.frame
           frame.size.width = newWidth
           self.frame = frame
       }
   }
   
   var height:CGFloat {
       get {
           return self.frame.size.height
       }
       
       set(newHeight) {
           var frame = self.frame
           frame.size.height = newHeight
           self.frame = frame
       }
   }
   
   var right:CGFloat {
       get {
           return self.left + self.width
       }
       set(newRight) {
                  var frame = self.frame
           frame.origin.x = newRight - self.width
                  self.frame = frame
              }
   }
   
   var bottom:CGFloat {
       get {
           return self.top + self.height
       }
       set(newBottom) {
              var frame = self.frame
           frame.origin.y = newBottom - self.height
              self.frame = frame
          }
   }
    
   
   var centerX:CGFloat {
       get {
           return self.center.x
       }
       
       set(newCenterX) {
           var center = self.center
           center.x = newCenterX
           self.center = center
       }
   }
   
   var centerY:CGFloat {
       get {
           return self.center.y
       }
       
       set(newCenterY) {
           var center = self.center
           center.y = newCenterY
           self.center = center
       }
   }

    var size: CGSize{
        get{
            return self.frame.size
        }
        set{
            var frame = self.frame
            frame.size = newValue
            self.frame = frame
        }
    }
    
    
    ///设置部分圆角
    func addRoundedCorners(corners: UIRectCorner, radii: CGSize, viewRect: CGRect) {
        let path = UIBezierPath.init(roundedRect: viewRect, byRoundingCorners: corners, cornerRadii: radii)
        let layer = CAShapeLayer()
        layer.frame = viewRect
        layer.path = path.cgPath
        self.layer.mask = layer
    }
    
    
    func setShadow(_ type: ShadowType, color: UIColor = .black){
        self.setShadow(type: type, color: color, opactiy: 1.0, shadowSize: 4)
    }
    ///设置阴影
    func setShadow(type: ShadowType = .all, color: UIColor = .black,  opactiy: Float = 1, shadowSize: CGFloat = 4) {
        self.layoutIfNeeded()
        layer.masksToBounds = false//必须要等于NO否则会把阴影切割隐藏掉
        layer.shadowColor = color.cgColor// 阴影颜色
        layer.shadowOpacity = opactiy;// 阴影透明度，默认0
        layer.shadowOffset = .zero;//shadowOffset阴影偏移，默认(0, -3),这个跟shadowRadius配合使用
        layer.shadowRadius = 3 //阴影半径，默认3
        var shadowRect: CGRect?
        switch type {
        case .all:
            shadowRect = CGRect.init(x: -shadowSize, y: -shadowSize, width: bounds.size.width + 2 * shadowSize, height: bounds.size.height + 2 * shadowSize)
        case .top:
            shadowRect = CGRect.init(x: -shadowSize, y: -shadowSize, width: bounds.size.width + 2 * shadowSize, height: 2 * shadowSize)
        case .bottom:
            shadowRect = CGRect.init(x: 0, y: bounds.size.height - shadowSize, width: bounds.size.width, height: 2 * shadowSize)
        case .left:
            shadowRect = CGRect.init(x: -shadowSize, y: -shadowSize, width: 2 * shadowSize, height: bounds.size.height + 2 * shadowSize)
        case .right:
            shadowRect = CGRect.init(x: bounds.size.width - shadowSize, y: -shadowSize, width: 2 * shadowSize, height: bounds.size.height + 2 * shadowSize)
        }
        layer.shadowPath = UIBezierPath.init(rect: shadowRect!).cgPath
    }
    
    ///设置显示模式
    func setShowMode(_ mode:  UIView.ContentMode) {
        self.clipsToBounds = true
        self.contentMode = mode
    }
    
    /// 添加渐变色图层 --UIColor
    func gradientColor(_ colors: [Any]) {
        self.removeGradientLayer()
        self.superview?.layoutIfNeeded()
        if self.width <= 0 || self.height <= 0 {
            return
        }
        let layer = CAGradientLayer()
        layer.frame = self.bounds
        
       let cgcolors = colors.map{($0 as! UIColor).cgColor}
        ///设置颜色
        layer.colors = cgcolors
        ///设置颜色渐变的位置 （我这里是横向 中间点开始变化）
        layer.locations = [0,1]
        
        ///开始的坐标点
        layer.startPoint = CGPoint(x: 0, y: 0)
        ///结束的坐标点
        layer.endPoint = CGPoint(x: 1, y: 0)
        self.layer.addSublayer(layer)
    }
    
    /// 移除渐变图层
    func removeGradientLayer() {
        if let sl = self.layer.sublayers {
            for layer in sl {
                if layer.isKind(of: CAGradientLayer.self) {
                    layer.removeFromSuperlayer()
                }
            }
        }
    }
    
    ///MARK: - UIView转UIImage
     func viewToImage() -> UIImage {
    // 下面方法，第一个参数表示区域大小。第二个参数表示是否是非透明的。如果需要显示半透明效果，需要传NO，否则传YES。第三个参数就是屏幕密度了
    UIGraphicsBeginImageContextWithOptions(self.size, false, UIScreen.main.scale)
    let context = UIGraphicsGetCurrentContext()
    self.layer.render(in: context!)
    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return image!
    }
    
    //alert弹框
    class func showAlert( title:String?, message:String? , cancelTitle:String?, sureTitle:String?,cancelBlock: Completed?, sureBlock:Completed?){
        
        let alert = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        
        if cancelTitle != nil {
            let cancel = UIAlertAction.init(title: cancelTitle ?? Locale("CANCEL"), style: .cancel) { _ in
                cancelBlock?()
            }
            alert.addAction(cancel)
        }
        
        if sureTitle != nil {
            
            let sure = UIAlertAction.init(title: sureTitle, style: .default) { _ in
                sureBlock?()
            }
            alert.addAction(sure)
            
        }
        
        kCurrentVC()?.present(alert, animated: false, completion: nil)
    }
    //actionsheet 弹框
    class func showActionSheet( title:String? , message:String?, cancelTitle:String?,items:[String]!,cancelBlock: Completed?, callBack:@escaping CallBackClosure){
        
        let alert = UIAlertController.init(title: title, message: message, preferredStyle: .actionSheet)
        
        let cancel = UIAlertAction.init(title: cancelTitle ?? Locale("CANCEL"), style: .cancel) { _ in
            
        }
        alert.addAction(cancel)
        
        for index  in 0..<items.count {
            let name = items.objAtIndex(index)
            let action = UIAlertAction.init(title: name, style: .default) { _ in
                callBack(index)
            }
            alert.addAction(action)
        }
        kCurrentVC()?.present(alert, animated: false, completion: nil)
        
        
    }
    

}
