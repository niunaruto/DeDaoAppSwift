//
//  DDHomeModel.swift
//  DeDaoSwift
//
//  Created by niuting on 2017/3/6.
//  Copyright © 2017年 niuNaruto. All rights reserved.
//

import UIKit
import ObjectMapper

class DDHomeDataModel: Mappable {
    
    var slider                  : DDHomeSliderModel?
    var category                : DDHomeSliderModel?
    var freeAudio               : DDHomeFreeAudioModel?
    var column                  : DDHomeColumnModel?
    var storytell               : DDHomeStorytellModel?
    var magazine                : DDHomeStorytellModel?
    var new                     : DDHomeSliderModel?
    var subject                 : DDHomeSubjectModel?
    var verse                   : DDHomeVerseModel?
    var dataMiningAduioOrBook   : DDHomeSliderModel?
    var freecolumn              : DDHomeVerseModel?
    var live                    : DDHomeLiveModel?
    
    
    
    
    
    
    
    
    required init?(map : Map) {
        
    }
    
    func mapping(map:Map) {
        slider           <- map["slider"]
        category         <- map["category"]
        freeAudio        <- map["freeAudio"]
        column        <- map["column"]
        storytell        <- map["storytell"]
        magazine        <- map["magazine"]
        new        <- map["new"]
        subject        <- map["subject"]
        verse        <- map["verse"]
        dataMiningAduioOrBook        <- map["dataMiningAduioOrBook"]
        freecolumn        <- map["freecolumn"]
        live        <- map["live"]
        
    }
    
    
}





class DDCDataModel: Mappable {
    var data : DDHomeDataModel?
    
    required init?(map : Map) {
        
    }
    
    func mapping(map:Map) {
        data           <- map["data"]
        
    }
}

class DDHomeModel: Mappable {
    
    var c : DDCDataModel?
    
    required init?(map : Map) {
        
    }
    
    func mapping(map:Map) {
        c           <- map["c"]
        
    }
    
    
}
class DDHomeLiveDataModel: Mappable {
    var status = 0
    var online_num = 0
    var reservation_num = 0
    var title = ""
    var room_id = 0
    var intro = ""
    var column_id = 0

    required init?(map : Map) {
        
    }
    
    func mapping(map:Map) {
        status           <- map["status"]
        online_num           <- map["online_num"]
        reservation_num           <- map["reservation_num"]
        title           <- map["title"]
        room_id           <- map["room_id"]
        intro           <- map["intro"]
        column_id           <- map["column_id"]
        
    }

}


class DDHomeLiveModel: Mappable {
    var data : DDHomeLiveDataModel?
    
    required init?(map : Map) {
        
    }
    
    func mapping(map:Map) {
        data           <- map["data"]
        
    }
}



