//
//  DDHomeColumnModel.swift
//  DeDaoSwift
//
//  Created by niuting on 2017/3/6.
//  Copyright © 2017年 niuNaruto. All rights reserved.
//

import UIKit
import ObjectMapper

class DDHomeColumnListModel: Mappable {
    var m_id = ""
    var m_img = ""
    var m_title = ""
    var m_image = ""
    var m_price = 0
    var m_intro = ""
    var m_price_desc = ""
    var m_orders = 0
    var m_article_title = ""
    var m_article_time = ""
    var m_isSubscribe = 0
    
    required init?(map : Map) {
        
    }
    
    func mapping(map:Map) {
        
        m_isSubscribe           <- map["m_isSubscribe"]
        m_article_time           <- map["m_article_time"]
        m_article_title      <- map["m_article_title"]
        m_orders            <- map["m_orders"]
        m_price_desc            <- map["m_price_desc"]
        m_price            <- map["m_price"]
        m_image            <- map["m_image"]
        m_title            <- map["m_title"]
        m_img            <- map["m_img"]
        m_id            <- map["m_id"]
    }
    
    
}


class DDHomeColumnModel: Mappable {
    var count = 0
    var title = ""
    var rightTitle = ""
    var list : Array<DDHomeColumnListModel>?
    
    required init?(map : Map) {
        
    }
    
    func mapping(map:Map) {
        
        count           <- map["count"]
        title           <- map["title"]
        rightTitle      <- map["rightTitle"]
        list            <- map["list"]
    }
    
}
