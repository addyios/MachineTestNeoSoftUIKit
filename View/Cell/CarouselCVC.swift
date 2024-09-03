//
//  CarouselCVC.swift
//  MachineTestNeoSoft-UIKit
//
//  Created by APPLE on 03/09/24.
//

import UIKit

class CarouselCVC: UICollectionViewCell {

    @IBOutlet weak var carouselImgView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        carouselImgView.contentMode = .scaleAspectFill
        carouselImgView.clipsToBounds = true  
    }

    func configure(with item: ItemModel) {
        carouselImgView.image = item.productImg
    }
}
