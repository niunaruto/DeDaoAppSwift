//
//  DDHomeTableHeadView.swift
//  DeDaoSwift
//
//  Created by niuting on 2017/3/14.
//  Copyright © 2017年 niuNaruto. All rights reserved.
//

import UIKit

class DDHomeTableHeadView: DDBaseTableHeaderFooterView {
    
    lazy var leftLiveImage : UIImageView = UIImageView(image: UIImage(named: "homeLiveLight"))
    
    override func setHeadFootViewModel(_ model: Any?) {
        if let modelT = model as? Array<Any> {
            guard modelT.count >= 2 else {
                return
            }
            
            let type = modelT[1] as? String
            let dataModel = modelT[0] as? DDHomeDataModel
           
           
            settingNormalUI()
            setSubViewContent(type, dataModel)
           
        }
    }
    
    lazy var leftLabel : UILabel = {
        let leftLabel = UILabel()
        leftLabel.textColor = UIColor.init("#333333")
        leftLabel.font = UIFont.systemFont(ofSize: 13)
        return leftLabel
    }()
    
    lazy var rightLabel : UILabel = {
        let rightLabel = UILabel()
        rightLabel.textColor = UIColor.init("#999999")
        rightLabel.font = UIFont.systemFont(ofSize: 12)
        return rightLabel
    }()
    
    lazy var   rightImageView = UIImageView()
    
    
    
    override func setUI() {
        contentView.addSubview(leftLiveImage)
        contentView.addSubview(leftLabel)
        contentView.addSubview(rightLabel)
        contentView.addSubview(rightImageView)

        leftLiveImage.isHidden = true
     
        
        let bottomLine = UIView()
        bottomLine.backgroundColor = UIColor.init("#efefef")
        contentView.addSubview(bottomLine)
        bottomLine.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview()
            make.right.equalTo(rightImageView.snp.right).offset(-10)
            make.left.equalTo(leftLabel.snp.left)
            make.height.equalTo(1)
        }
        
    }
    
    override func setLayout() {
        leftLiveImage.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(10)
        }
        
        rightImageView.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(0)
        }
        
        leftLabel.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalTo(leftLiveImage.snp.left)
        }
        
        rightLabel.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalTo(rightImageView.snp.left).offset(16)
        }
        
    }
    
    func settingNormalUI()  {
        self.leftLabel.textColor = UIColor.init("#333333")
        leftLiveImage.isHidden = true
        rightImageView.isHidden = false
        
        
        rightImageView.image = UIImage.init(named: "new_main_subscribe_right")
        rightImageView.transform = CGAffineTransform(rotationAngle: CGFloat(0));
        
        
        
        rightLabel.snp.remakeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalTo(rightImageView.snp.left).offset(16)
        }
        rightImageView.snp.remakeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(0)
        }
        
        
        
        self.leftLabel.snp.remakeConstraints({ (make) in
            make.centerY.equalToSuperview()
            make.left.equalTo(leftLiveImage.snp.left)
        })
        
        self.rightLabel.snp.remakeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalTo(rightImageView.snp.left).offset(16)
        }

    }

    func setSubViewContent(_ type : String?, _ dataModel :DDHomeDataModel? ) {
        var rightText = ""
        var leftText = ""
        if type == structureType.structureTypeNew.rawValue {
            rightText = dataModel?.new?.rightTitle ?? ""
            leftText = dataModel?.new?.title ?? ""
            
        }else if type == structureType.structureTypeDataMiningAduioOrBook.rawValue {
            leftText = dataModel?.dataMiningAduioOrBook?.title ?? ""
            rightText = (dataModel?.dataMiningAduioOrBook?.rightTitle ?? "").characters.count > 0 ? (dataModel?.dataMiningAduioOrBook?.rightTitle ?? "") : "换一换"
            
            setRightLabelIsChangeUI()
            
            
        }else if type == structureType.structureTypeFreeAudio.rawValue {
            rightText = dataModel?.freeAudio?.rightTitle ?? ""
            leftText = dataModel?.freeAudio?.title ?? ""
        }else if type == structureType.structureTypeColumn.rawValue { //
            rightText = (dataModel?.column?.rightTitle ?? "").characters.count > 0 ? (dataModel?.column?.rightTitle ?? "") : "换一换"
            leftText = dataModel?.column?.title ?? ""
            
            setRightLabelIsChangeUI()
            
        }else if type == structureType.structureTypeStorytell.rawValue {
            leftText = dataModel?.storytell?.title ?? ""
            rightText = "查看书单"
        }else if type == "live" {
            var descStatus = "预约"
            
            if dataModel?.live?.data?.status == 1 {
                leftText = "正在直播"
                descStatus = "在线"
            }else{
                leftText = "直播未开始"
            }
            
            if let cont = dataModel?.live?.data?.online_num {
                rightText = "\(cont)人" + descStatus
            }
            
            
            leftLiveImage.isHidden = false
            rightImageView.isHidden = true
            self.leftLabel.snp.remakeConstraints({ (make) in
                make.centerY.equalToSuperview()
                make.left.equalTo(leftLiveImage.snp.right).offset(3)
            })
            
            self.rightLabel.snp.remakeConstraints({ (make) in
                make.centerY.equalToSuperview()
                make.right.equalTo(rightImageView.snp.right).offset(-10)
            })
            self.leftLabel.textColor = UIColor.orange
            
            
        }
        self.leftLabel.text = leftText
        self.rightLabel.text = rightText
    }
    
    /// RightLabel为换一换时的UI
    func setRightLabelIsChangeUI() {
        
        rightImageView.image = UIImage.init(named: "subscribe_positive")
        rightImageView.transform = CGAffineTransform(rotationAngle: CGFloat(M_PI_2));
        
        self.rightLabel.snp.remakeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-14)
        }
        
        rightImageView.snp.remakeConstraints({ (make) in
            make.centerY.equalToSuperview()
            make.right.equalTo(self.rightLabel.snp.left).offset(-3)
        })

    }
}
