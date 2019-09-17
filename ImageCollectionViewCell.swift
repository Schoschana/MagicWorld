//
//  ImageCollectionViewCell.swift
//  TheMagicTheWorldTheYou
//
//  Created by Lili on 15/09/2019.
//  Copyright © 2019 Lily. All rights reserved.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.imageView.image = nil
    }
}
