//
//  ViewHelper.swift
//  Demo
//
//  Created by Foryou on 2018/12/5.
//  Copyright © 2018年 Foryou. All rights reserved.
//

import UIKit

extension UIView {
    
    func createImage () -> UIImage? {
        
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, UIScreen.main.scale)
        let ctx : CGContext? = UIGraphicsGetCurrentContext()
        
        var image : UIImage?
        
        if ctx != nil {
            
            self.layer.render(in: ctx!)
            image = UIGraphicsGetImageFromCurrentImageContext()
        }
        
        UIGraphicsEndImageContext()
        
        return image
    }
}
