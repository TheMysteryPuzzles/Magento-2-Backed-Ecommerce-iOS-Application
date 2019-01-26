//  Copyright © 2018 TheMysteryPuzzles.

import UIKit

internal class D3ListViewFlowLayout: UICollectionViewFlowLayout {
    
    internal var firstItemTransform: CGFloat?
    
    internal var isPagingEnabled: Bool = true
    
    internal var cellHeight: CGFloat!
    
    internal override func prepare() {
        super.prepare()
        
        assert(collectionView!.numberOfSections == 1 , "Number of sections should always be 1.")
        assert(collectionView!.isPagingEnabled == false, "Paging on the collectionview itself should never be enabled. To enable cell paging, use the isPagingEnabled property of the D3ListViewFlowLayout instead.")
    }
    
    internal override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let items = NSArray(array: super.layoutAttributesForElements(in: rect)!, copyItems: true)
        
        items.enumerateObjects { (object, index, stop) -> Void in
            let attributes = object as! UICollectionViewLayoutAttributes
            self.updateCellAttributes(attributes)
        }
        return items as? [UICollectionViewLayoutAttributes]
    }
    
    
    internal override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
    // CELL PAGING
    
    internal override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        guard isPagingEnabled else {
            let latestOffset = super.targetContentOffset(forProposedContentOffset: proposedContentOffset, withScrollingVelocity: velocity)
            return latestOffset
        }
        
        // Page height used for estimating and calculating paging
        let pageHeight = cellHeight + self.minimumLineSpacing
        
        // Make an estimation of the current page position
        let approximatePage = self.collectionView!.contentOffset.y/pageHeight
        
        //Determine the current page based on velocity
        let currentPage = (velocity.y < 0.0) ? floor(approximatePage) : ceil(approximatePage)
        
        //Create custom flick veocity
        
        let flickVelocity = velocity.y * 0.3
        
        //Check how many pages the user flicked, if <= 1 then flickedPages should return 0
        let flickedPages = (abs(round(flickVelocity)) <= 1) ? 0 : round(flickVelocity)
        
        //Calculate newVerticalOffset
        let newVerticalOffset = ((currentPage + flickedPages) * pageHeight) - self.collectionView!.contentInset.top
        return CGPoint(x: proposedContentOffset.x, y: newVerticalOffset)
    }
    
    
    // Animating Cells here
    
    fileprivate func updateCellAttributes(_ attributes: UICollectionViewLayoutAttributes) {
        let minY = collectionView!.bounds.minY + collectionView!.contentInset.top
        let maxY = attributes.frame.origin.y
        
        let finalY = max(minY, maxY)
        var origin = attributes.frame.origin
        let deltaY = (finalY - origin.y) / attributes.frame.height
        
        if let itemtTransform = firstItemTransform {
            let scale = 1 - deltaY * itemtTransform
            attributes.transform = CGAffineTransform(scaleX: scale, y: scale)
        }
        
        origin.y = finalY
        attributes.frame = CGRect(origin: origin, size: attributes.frame.size)
        attributes.zIndex = attributes.indexPath.row
        
    }
}
