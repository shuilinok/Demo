//
//  CourseCellRichDescBuilder.swift
//  Demo
//
//  Created by Foryou on 2018/11/30.
//  Copyright © 2018年 Foryou. All rights reserved.
//

import UIKit

//课程描述富文本建造器
class CourseCellRichDescBuilder: NSObject {

    private(set) var text : NSMutableAttributedString = NSMutableAttributedString()
    
    override init() {
        
    }
    
    //追加文本
    func appendText(aText : String?) {
        
        if aText == nil {
            return
        }
        
        let text = aText!
    
        let attribute = [NSAttributedStringKey.foregroundColor: UIColor.orange,
                                    NSAttributedStringKey.font: UIFont.systemFont(ofSize: 13)] as [NSAttributedStringKey : Any]
        let subString = NSMutableAttributedString(string: text)
        subString.addAttributes(attribute, range: NSRange.init(location: 0, length: subString.length))
        
        self.text.append(subString)
    }
    
    //追加图标
    func appendIcon(icon : UIImage?) {
        
        if icon == nil {
            return
        }
        
        let attach = NSTextAttachment.init()
        attach.image = icon
        attach.bounds = CGRect(x: 0, y: 0, width: 16, height: 16)
        let attachString = NSAttributedString.init(attachment: attach)
        
        let subString = NSMutableAttributedString()
        subString.append(attachString)
        
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 2
        style.alignment = NSTextAlignment.center
        
        let attribute = [NSAttributedStringKey.paragraphStyle : style]
        subString.addAttributes(attribute, range: NSRange(location: 0, length: subString.length))
        
        self.text.append(subString)
    }
    
    //追加标签
    func appendTag(aText : String?) {
        
        guard let text = aText else {
            return
        }
        
        //新建label
        let font = UIFont.systemFont(ofSize: 12)
        let height : CGFloat = 16.0
        let width = text.widthForFont(aFont: font)
        let label = UILabel(frame: CGRect(x: 0.0, y: 0.0, width: width, height: height))
        label.backgroundColor = UIColor.white
        label.textColor = UIColor.blue
        label.layer.borderColor = UIColor.blue.cgColor
        label.layer.cornerRadius = 8.0
        label.layer.borderWidth = 1.0
        label.clipsToBounds = true
        label.font = font
        label.textAlignment = NSTextAlignment.center
        
        label.text = text;
        
        //把label转换成图片
        
        //追加图片
    }
}
