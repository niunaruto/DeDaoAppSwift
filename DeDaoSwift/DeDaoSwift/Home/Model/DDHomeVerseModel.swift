//
//  DDHomeVerseModel.swift
//  DeDaoSwift
//
//  Created by niuting on 2017/3/6.
//  Copyright © 2017年 niuNaruto. All rights reserved.
//

import UIKit
import ObjectMapper
class DDHomeVerseDataModel: Mappable {
    
    var m_id = 0
    var m_source = ""
    
    var m_content = ""
    var m_count = 0
    
    var m_book_id = 0
    var m_topic_id = 0
    var m_ctime = ""
    var m_collection = 0
    
    
    required init?(map : Map) {
        
    }
    
    func mapping(map:Map) {
        
        m_id           <- map["m_id"]
        m_source           <- map["m_source"]
        m_content           <- map["m_content"]
        m_count            <- map["m_count"]
        m_book_id            <- map["m_book_id"]
        m_topic_id            <- map["m_topic_id"]
        m_ctime            <- map["m_ctime"]
        m_collection            <- map["m_collection"]
    }
    
    
    
}

class DDHomeVerseModel: Mappable {

    var count = 0
    var title = ""
    var rightTitle = ""
    
    var data :DDHomeVerseDataModel?
    
    required init?(map : Map) {
        
    }
    
    func mapping(map:Map) {
        
        count           <- map["count"]
        title           <- map["title"]
        rightTitle           <- map["rightTitle"]
        data            <- map["data"]
    }
    

}
