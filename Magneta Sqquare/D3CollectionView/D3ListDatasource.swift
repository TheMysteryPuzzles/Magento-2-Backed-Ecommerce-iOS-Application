//  Copyright © 2018 TheMysteryPuzzles.

import UIKit


@objc public protocol D3ListDatasource: class {
    
    @objc func numberOfItems(inD3List d3List: D3ListView) -> Int
    
    @objc func d3ListView(_ d3CollectionView: D3ListView, cellForItemAt indexPath: IndexPath) -> D3ListViewCell

   @objc func d3ListView(_ d3CollectionView: UICollectionView, willDisplay cell: D3ListViewCell, forItemAt indexPath: IndexPath)
}
