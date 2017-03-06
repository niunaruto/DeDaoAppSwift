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
    
    var slider : DDHomeSliderModel?
    var category : DDHomeSliderModel?
    var freeAudio : DDHomeFreeAudioModel?
    var column :DDHomeColumnModel?
    var storytell :DDHomeStorytellModel?
    var magazine :DDHomeStorytellModel?
    var new :DDHomeNewModel?
    var subject :DDHomeSubjectModel?
    var verse :DDHomeVerseModel?
    var dataMiningAduioOrBook : DDHomeSliderModel?
    
    
    
    
    
    
    
    
    required init?(map : Map) {
        
    }
    
    func mapping(map:Map) {
        slider           <- map["slider"]
        category         <- map["category"]
        freeAudio        <- map["freeAudio"]
        
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


