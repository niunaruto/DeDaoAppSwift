//
//  DDHomeFreeAudioCell.swift
//  DeDaoSwift
//
//  Created by niuting on 2017/3/13.
//  Copyright © 2017年 niuNaruto. All rights reserved.
//

import UIKit

class DDHomeFreeAudioCell: DDBaseTableViewCell {

    
    override func setCellsViewModel(_ model: Any?) {
        if let modelT = model as? DDHomeFreeAudioModel {
            guard modelT.list?.count ?? 0 >= 4 && labelArray.count >= 4  else {
                return
            }
            if let list =  modelT.list{
                
                for i in 0...(list.count - 1) {
                    let indef = "▶ "
                    let cont = list[i].title
                    
                    let attributedText = NSMutableAttributedString(string: (indef + cont))
                    attributedText.addAttribute(NSForegroundColorAttributeName, value: UIColor.init("#999999"), range: NSRange.init(location: 0, length: indef.characters.count))
                    attributedText.addAttribute(NSForegroundColorAttributeName, value: UIColor.init("#666666"), range: NSRange.init(location: indef.characters.count, length: cont.characters.count))
                    
                    
                    attributedText.addAttribute(NSFontAttributeName, value: UIFont.systemFont(ofSize: 8), range: NSRange.init(location: 0, length: indef.characters.count))
                    
                    
                    attributedText.addAttribute(NSFontAttributeName, value: UIFont.systemFont(ofSize: 13), range: NSRange.init(location: indef.characters.count, length: cont.characters.count))
                    
                    
                labelArray[i].attributedText = attributedText
                    
                    
                    
                }
                
            }
        }
    }
    
    
    let playBtnW : CGFloat = 100
    
    lazy var playButton : UIButton = {
       
        let playButton = UIButton()
        
        playButton.setImage(UIImage.init(named: "new_main_audio_play_icon"), for: .normal)
        
        return playButton
    }()
    
    lazy var labelArray = Array<UILabel> ()
    
    
    
    override func setUI() {
        
        contentView.addSubview(playButton)
        
        for i in 0...4 {
            
            let contentLable = UILabel()
            let height : CGFloat = 14
            let starY : CGFloat = 18

            
            contentLable.frame = CGRect(x: 10, y: starY + CGFloat(i) * height + CGFloat(10 * i), width: UIView.screenWidth - playBtnW , height: height)
            contentLable.font = UIFont.systemFont(ofSize: 13)
            contentLable.textColor = UIColor.init("#666666")

            contentView.addSubview(contentLable)
            labelArray.append(contentLable)
        }
        
        
    }
    
    override func setLayout() {
        
        playButton.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-20)
            make.bottom.equalToSuperview().offset(-30)
        }
    }

}
