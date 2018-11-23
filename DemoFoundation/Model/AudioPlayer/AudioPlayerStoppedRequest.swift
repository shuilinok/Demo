//
//  AudioPlayerStoppedRequest.swift
//  Demo
//
//  Created by Foryou on 2018/11/23.
//  Copyright © 2018年 Foryou. All rights reserved.
//

import UIKit

//等待播放器停止
class AudioPlayerStoppedRequest: NSObject {
    
    var _player : AudioPlayer?
    var callback : ResultCallback?
    
    deinit{
        
        self.player = nil
    }
    
    private(set) var player : AudioPlayer? {
        get{
            return _player
        }
        
        set{
            
            self.removeKVO()
            
            _player = newValue
            
            self.addKVO()
        
        }
        
    }
    
    func send(player : AudioPlayer?, callback:@escaping ResultCallback) {
        
        if player == nil {
            callback(nil)
            return
        }
        
        if !player!.playing {    //本来就是停止的
            callback(nil)
            return
        }
        
        //开始等待停止
        self.callback = callback
        self.player = player
    }
    
    func addKVO()
    {
        self.player?.addObserver(self, forKeyPath: "playing", options: [.new, .old], context: nil)
    }
    
    func removeKVO()
    {
        self.player?.removeObserver(self, forKeyPath: "playing", context: nil)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if let player = object as? AudioPlayer
        {
            if player == self.player
            {
                if keyPath == "playing"
                {
                    if !player.playing
                    {
                        self.callback!(nil)
                        self.callback = nil
                    }
                }
            }
        }
    }
}
