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
import ObjectMapper

class DDBaseTableViewCell: UITableViewCell {

    weak var delegate : DDBaseCellProtocol?
    override func setSelected(_ selected: Bool, animated: Bool) {
        
    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        contentView.backgroundColor = UIColor.white

        setUI()
        setLayout()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    

}
extension DDBaseTableViewCell {
    
    /// 子类需要对传入的model类型进行判断
    ///
    /// - Parameter model: 数据model
    func setCellsViewModel(_ model : Any?) {
        
    }
}

extension UIView{
    
    /// 提供个方便注册cell的方法
    ///
    /// - Returns: class字符串
    class func cellIdentifier() ->String{
        return NSStringFromClass(self.classForCoder())
    }
    
   
    
}

extension DDBaseTableViewCell{
    
    func setUI() {
        
    }
    
    func setLayout() {
        
    }
}

