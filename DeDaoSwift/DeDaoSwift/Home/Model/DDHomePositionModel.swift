//
//  DDHomePositionModel.swift
//  DeDaoSwift
//
//  Created by niuting on 2017/3/15.
//  Copyright © 2017年 niuNaruto. All rights reserved.
//

import UIKit
import ObjectMapper

class DDHomePositionStructureModel: Mappable {
   
    var type = ""
    
    
    required init?(map: Map) {
        
    }
    
    func mapping(map:Map) {
        type           <- map["type"]
        
    }
    
}

class DDHomeCPositionModel: Mappable {
    
    var structure  : Array<DDHomePositionStructureModel>? = Array<DDHomePositionStructureModel>()
    
    required init?(map : Map) {
        
    }
    
    func mapping(map:Map) {
        structure           <- map["structure"]
        
    }
    
}


class DDHomePositionModel: Mappable {

    var c :DDHomeCPositionModel?

    
    
    required init?(map : Map) {
        
    }
    
    func mapping(map:Map) {
        c           <- map["c"]
        
    }
    
}
