//
//  DDHomeFreeAudioCell.swift
//  DeDaoSwift
//
//  Created by niuting on 2017/3/13.
//  Copyright © 2017年 niuNaruto. All rights reserved.
//

import UIKit

class DDHomeFreeAudioCell: DDBaseTableViewCell {

    let playBtnW : CGFloat = 100
    
    lazy var playButton : UIButton = {
       
        let playButton = UIButton()
        
        playButton.setImage(UIImage.init(named: "new_main_audio_play_icon"), for: .normal)
        
        return playButton
    }()
    
    
    var listArray = Array<Any>(){
        didSet{
            for i in 0...listArray.count{
                
                let contentLable = UILabel()
                let height : CGFloat = 14
                let starY : CGFloat = 10
                contentLable.frame = CGRect(x: 0, y: starY + CGFloat(i) * height, width: UIView.screenWidth - playBtnW , height: height)
                contentLable.font = UIFont.systemFont(ofSize: 10)
                contentLable.textColor = UIColor.init("#666666")
                
                contentView.addSubview(contentLable)

            }

        }
    }
    
    
    override func setUI() {
        
        contentView .addSubview(playButton)
        
        
        
    }
    
    override func setLayout() {
        
        playButton.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-20)
            make.bottom.equalToSuperview().offset(-45)
        }
    }

}
