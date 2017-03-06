//
//  DDHomeStorytellModel.swift
//  DeDaoSwift
//
//  Created by niuting on 2017/3/6.
//  Copyright © 2017年 niuNaruto. All rights reserved.
//

import UIKit
import ObjectMapper
class DDHomeStorytellDataInfoModel: Mappable {
    var id = 0
    var avatar = ""
    var name = ""
    var intro = ""
    var magazine = ""
    
    
    
    
    required init?(map : Map) { }
    
    func mapping(map:Map) {
        id  <- map["id"]
        avatar  <- map["avatar"]
        name  <- map["name"]
        intro  <- map["intro"]
        magazine  <- map["magazine"]
    }
    
    
    
}

class DDHomeStorytellDataModel: Mappable {
    var m_title = ""
    var m_img = ""
    var m_type = 0
    var m_duration = 0
    var m_id = 0
    var m_description = ""
    var m_price = 0
    var m_buy = 0
    var m_date = ""
    var m_notbuy_image = ""
    var m_source = ""
    
    
    var m_info : DDHomeStorytellDataInfoModel?
    
    
    
    
    required init?(map : Map) {
        
    }
    
    func mapping(map:Map) {
        
        m_img           <- map["m_img"]
        m_img           <- map["m_img"]
        m_type            <- map["m_type"]
        m_duration            <- map["m_duration"]
        m_id            <- map["m_id"]
        m_description            <- map["m_description"]
        m_price            <- map["m_price"]
        m_buy            <- map["m_buy"]
        m_date            <- map["m_date"]
        m_info            <- map["m_info"]
        m_notbuy_image            <- map["m_notbuy_image"]
        m_source            <- map["m_source"]
    }
    
    
}

class DDHomeStorytellModel: Mappable {

    var count = 0
    var title = ""
    var intro = ""
    
    var data :DDHomeStorytellDataModel?
    
    required init?(map : Map) {
        
    }
    
    func mapping(map:Map) {
        
        count           <- map["count"]
        title           <- map["title"]
        intro           <- map["intro"]
        data            <- map["data"]
    }
    
    
    
}
