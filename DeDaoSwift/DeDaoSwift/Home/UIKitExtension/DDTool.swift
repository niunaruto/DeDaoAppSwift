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
    
    class func setLabelAttributedString(_ string1 : String ,_ string2 : String ,_ string1Color : UIColor? = UIColor.darkText ,_ string2Color : UIColor? = UIColor.darkText, _ sting1Font : UIFont? = UIFont.systemFont(ofSize: 13), _ sting2Font : UIFont? = UIFont.systemFont(ofSize: 13)) -> NSMutableAttributedString {
        
        
        let attributedText = NSMutableAttributedString(string: (string1 + string2))
        attributedText.addAttribute(NSForegroundColorAttributeName, value: string1Color!, range: NSRange.init(location: 0, length: string1.characters.count))
        attributedText.addAttribute(NSForegroundColorAttributeName, value: string2Color!, range: NSRange.init(location: string1.characters.count, length: string2.characters.count))
        
        
        attributedText.addAttribute(NSFontAttributeName, value: sting1Font!, range: NSRange.init(location: 0, length: string1.characters.count))
        
        
        attributedText.addAttribute(NSFontAttributeName, value: sting2Font!, range: NSRange.init(location: string1.characters.count, length: string2.characters.count))
        
        
        return attributedText
        
    }
}
