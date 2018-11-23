//
//  IDGetMusicUrlRequest.swift
//  Demo
//
//  Created by Foryou on 2018/11/21.
//  Copyright © 2018年 Foryou. All rights reserved.
//

import UIKit

//根据musicID获取url
class IDGetMusicUrlRequest: NSObject {

    var musicID : String = ""
    
    private(set) var url : String = ""
    
    private(set) var request : DemoHttpRequest?
    
    func send(callback : @escaping ResultCallback) {
        
        let request = DemoHttpRequest()
        self.request = request
        
        request.send { (error) in
            
            if request == self.request { //没有取消
         
                callback(error)
            } else {
                
                let err = NSError.create(code: kErrorCode_Request_Invalid, message: "请求已无效")
                callback(err)
            }
        }
        
    }
    
    func cancel() {
        
        self.request = nil
    }
}
