//
//  CustomImageFlowLayout.swift
//  TheMagicTheWorldTheYou
//
//  Created by Lili on 18/09/2019.
//  Copyright © 2019 Lily. All rights reserved.
//

import UIKit

class CustomImageFlowLayout: UICollectionViewFlowLayout {
    override init() {
        super.init()
        setupLayout()
        
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupLayout()
        
    }
    override var itemSize: CGSize {
        set {}
         get {
            let numberOfColumns: CGFloat = 3
            let itemWidth = (self.collectionView!.frame.width - (numberOfColumns - 1)) / numberOfColumns
            return CGSize(width: itemWidth, height: itemWidth)
        }
    }
    func setupLayout()  {
        minimumLineSpacing = 1
        minimumLineSpacing = 1
        scrollDirection = .vertical
        
    }
}
