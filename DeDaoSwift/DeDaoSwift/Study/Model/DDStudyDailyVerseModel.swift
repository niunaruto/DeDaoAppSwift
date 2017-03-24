//
//  DDStudyDailyVerseModel.swift
//  DeDaoSwift
//
//  Created by niuting on 2017/3/23.
//  Copyright © 2017年 niuNaruto. All rights reserved.
//

import UIKit
import ObjectMapper

class DDStudyDailyVerseModel: Mappable {

    var c : DDStudyDailyVerseCModel?
    
    required init?(map : Map) {
        
    }
    
    func mapping(map:Map) {
        c           <- map["c"]
        
    }
    
}

class DDStudyDailyVerseCModel: Mappable {
    var data : DDStudyDailyVerseDataModel?
    
    required init?(map : Map) {
        
    }
    
    func mapping(map:Map) {
        data           <- map["data"]
        
    }
    
}

class DDStudyDailyVerseDataModel: Mappable {
    var id  = 0
    var type = 0
    var date = ""
    var week = ""
    var referer_group = ""
    var referer_name = ""
    var content = ""
    var day = ""
    var count = 0
    var collection = 0
    var from = ""
    
    
    
    
    
    required init?(map : Map) {
        
    }
    
    func mapping(map:Map) {
        id           <- map["id"]
        from           <- map["from"]
        type           <- map["type"]
        date           <- map["date"]
        week           <- map["week"]
        referer_group           <- map["referer_group"]
        referer_name           <- map["referer_name"]
        content           <- map["content"]
        day           <- map["day"]
        count           <- map["count"]
        collection           <- map["collection"]
        
    }
    
}


