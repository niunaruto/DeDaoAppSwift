//
//  DDHomeNewModel.swift
//  DeDaoSwift
//
//  Created by niuting on 2017/3/6.
//  Copyright © 2017年 niuNaruto. All rights reserved.
//

import UIKit
import ObjectMapper

class DDHomeNewListModel: Mappable {
    var m_type = 0
    var m_title = ""
    var m_duration = ""
    var m_img = ""
    var m_id = 0
    
    
    
    
    
    
    required init?(map : Map) {
        
    }
    
    func mapping(map:Map) {
        
        m_type           <- map["m_type"]
        m_title           <- map["m_title"]
        m_duration           <- map["m_duration"]
        m_img            <- map["m_img"]
        m_id            <- map["m_id"]
    }
    
}

class DDHomeNewModel: Mappable {
    var count = 0
    var title = ""
    var rightTitle = ""
    
    var list : DDHomeNewListModel?
    
    required init?(map : Map) {
        
    }
    
    func mapping(map:Map) {
        
        count           <- map["count"]
        title           <- map["title"]
        rightTitle           <- map["rightTitle"]
        list            <- map["list"]
    }
    
    
}
