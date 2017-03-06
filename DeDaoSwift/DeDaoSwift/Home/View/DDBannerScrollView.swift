//
//  DDBannerScrollView.swift
//  DeDaoSwift
//
//  Created by niuting on 2017/3/6.
//  Copyright © 2017年 niuNaruto. All rights reserved.
//

import UIKit
import Kingfisher
class DDBannerScrollView: UIView {

    var cycleTimer : Timer?

    var imageUrlArrays : Array<String>? {
        didSet{
            mainView.reloadData()
//            let indexPath = IndexPath(item: (imageUrlArrays?.count ?? 0) * 1, section: 0)
//            mainView.scrollToItem(at: indexPath, at: .left, animated: false)
            // 4.添加定时器
            removeCycleTimer()
            addCycleTimer()
        }
    }
    
    lazy var flawLayout : UICollectionViewFlowLayout = { [unowned self] in
        
        let flawLayout = UICollectionViewFlowLayout()
        flawLayout.minimumLineSpacing = 0
        flawLayout.minimumInteritemSpacing = 0
        flawLayout.itemSize = self.frame.size;
        flawLayout.scrollDirection = .horizontal
        return flawLayout;
    }()
    
    lazy var mainView : UICollectionView = { [unowned self] in
        
        let mainView = UICollectionView(frame: self.frame, collectionViewLayout: self.flawLayout)
        mainView.backgroundColor = UIColor.red
        mainView.isPagingEnabled = true
        mainView.showsVerticalScrollIndicator = false
        mainView.showsHorizontalScrollIndicator = false
        mainView .register(DDHomeBannerCell.classForCoder(), forCellWithReuseIdentifier: "DDHomeBannerCell")
        
        mainView.delegate = self
        mainView.dataSource = self
        mainView.scrollsToTop = false
        return mainView
    }()
    init(frame:CGRect,placeholderImage:UIImage? = nil) {
        super.init(frame:frame)
        autoresizingMask = UIViewAutoresizing()

        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    override func layoutSubviews() {
        super.layoutSubviews()
        setUI()

    }

}
// MARK: 添加UI
extension DDBannerScrollView {
    func setUI(){
        
        addSubview(mainView)
    }
}

// MARK: UICollectionView代理方法
extension DDBannerScrollView : UICollectionViewDelegate,UICollectionViewDataSource{
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (imageUrlArrays?.count ?? 0)*1
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: "DDHomeBannerCell", for: indexPath) as! DDHomeBannerCell
        if let array = imageUrlArrays {
            cell.imageView.kf.setImage(with: URL(string: (array[indexPath.row])))
        }
        return cell
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // 1.获取滚动的偏移量
        let offsetX = scrollView.contentOffset.x + scrollView.bounds.width * 0.5
        
        // 2.计算pageControl的currentIndex
//        pageControl.currentPage = Int(offsetX / scrollView.bounds.width) % (cycleModels?.count ?? 1)
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        removeCycleTimer()
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        addCycleTimer()
    }
}

// MARK:- 对定时器的操作方法
extension DDBannerScrollView {
    fileprivate func addCycleTimer() {
        cycleTimer = Timer(timeInterval: 3.0, target: self, selector: #selector(self.scrollToNext), userInfo: nil, repeats: true)
        RunLoop.main.add(cycleTimer!, forMode: RunLoopMode.commonModes)
    }
    
    fileprivate func removeCycleTimer() {
        cycleTimer?.invalidate() // 从运行循环中移除
        cycleTimer = nil
    }
    
    @objc fileprivate func scrollToNext() {
        // 1.获取滚动的偏移量
        let currentOffsetX = mainView.contentOffset.x
        let offsetX = currentOffsetX + mainView.bounds.width
        
        // 2.滚动该位置
        mainView.setContentOffset(CGPoint(x: offsetX, y: 0), animated: true)
    }
}






// MARK: 轮播的cell
class DDHomeBannerCell: UICollectionViewCell {
    lazy var imageView : UIImageView = { [unowned self] in
        let imageView = UIImageView(frame: self.frame)
    
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
