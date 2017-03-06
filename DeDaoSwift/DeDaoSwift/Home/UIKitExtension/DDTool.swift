//
//  DDTool.swift
//  DeDaoSwift
//
//  Created by niuting on 2017/3/6.
//  Copyright © 2017年 niuNaruto. All rights reserved.
//

import UIKit

class DDTool: NSObject {

    
    /// 通过一个文件路径传给你对应的数据
    ///
    /// - Parameter patch: 文件名+type
    /// - Returns: Any
    class func getDictionaryWithPatch(fileName:String) -> Any {
        
        let patch = Bundle.main.path(forResource: fileName, ofType: nil)
        
        if let path = patch {
            let  data  = NSData.init(contentsOfFile: path)
            if let dataTemp = data as? Data {

                let json = try? JSONSerialization.jsonObject(with: dataTemp , options: JSONSerialization.ReadingOptions.mutableLeaves)

                return json ?? ""
                
            }
        }
        return ""
    }
}
