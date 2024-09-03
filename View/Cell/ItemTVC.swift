//
//  ItemTVC.swift
//  MachineTestNeoSoft-UIKit
//
//  Created by APPLE on 02/09/24.
//

import UIKit

class ItemTVC: UITableViewCell {

    @IBOutlet weak var subtitleLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var productImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with item: ItemModel) {
        productImg.image = item.productImg
        titleLbl.text = item.title
        subtitleLbl.text = item.subTitle
    }
    
}
