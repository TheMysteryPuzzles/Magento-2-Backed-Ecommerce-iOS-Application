//  Copyright © 2018 TheMysteryPuzzles.

import UIKit

public class D3ListView: UICollectionView {
    
    
    public var isScrolling: Bool {
        return (self.isDragging || self.isTracking || self.isDecelerating)
    }
}
