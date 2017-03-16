//
//  DDHomeSubjectCell.swift
//  DeDaoSwift
//
//  Created by niuting on 2017/3/15.
//  Copyright © 2017年 niuNaruto. All rights reserved.
//

import UIKit

class DDHomeSubjectCell: DDBaseTableViewCell {

    override func setCellsViewModel(_ model: Any?) {
        if let modelT = model as? DDHomeSubjectModel {
            guard subjectViewnArray.count >= 4 && modelT.list?.count ?? 0 >= 4 else {
                return
            }
            
            for i in 0...3 {
                
                let img : UIImageView = subjectViewnArray[i].infoImageView
                if let image = modelT.list?[i].m_img {
                    img.kf.setImage(with: URL(string: image))
                }

            }
            
            
        }
    }
    
    
    lazy var subjectViewnArray = Array<DDHomeSubjectView>()
    
    override func setUI() {
        let backView = UIView()
        let backViewH : CGFloat = 240
        
        contentView.addSubview(backView)
        backView.snp.makeConstraints({ (make) in
            make.left.right.bottom.equalToSuperview()
            make.top.equalToSuperview().offset(10)
            make.height.equalTo(backViewH)
        })

        let count = 2
        

        let subjectViewW = UIView.screenWidth / CGFloat(count)
        let subjectViewH = backViewH / CGFloat(count)
       
        
        for i in 0...3 {
            
            let subjectView = DDHomeSubjectView()
            backView.addSubview(subjectView)
            let row = i %  count
            let section  = i /  count
            subjectView.frame = CGRect(x: CGFloat(row) * subjectViewW, y: CGFloat(section) * subjectViewH, width: subjectViewW, height: subjectViewH)
            subjectViewnArray.append(subjectView)
            
        }
    }
    
    

}

class DDHomeSubjectView: UIView {
    
    
    
    lazy var infoImageView : UIImageView = {
        let infoImageView = UIImageView()
        infoImageView.contentMode = .scaleAspectFill
        infoImageView.clipsToBounds = true
        
        infoImageView.layer.masksToBounds  = true
        infoImageView.layer.cornerRadius = 10
        return infoImageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setUI() {
        addSubview(infoImageView)
        infoImageView.snp.makeConstraints { (make) in
            make.bottom.right.equalToSuperview().offset(-10)
            make.top.left.equalToSuperview().offset(10)
        }
    }
}
