//
//  DDBaseCellProtocol.swift
//  DeDaoSwift
//
//  Created by niuting on 2017/3/20.
//  Copyright © 2017年 niuNaruto. All rights reserved.
//

import Foundation

enum DDCellEventType : NSInteger {
    case DDCellEventTypeBannerClick //banner点击
}
//swift bug:如果协议里有枚举类型的话，只能是必须实现的方法
protocol DDBaseCellProtocol : class  {
    
    func tableCell(cell : DDBaseTableViewCell,didTrigerEvent :DDCellEventType,params : Dictionary<String, Any>?)
    

    
}
