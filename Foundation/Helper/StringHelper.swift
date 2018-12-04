//
//  StringHelper.swift
//  Demo
//
//  Created by Foryou on 2018/9/7.
//  Copyright © 2018年 Foryou. All rights reserved.
//

import UIKit

func exString(_ string : String?) -> String!
{
    return (string != nil) ? string! : ""
}

class StringHelper: NSObject {

    
}


extension String {
    
    //将原始的url编码为合法的url
    func urlEncode() -> String {
        let encodeUrlString = self.addingPercentEncoding(withAllowedCharacters:
            .urlQueryAllowed)
        return encodeUrlString ?? ""
    }
    
    //将编码后的url转换回原始的url
    func urlDecode() -> String {
        return self.removingPercentEncoding ?? ""
    }
    
    //计算高度
    func widthForFont(aFont : UIFont?) -> CGFloat {
        guard let font = aFont else {
            return 0.0
        }
        
        let strSize = self.boundingRect(with: CGSize(width: CGFloat.greatestFiniteMagnitude, height: 0.0), options: .usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font: font], context: nil).size
        
        return strSize.width
        
    }
}

extension NSAttributedString {
    
    func heightForWidth(width : CGFloat) -> CGFloat {
        
        let maxSize = CGSize(width: width, height:CGFloat.greatestFiniteMagnitude)
        let rect = self.boundingRect(with: maxSize, options: .usesLineFragmentOrigin, context: nil)
        let height = ceil(rect.size.height)
        
        return height
    }
}
