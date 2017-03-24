//
//  DDStudyViewModel.swift
//  DeDaoSwift
//
//  Created by niuting on 2017/3/17.
//  Copyright © 2017年 niuNaruto. All rights reserved.
//

import UIKit
import ObjectMapper
class DDStudyViewModel: DDBaseTableViewModel {

    var screensHotView = UIView()
    weak var oneImageView = UIImageView()
    weak var twoImageView = UIImageView()
    
    
    var studyDailyVerseModel  = Mapper<DDStudyDailyVerseDataModel>().map(JSON : ["":""])

    func setingScreensHotView(_ view : UIView) {

        let hotImage = UIImage.screensHotView(view)

        screensHotView.frame = view.frame
        screensHotView.mj_y = 64
        screensHotView.removeFromSuperview()
        
        let imageViewHeight : CGFloat = view.frame.size.height / CGFloat(2)
        
        
        let oneImageView = UIImageView(image: hotImage)
        self.oneImageView = oneImageView
        oneImageView.layer.contentsRect = CGRect(x: 0, y: 0, width: 1, height: 0.5)
        oneImageView.layer.anchorPoint = CGPoint(x: 0.5, y: 1)
        screensHotView.addSubview(oneImageView)
        oneImageView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: imageViewHeight)
        
        
        let twoImageView = UIImageView(image: hotImage)
        self.twoImageView = twoImageView

        twoImageView.layer.contentsRect = CGRect(x: 0, y: 0.5, width: 1, height: 0.5)
        twoImageView.layer.anchorPoint = CGPoint(x: 0.5, y: 0)
        screensHotView.addSubview(twoImageView)
        twoImageView.frame = CGRect(x: 0, y: imageViewHeight, width: view.frame.size.width, height: imageViewHeight)
        
        let oneShadowView = UIView(frame: oneImageView.bounds)
        oneShadowView.backgroundColor = UIColor.black
        oneShadowView.alpha = 0
        oneImageView.addSubview(oneShadowView)
        
        let twoShadowView = UIView(frame: twoImageView.bounds)
        twoShadowView.backgroundColor = UIColor.black
        twoShadowView.alpha = 0
        twoImageView.addSubview(twoShadowView)
        
        
        
    }
    
    override func initViewModel() {
        useLoadMoreControl = false
        screensHotView.isHidden = true
    }
    
    override func refreshData(_ array: (Array<Any>) -> (), _ error: ((String) -> ())) {
        let studyDailyVerseDic = DDTool.getDictionaryWithPatch(fileName: "studyDailyverse.json") as? Dictionary<String, Any>
        let model = Mapper<DDStudyDailyVerseModel>().map(JSON: studyDailyVerseDic ?? ["":""])
        studyDailyVerseModel = model?.c?.data
        array([])
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 10
        
    }
    override func createViewModelWithModel(_ model: Any?, _ cellClass: AnyClass?) -> DDBaseTableViewModel {
        return DDStudyViewModel.init(model, cellClass)
    }
    
    override func dataAtIndexPath(_ indexPath: IndexPath) -> DDBaseTableViewModel {
        guard indexPath.row == 0 else {
            let vm = DDStudyViewModel.init("", DDStudyTimeCell.classForCoder())
            return vm
        }
        let vm = DDStudyViewModel.init(studyDailyVerseModel, DDstudyDailyverseCell.classForCoder())
        return vm
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {

        
        //print(scrollView.contentOffset.y)
        
        screensHotView.isHidden = scrollView.contentOffset.y < -64
        
        if screensHotView.isHidden == false && scrollView.contentOffset.y + 64 < screensHotView.frame.size.height {
            guard oneImageView != nil && twoImageView != nil else {
                return
            }
            let imageHeight = screensHotView.mj_h
            let transP  = scrollView.contentOffset.y + 64.0
            var transform3D = CATransform3DIdentity;
            transform3D.m34 = -1 / 1000.0;
            let angle = -CGFloat(transP) / imageHeight * CGFloat(M_PI) / 3.0
            
            oneImageView?.layer.transform = CATransform3DRotate(transform3D, angle, 0.5, 0, 0)
            twoImageView?.layer.transform = CATransform3DRotate(transform3D, -angle, 0.5, 0, 0)

            

        }
        
    }
    
    
}
