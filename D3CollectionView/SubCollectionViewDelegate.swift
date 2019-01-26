//  Copyright © 2018 TheMysteryPuzzles.

import UIKit

@objc public protocol SubCollectionViewDelegate: class {
    

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
}
