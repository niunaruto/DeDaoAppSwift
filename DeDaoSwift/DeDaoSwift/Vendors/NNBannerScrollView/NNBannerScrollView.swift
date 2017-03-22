//
//  NNBannerScrollView.swift
//  NNBannerScrollView
//
//  Created by niuting on 2017/3/8.
//  Copyright © 2017年 niuNaruto. All rights reserved.
//


@objc protocol NNBannerScrollViewDelegate : class {
   @objc optional  func bannerScrollViewDidSelectItemAt(index : NSInteger)
}

import UIKit
import Kingfisher
class NNBannerScrollView: UIView {
    
    lazy var scrollTimer : TimeInterval = 2.0
    
    weak var delegate : NNBannerScrollViewDelegate?
    var imageUrlArray : Array<String>?{
        didSet{
            
            collectionView.reloadData()
            collectionView.contentOffset.x = 10 * CGFloat((imageUrlArray?.count) ?? 0)
            scrollAuto()
            removeTimer()
            addTimer()
        }
    }
    fileprivate lazy var placeholderImage : UIImage? = UIImage()
    fileprivate var timer : Timer?
    fileprivate lazy var collectionView : UICollectionView = { [unowned self] in
        let layout = UICollectionViewFlowLayout.init()
        layout.minimumLineSpacing = 0
        layout.itemSize = self.frame.size
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: self.bounds, collectionViewLayout: layout)
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.scrollsToTop = false
        collectionView.backgroundColor = UIColor.gray
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(NNBannerScrollViewCell.classForCoder(), forCellWithReuseIdentifier: NNBannerScrollViewCell.cellIdentifier())
        return collectionView
        }()
    
    
    init(frame: CGRect,
         _ imageUrlArray : Array<String>? = nil,_ delegate : NNBannerScrollViewDelegate? = nil, _ placeholderImage : UIImage? = nil) {
        super.init(frame: frame)
        self.imageUrlArray = imageUrlArray
        self.placeholderImage = placeholderImage
        self.delegate = delegate
        setUI()
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
// MARK: 视图相关方法
extension NNBannerScrollView {
    func setUI() {
        addSubview(collectionView)
        scrollAuto()
        addTimer()
    }
    
    
    func scrollAuto(){
        guard imageUrlArray != nil && imageUrlArray?.count ?? 0 != 0 else {
            return
        }
        let currentIndex = imageUrlArray?.count ?? 0;
        let indexPath = IndexPath(item: currentIndex * 10 * currentIndex, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .left, animated: false)
        

    }
    
}

// MARK: - 定时器相关方法
extension NNBannerScrollView {
    
    func addTimer() {
        self.timer = Timer.init(timeInterval: self.scrollTimer, target: self, selector: #selector(scrollNext), userInfo: nil, repeats: true)
        RunLoop.main.add(self.timer!, forMode: .commonModes)

    }
    
    func removeTimer()  {
        timer?.invalidate()
        timer = nil

    }
    
    func scrollNext()  {
        let currentOffsetX = collectionView.contentOffset.x
        let offsetX = currentOffsetX + collectionView.bounds.width
        collectionView.setContentOffset(CGPoint(x: offsetX, y: 0), animated: true)
        guard imageUrlArray != nil else {
            return
        }
        
        if offsetX > frame.size.width * CGFloat(200 - 50) * CGFloat(imageUrlArray?.count ?? 0) {
            scrollAuto()
        }
        
        
    }
    
}

// MARK: - UICollectionViewDataSource,UICollectionViewDelegate
extension NNBannerScrollView : UICollectionViewDataSource,UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (imageUrlArray?.count ?? 0) * 200
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NNBannerScrollViewCell.cellIdentifier(), for: indexPath) as! NNBannerScrollViewCell
        if let array = imageUrlArray {
            cell.imageView.kf.setImage(with: URL(string: array[(indexPath as NSIndexPath).item % array.count]), placeholder: placeholderImage)
        }
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        delegate?.bannerScrollViewDidSelectItemAt!(index: ((indexPath as NSIndexPath).item % imageUrlArray!.count))
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        removeTimer()
    }
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        addTimer()
    }
    
}
