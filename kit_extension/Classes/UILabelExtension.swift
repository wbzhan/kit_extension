//
//  UILabelExtension.swift
//  wbzhan
//
//  Created by design on 2020/12/3.
//  Copyright © 2020年 design. All rights reserved.
//

import Foundation
import UIKit

@objc public extension UILabel {
    
    ///添加删除线
    func addUnderLine(_ text: String ,color:UIColor?) {
        let attStr = NSMutableAttributedString.init(string: text)
      attStr.addAttribute(.strikethroughStyle, value: 1, range: text.nsRangeString(text))
       if color != nil {
           attStr.addAttribute(.strikethroughColor, value: color!, range: text.nsRangeString(text))
       }
        self.attributedText = attStr
    }
    ///添加阴影
     func textShadow(_ str: String) {
        let myShadow = NSShadow()
        myShadow.shadowBlurRadius = 3
        myShadow.shadowOffset = CGSize.init(width: 1, height: 1)
        myShadow.shadowColor = UIColor.gray
        
        let attributedStr = NSAttributedString.init(string: str.nilString(), attributes: [NSAttributedString.Key.shadow : myShadow])
        self.attributedText = attributedStr
    }
    ///快速实例化label
    class func kit_label(_ fontSize: CGFloat) ->  UILabel {
        let label = UILabel()
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: fontSize)
        return label
    }
    
    func imageText(text:String){
        self.imageText(imgName: "icon_multiply", text: text, imageSize: .init(width: 8, height: 8))
    }
    
    func imageText(imgName:String,text:String,imageSize:CGSize = .init(width: 8, height: 8)){
        let voiceAttr = NSMutableAttributedString()
        let imageAttachment = NSTextAttachment()
        let voiceImage = UIImage(named: imgName)
        
        imageAttachment.image = voiceImage
        imageAttachment.bounds = CGRect(x: 0, y: 0, width: imageSize.width, height: imageSize.height)
        let imgAttr = NSAttributedString(attachment: imageAttachment)
        voiceAttr.append(imgAttr)
        let textArt = NSAttributedString(string: text)
        voiceAttr .append(textArt)
        self.attributedText = voiceAttr
    }
    
    func tipsImageText(imgName:String,text:String,imageSize:CGSize = .init(width: 11, height: 11)){
        
        let fontSize = self.font.pointSize
        
        let voiceAttr = NSMutableAttributedString()
        let imageAttachment = NSTextAttachment()
        let voiceImage = UIImage(named: imgName)
        
        imageAttachment.image = voiceImage
        imageAttachment.bounds = CGRect(x: 0, y: imageSize.height - fontSize - 1, width: imageSize.width, height: imageSize.height)
        let imgAttr = NSAttributedString(attachment: imageAttachment)
        voiceAttr.append(imgAttr)
        let textArt = NSAttributedString(string: text)
        voiceAttr .append(textArt)
        self.attributedText = voiceAttr
    }
    
    ///设置颜色
     func setAttibuesText(_ text: String, subText: String?, color: UIColor) {
        self.attributedText = text.attributeText(subText ?? "", color)
    }
    
    ///设置字体
     func setAttibuesText(_ text: String, subText: String?, font: UIFont) {
        self.attributedText = text.attributeText(subText ?? "", font)
    }
    ///设置字体和颜色
     func setAttibuesText(_ text: String, subText: String?, color: UIColor ,font : UIFont) {
        self.attributedText = text.attributeText(subText ?? "", font, color)

    }
    ///获取attr
     class func getAttibuesText(_ text: String, subText: String?, font: UIFont) -> NSAttributedString {
           let attStr = NSMutableAttributedString.init(string: text)
           attStr.addAttributes([.font : font], range: text.nsRangeString(subText ?? ""))
          return attStr
       }
    ///设置行间距
     func setAttributeTxt(_ text: String, lineSpace:CGFloat){
        let attStr = NSMutableAttributedString.init(string: text)
        
        let paragraphStype = NSMutableParagraphStyle.init()
        paragraphStype.lineSpacing = lineSpace
        paragraphStype.lineBreakMode = self.lineBreakMode
        paragraphStype.alignment = self.textAlignment
        attStr.addAttributes([.paragraphStyle : paragraphStype], range: text.nsRangeString(text))
        self.attributedText = attStr
    }
}
