//  Copyright © 2018 TheMysteryPuzzles.

import UIKit


@objc public protocol SubCollectionViewDataSource: class {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
}
