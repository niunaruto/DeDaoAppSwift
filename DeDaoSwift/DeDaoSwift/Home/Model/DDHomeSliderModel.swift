//
//  DDHomeSliderModel.swift
//  DeDaoSwift
//
//  Created by niuting on 2017/3/6.
//  Copyright © 2017年 niuNaruto. All rights reserved.
//

import UIKit
import ObjectMapper
class DDHomeSliderListModel: Mappable {
    var m_type = 0
    var m_isSubscribe = 0
    
    var m_author = ""
    var m_count = ""
    var m_book_type = 0
    
    
    
    
    var m_title = ""
    var m_img = ""
    var m_url = ""
    var m_id = 0
    var m_from = ""
    
    required init(map :Map) {
    }
    
    func mapping(map: Map) {
        
        m_type          <- map["m_type"]
        m_isSubscribe   <- map["m_isSubscribe"]
        m_title         <- map["m_title"]
        m_img           <- map["m_img"]
        m_url           <- map["m_url"]
        m_id            <- map["m_id"]
        m_from          <- map["m_from"]
        m_book_type          <- map["m_book_type"]
        m_author          <- map["m_author"]
        m_count          <- map["m_count"]
    }
}


class DDHomeSliderModel: Mappable {
    var count = 0
    var title = ""
    var rightTitle = ""
    var list : Array<DDHomeSliderListModel>?
    
    required init?(map : Map) {
        
    }
    
    func mapping(map:Map) {
        
        count           <- map["count"]
        title           <- map["title"]
        rightTitle      <- map["rightTitle"]
        list            <- map["list"]
    }
    
    
}
