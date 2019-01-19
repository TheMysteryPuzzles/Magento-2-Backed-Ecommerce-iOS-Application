//  Copyright © 2018 TheMysteryPuzzles.

import UIKit

let reuseSubCollectionViewIdentifier = "SubCollectionViewIdentifier"

public class D3List : UIView {
    
    var storedOffsets = [Int: CGFloat]()
    var d3ListView: D3ListView!
    
    public var topInset: CGFloat = 20 {
        didSet{
            setD3ListContentInsets()
        }
    }
    
    public var sideInset: CGFloat = 20 {
        didSet{
            
            setD3ListContentInsets()
        }
    }
    
    public var nextVisibleItemHeight: CGFloat = 50 {
        didSet{
            setD3ListContentInsets()
        }
    }
    
    public var itemSpacing: CGFloat = 20 {
        willSet{
            flowLayout.minimumLineSpacing = newValue
        }
    }
    
    public var firstItemTransform: CGFloat = 0.05 {
        willSet{
            flowLayout.firstItemTransform = newValue
        }
    }
    
    public weak var delegate: D3ListDelegate?
    public weak var dataSource: D3ListDatasource?{
        didSet{
            numberOfItems = dataSource?.numberOfItems(inD3List: self.d3ListView) ?? 0
        }
    }
    
    fileprivate var numberOfItems: Int = 0
    
    fileprivate lazy var flowLayout: D3ListViewFlowLayout = {
        let flowLayout = D3ListViewFlowLayout()
        flowLayout.firstItemTransform = firstItemTransform
        flowLayout.minimumLineSpacing = itemSpacing
        flowLayout.isPagingEnabled = true
        return flowLayout
    }()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    fileprivate func commonInit(){
        setupD3ListView()
    }
    
    fileprivate func setD3ListContentInsets(){
        d3ListView.contentInset = UIEdgeInsets(top: topInset, left: sideInset, bottom: topInset + flowLayout.minimumLineSpacing + nextVisibleItemHeight, right: sideInset)
    }
    
    
}


extension D3List: UICollectionViewDelegate, UICollectionViewDataSource {
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return (dataSource?.d3ListView(d3ListView, cellForItemAt: indexPath))!
    }
    
    
    public func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        guard let collectionViewCell = cell as? D3ListViewCell else { return }
        dataSource?.d3ListView(collectionView, willDisplay: collectionViewCell , forItemAt: indexPath)
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.numberOfItems
    }
    
    
    
    fileprivate func setupD3ListView(){
        
        d3ListView = D3ListView(frame: self.frame, collectionViewLayout: flowLayout)
        d3ListView.decelerationRate = UIScrollView.DecelerationRate.fast
        d3ListView.backgroundColor =  UIColor.white
        setD3ListContentInsets()
        d3ListView.showsVerticalScrollIndicator = false
        d3ListView.delegate = self
        d3ListView.dataSource = self
        
        
        self.numberOfItems = dataSource?.numberOfItems(inD3List: d3ListView) ?? 0
        self.addSubview(d3ListView)
        d3ListView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            d3ListView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            d3ListView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            d3ListView.topAnchor.constraint(equalTo: self.topAnchor),
            d3ListView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            ])
    }
    
}

extension D3List: UICollectionViewDelegateFlowLayout {
    
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var cellWidth: CGFloat!
        var cellHeight: CGFloat!
        let xInsets = sideInset * 2
        let yInsets = itemSpacing + nextVisibleItemHeight + topInset
        
        // get size from delegate if the sizeForItem function is called
        if let customSize = delegate?.sizeForItem?(d3CollectionView: d3ListView, index: indexPath.row) {
            // set custom sizes and make sure sizes are not negative, if they are, dont subtract the insets
            
            cellWidth = customSize.width - (customSize.width - xInsets > 0 ? xInsets : 0)
            cellHeight = customSize.height - (customSize.height - yInsets > 0 ? yInsets : 0)
        }else{
            cellWidth = collectionView.frame.size.width - xInsets
            cellHeight = collectionView.frame.size.height - yInsets
        }
        
        // set cellHeight in the custom flowLayout, we use this for paging calulations
        flowLayout.cellHeight = cellHeight
        
        return CGSize(width: cellWidth, height: cellHeight)
        
    }
    
}

extension D3List{
    
    public func reloadData(){
        d3ListView.reloadData()
    }
    
    public func register(_ cellClass: AnyClass? , forCellWithReuseIdentifier identifier: String){
        d3ListView.register(cellClass, forCellWithReuseIdentifier: identifier)
    }
    
    public func register(nib: UINib?, forCellWithReuseIdentifier identifier: String){
        d3ListView.register(nib, forCellWithReuseIdentifier: identifier)
    }
    
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        delegate?.didSroll?(d3ListView: d3ListView)
    }
    
    
    public func performBatchUpdates(_ updates: (() -> Void)?, completion: ((Bool) -> Void)? = nil){
        self.d3ListView.performBatchUpdates(updates, completion: completion)
        
        
    }
    
    public func insertItems(at indexPaths: [IndexPath]){
        d3ListView.insertItems(at: indexPaths)
    }
    
    public func deleteItems(at indexPaths: [IndexPath]){
        d3ListView.deleteItems(at: indexPaths)
        
    }
    public func numberOfItems(inSection section: Int) -> Int{
        return self.d3ListView.numberOfItems(inSection: section)
        
    }
    public func reloadItems(at indexPaths: [IndexPath]){
        self.d3ListView.reloadItems(at: indexPaths)
    }
    
}


