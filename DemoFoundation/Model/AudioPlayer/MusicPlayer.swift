//
//  MusicPlayer.swift
//  Demo
//
//  Created by Foryou on 2018/10/26.
//  Copyright © 2018年 Foryou. All rights reserved.
//

import UIKit

class MusicPlayer: AudioPlayer {

    private(set) var musicID : String = ""
    
    var removing : Bool = false
    
    let filePlayer = AudioFilePlayer()
    
    var preStartRequest : MusicPlayerPreStartRequest = ProxyMusicPlayerPreStartRequest()
    
    override func start() {
        
        if self.playing || self.removing {
            return
        }
        
        self.playing = true
        
        self.preStartRequest.send(player: self) { (error) in
            
            if error == nil { //成功继续启动
                
                self.filePlayer.url = self.preStartRequest.url
                self.filePlayer.start()
            }else if error?.code == kErrorCode_Request_Invalid { //已取消，不处理
                
            } else { //失败
                
                self.playing = false
            }
        }
    }
    
    override func stop() {
        
        //这里不用检查playing
        
        self.preStartRequest.cancel()
        
        self.filePlayer.stop()
        
        self.playing = self.filePlayer.playing
        
    }
    
    func remove(callback: @escaping ResultCallback) {
        
        self.removing = true
        
        //确保停止
        self.stop()
        let request = AudioPlayerStoppedRequest()
        request.send(player: self) { (error) in
            
            //执行删除操作
            //...
            
            self.removing = false
            
            callback(nil)
        }
    }
    
    //kvo观察filePlayer的属性
    
}
