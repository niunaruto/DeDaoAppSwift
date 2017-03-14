//
//  UIButton+Extension.swift
//  DeDaoSwift
//
//  Created by niuting on 2017/3/13.
//  Copyright © 2017年 niuNaruto. All rights reserved.
//

import Foundation
public enum UIButtonImagePosition : Int {
    
    
    case left
    
    case right
    
    case bottom
    
    case top
}


extension UIButton {
    
    func setImagePosition(_ position : UIButtonImagePosition ,spacing : CGFloat? = 0)  {
        setImage(currentImage, for: .normal)
        setTitle(currentTitle, for: .normal)
        let imageWidth = imageView?.image?.size.width
        let imageHeight = imageView?.image?.size.height
        
        guard imageWidth != nil && imageHeight != nil else {
            return
        }
        
        var tempSpc : CGFloat = 0
        
        if  let temp = spacing{
            tempSpc = temp
        }
        
        var attrs = Dictionary<String, Any>()
        
        attrs[NSFontAttributeName] = titleLabel?.font;
        
        let labelSize = titleLabel?.text?.boundingRect(with: UIScreen.main
            .bounds.size, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: attrs, context: nil).size
        
        if let size = labelSize {
            
            let imageOffsetX = imageWidth! + size.width / 2.0 - imageWidth! / 2.0
            let imageOffsetY = imageHeight! / 2.0 + tempSpc / 2.0
            let labelOffsetX = (imageWidth! + size.width / 2.0) - (imageWidth! + size.width) / 2.0
            let labelOffsetY = size.height / 2 + tempSpc / 2
            
            let tempWidth = getMax(size.width,imageWidth!)
            
            let changedWidth = size.width + imageWidth! - tempWidth
            
            let tempHeight = getMax(size.height, imageHeight!)
            
            let changedHeight = size.height + imageHeight! + tempSpc - tempHeight;

            
            switch position {
            case .bottom:
                
                self.imageEdgeInsets = UIEdgeInsetsMake(imageOffsetY, imageOffsetX - imageWidth!, -imageOffsetY, -imageOffsetX);
                self.titleEdgeInsets = UIEdgeInsetsMake(-labelOffsetY, -labelOffsetX, labelOffsetY, labelOffsetX);
                self.contentEdgeInsets = UIEdgeInsetsMake(changedHeight-imageOffsetY, -changedWidth/2, imageOffsetY, -changedWidth/2);
                
                
            case .top:
                
                self.imageEdgeInsets = UIEdgeInsetsMake(-imageOffsetY, imageOffsetX - imageWidth!, imageOffsetY, -imageOffsetX);
                self.titleEdgeInsets = UIEdgeInsetsMake(labelOffsetY, -labelOffsetX, -labelOffsetY, labelOffsetX);
                self.contentEdgeInsets = UIEdgeInsetsMake(imageOffsetY, -changedWidth/2, changedHeight-imageOffsetY, -changedWidth/2);
            case .right:
                
                self.imageEdgeInsets = UIEdgeInsetsMake(0, size.width + tempSpc/2, 0, -(size.width + tempSpc/2));
                self.titleEdgeInsets = UIEdgeInsetsMake(0, -(imageWidth! + tempSpc/2), 0, imageWidth! + tempSpc/2);
                self.contentEdgeInsets = UIEdgeInsetsMake(0, tempSpc/2, 0, tempSpc/2);
                
            case .left:
                
                self.imageEdgeInsets = UIEdgeInsetsMake(0, -tempSpc/2, 0, tempSpc/2);
                self.titleEdgeInsets = UIEdgeInsetsMake(0, tempSpc/2, 0, -tempSpc/2);
                self.contentEdgeInsets = UIEdgeInsetsMake(0, tempSpc/2, 0, tempSpc/2);

                
            }
            
        }
        
        
        
        

        
        
    }
    
    func getMax(_ num1 : CGFloat ,_ num2 : CGFloat) -> CGFloat {
        guard num1 >= num2 else {
            return num1
        }
        return num2
        
    }
}
