//
//  SearchCourseRectItem.swift
//  Demo
//
//  Created by Foryou on 2018/9/26.
//  Copyright © 2018年 Foryou. All rights reserved.
//

import UIKit

//SearchCourseCollectionItem的单元格模型

class SearchCourseCOItem: NSObject {
    
    var size : CGSize = CGSize(width: 0.0, height: 0.0)
    
    var clickCommand : ProtocolCommand?
}

class SearchCourseRectItem: SearchCourseCOItem {

    var title : NSMutableAttributedString = NSMutableAttributedString(string: "")
    var desc : NSAttributedString?
    var imageUrl : String = ""
    var titleHeight : CGFloat = 0.0
    var descHeight : CGFloat = 0.0
    
    func onUpdate(info : SearchCourseInfo, width : CGFloat)
    {
        if info.name != nil
        {
            self.title = NSMutableAttributedString(string: info.name!)
            
            //设置样式
            let attributes = [NSAttributedStringKey.foregroundColor: UIColor.darkText,
                               NSAttributedStringKey.font: UIFont.systemFont(ofSize: 17)] as [NSAttributedStringKey : Any]
            self.title.addAttributes(attributes, range: NSRange.init(location: 0, length: info.name!.count))
        }
        
        self.desc = self.createRichDesc(info: info)
        
        self.imageUrl = exString(info.thumbImageUrl)
        
        //计算标题文本高度
        let titleHeight = self.title.heightForWidth(width: width)
        self.titleHeight = titleHeight
        
        //计算描述文本高度
        var descHeight : CGFloat = 0.0
        if let desc = self.desc {
            
            descHeight = desc.heightForWidth(width: width)
        }
        self.descHeight = descHeight
        
        //print("titleHeight : \(titleHeight)")
        
        //计算整个单元格尺寸
        let height = width * 27.0 / 40.0 + titleHeight + descHeight + 30
        self.size = CGSize(width: width, height: height)
    }
    
    
    func createRichDesc(info : SearchCourseInfo) -> NSAttributedString? {
        
        let builder = CourseCellRichDescBuilder()
        builder.appendText(aText: info.org_name)
        builder.appendIcon(icon: UIImage(named: "order_send_time"))
        builder.appendText(aText: "丰富。\n")
        builder.appendTag(aText: "超重")
        builder.appendText(aText: " ")
        builder.appendTag(aText: "走高速")
        builder.appendText(aText: "货车")
        
        return builder.text
    }
}


class SearchCourseSummaryItem: SearchCourseCOItem {
    
    
}


