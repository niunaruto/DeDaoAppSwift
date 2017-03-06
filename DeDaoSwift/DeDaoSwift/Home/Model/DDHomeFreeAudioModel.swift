//
//  DDHomeFreeAudioModel.swift
//  DeDaoSwift
//
//  Created by niuting on 2017/3/6.
//  Copyright © 2017年 niuNaruto. All rights reserved.
//

import UIKit
import ObjectMapper
class DDHomeFreeAudioListTagModel: Mappable {
    var id = ""
    var name = ""
    required init?(map : Map) {
        
    }
    
    func mapping(map:Map) {
        
        id             <- map["id"]
        name           <- map["name"]
    }
    
    
}
class DDHomeFreeAudioListModel: Mappable {
    var id = 0
    var alias_id = ""
    var class_id = 0
    var title = ""
    var share_title = ""
    var mp3_play_url = ""
    var duration = 0
    var schedule = 0
    var topic_id = ""
    var price = 0
    var icon = ""
    var size = 0
    var share_summary = ""
    var count = 0
    var bored_count = 0
    var audio_type = 0
    var tag : Array<DDHomeFreeAudioListTagModel>?
    var audio_list_icon = ""
    var topic_duration = 0
    
    
    required init?(map : Map) {
        
    }
    
    func mapping(map:Map) {
        
        tag             <- map["tag"]
        audio_list_icon           <- map["audio_list_icon"]
        topic_duration             <- map["topic_duration"]
        audio_type           <- map["audio_type"]
        bored_count             <- map["bored_count"]
        count           <- map["count"]
        share_summary             <- map["share_summary"]
        icon           <- map["icon"]
        price           <- map["price"]
        topic_id           <- map["topic_id"]
        schedule           <- map["schedule"]
        duration           <- map["duration"]
        mp3_play_url           <- map["mp3_play_url"]
        share_title           <- map["share_title"]
        title           <- map["title"]
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}

class DDHomeFreeAudioModel: Mappable {
    var count = 0
    var title = ""
    var rightTitle = ""
    var list : Array<DDHomeFreeAudioListModel>?
    
    required init?(map : Map) {
        
    }
    
    func mapping(map:Map) {
        
        count           <- map["count"]
        title           <- map["title"]
        rightTitle      <- map["rightTitle"]
        list            <- map["list"]
    }
    
}
