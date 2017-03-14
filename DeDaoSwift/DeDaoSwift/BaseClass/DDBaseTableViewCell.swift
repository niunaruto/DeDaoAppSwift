//
//  DDBaseTableViewCell.swift
//  DeDaoSwift
//
//  Created by niuting on 2017/3/7.
//  Copyright © 2017年 niuNaruto. All rights reserved.
//

import UIKit
import SnapKit
import UIColor_Hex_Swift

class DDBaseTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {

        
        // Configure the view for the selected state
    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
        setLayout()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    

}

extension DDBaseTableViewCell{
    
    /// 提供个方便注册cell的方法
    ///
    /// - Returns: class字符串
    class func cellIdentifier() ->String{
        return NSStringFromClass(self.classForCoder())
    }
    
    func setUI() {
        
    }
    
    func setLayout() {
        
    }
    
}

