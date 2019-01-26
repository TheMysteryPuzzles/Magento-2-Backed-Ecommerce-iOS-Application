//  Copyright © 2018 TheMysteryPuzzles.

import UIKit

@objc public protocol D3ListDelegate : class {
    
    @objc optional func sizeForItem(d3CollectionView : D3ListView, index: Int) -> CGSize
    
    @objc optional func didSroll(d3ListView: D3ListView)
    
    @objc func d3ListView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
}
