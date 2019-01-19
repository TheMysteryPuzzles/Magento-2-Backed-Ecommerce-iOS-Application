//  Copyright © 2018 TheMysteryPuzzles.


import UIKit

@objc open class D3ListViewCell: UICollectionViewCell {
    
    open var subCollectionViewdataSource: SubCollectionViewDataSource?
    open var subCollectionViewDelegate: SubCollectionViewDelegate?
    open var subCollectionViewFrame: CGRect?
    open var subCollectionViewItemSize: CGSize?
    
    
    
    lazy private var subCollectionViewFlowLayout: SubCollectionViewFlowLayout = {
        let flowLayout = SubCollectionViewFlowLayout()
        flowLayout.itemSize = subCollectionViewItemSize!
        flowLayout.scrollDirection = .horizontal
        flowLayout.sideItemAlpha = 1.0
        flowLayout.sideItemScale = 0.9
        flowLayout.spacingMode = SpacingMode.overlap(visibleOffset: 100)
        return flowLayout
    }()
    
    lazy private var subCollectionView : UICollectionView = {
        assert(subCollectionViewFrame != nil, "In d3List(_ cellForItemAt) method Please Set subCollectionViewFrame property of D3ListViewCell in order to add subCollectionView")
        assert(subCollectionViewItemSize != nil, "In d3List(_ cellForItemAt) method Please set subCollectionViewItemSizeProperty of D3ListViewcell")
        
        let collectionView = UICollectionView(frame: subCollectionViewFrame!, collectionViewLayout: subCollectionViewFlowLayout)
        collectionView.layer.masksToBounds = true
        return collectionView
    }()
    
    public func addSubCollectionView(index: Int){
        
        subCollectionView.backgroundColor = UIColor.clear
        subCollectionView.showsVerticalScrollIndicator = false
        subCollectionView.dataSource = self
        subCollectionView.decelerationRate = UIScrollView.DecelerationRate.fast
        subCollectionView.delegate = self
        subCollectionView.tag = index
        
        self.addSubview(subCollectionView)
    }
    
    
    public func registerSubCollectionView(_ cellClass: AnyClass? , forCellWithReuseIdentifier identifier: String){
        self.subCollectionView.register(cellClass, forCellWithReuseIdentifier: identifier)
    }
    
    public func register(nib: UINib?, forCellWithReuseIdentifier identifier: String){
        self.subCollectionView.register(nib, forCellWithReuseIdentifier: identifier)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    open override func prepareForReuse() {
        super.prepareForReuse()
    }
}

extension D3ListViewCell: UICollectionViewDelegate, UICollectionViewDataSource{
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return (subCollectionViewdataSource?.collectionView(collectionView, numberOfItemsInSection: section))!
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return (subCollectionViewdataSource?.collectionView(collectionView, cellForItemAt: indexPath))!
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.subCollectionViewDelegate?.collectionView(collectionView, didSelectItemAt: indexPath)
    }
}

