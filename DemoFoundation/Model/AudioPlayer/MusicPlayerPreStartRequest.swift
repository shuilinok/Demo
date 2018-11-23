//
//  MusicPlayerPreStartRequest.swift
//  Demo
//
//  Created by Foryou on 2018/11/22.
//  Copyright © 2018年 Foryou. All rights reserved.
//

import UIKit


//音乐播放器预启动策略：1，请求manager检查条件；2，根据musicID请求url

class MusicPlayerPreStartRequest: NSObject {
    
    var musicID : String = ""
    
    var url : String = ""
    
    func send(player:MusicPlayer, callback : @escaping ResultCallback) {
        
        AudioPlayerManager.sharedInstance.checkPlayMusic(player: player) { (error) in
            if error == nil { //条件允许播放
                
                let urlRequest = IDGetMusicUrlRequest()
                urlRequest.musicID = self.musicID
                urlRequest.send(callback: { (error) in
                    
                    if error == nil {
                        self.url = urlRequest.url
                    }
                    
                    callback(error)
                })
                
            }else{
                callback(error)
            }
        }
        
    }
    
    func cancel() {
        
        
    }
}

//能取消
class ProxyMusicPlayerPreStartRequest : MusicPlayerPreStartRequest {
    
    private(set) var currentRequest : MusicPlayerPreStartRequest?
    
    func createRequest() -> MusicPlayerPreStartRequest {
        
        let request = MusicPlayerPreStartRequest()
        request.musicID = self.musicID
        
        return request
    }
    
    override func send(player:MusicPlayer, callback: @escaping ResultCallback) {
        
        let request : MusicPlayerPreStartRequest = self.createRequest()
        self.currentRequest = request
        
        request.send(player: player) { (error) in
            
            if request == self.currentRequest {//没有取消
                
                self.url = request.url
                
                callback(error)
            }else{
                
                let err = NSError.create(code: kErrorCode_Request_Invalid, message: "请求已无效")
                callback(err)
            }
        }
    }
    
    override func cancel() {
        
        self.currentRequest = nil
    }
}
