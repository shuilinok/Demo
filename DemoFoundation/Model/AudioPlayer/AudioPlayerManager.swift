//
//  AudioPlayerManager.swift
//  Demo
//
//  Created by Foryou on 2018/11/22.
//  Copyright © 2018年 Foryou. All rights reserved.
//

import UIKit

class AudioPlayerManager: NSObject {

    static let sharedInstance = AudioPlayerManager()
    
    var musicPlayer : MusicPlayer?
    
    func checkPlayMusic(player:MusicPlayer, callback : @escaping ResultCallback) {
        
        //检查条件
        //...
        //ok
        
        self.musicPlayer?.stop()
        let request = AudioPlayerStoppedRequest()
        request.send(player: self.musicPlayer) { (error) in
            
            //更换掉
            self.musicPlayer = player;
            
            callback(nil)
        }
    }
}
