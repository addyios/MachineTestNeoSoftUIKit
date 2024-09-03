//
//  DataViewModel.swift
//  MachineTestNeoSoft-UIKit
//
//  Created by APPLE on 02/09/24.
//

import Foundation
import UIKit

class ItemViewModel {
    
    var items:[ItemModel] = []
    var carouselImages = ["image1","image2","image4"]
    
    func fetchItems() {
        items = [
            ItemModel(title: "custard apple", subTitle: "Cus", productImg: UIImage(named: "Custardapple")),
            ItemModel(title: "apple", subTitle: "App", productImg: UIImage(named: "Apple")),
            ItemModel(title: "lemon", subTitle: "Lem", productImg: UIImage(named: "Lemon")),
            ItemModel(title: "pine apple", subTitle: "Pin", productImg: UIImage(named: "Pineapple")),
            ItemModel(title: "mango", subTitle: "Man", productImg: UIImage(named: "Mango")),
            ItemModel(title: "coconut", subTitle: "Coc", productImg: UIImage(named: "Coconut")),
            ItemModel(title: "custard apple", subTitle: "Cus", productImg: UIImage(named: "Custardapple")),
            ItemModel(title: "apple", subTitle: "App", productImg: UIImage(named: "Apple")),
            ItemModel(title: "lemon", subTitle: "Lem", productImg: UIImage(named: "Lemon")),
            ItemModel(title: "pine apple", subTitle: "Pin", productImg: UIImage(named: "Pineapple")),
            ItemModel(title: "mango", subTitle: "Man", productImg: UIImage(named: "Mango")),
            ItemModel(title: "coconut", subTitle: "Coc", productImg: UIImage(named: "Coconut")),
            ItemModel(title: "custard apple", subTitle: "Cus", productImg: UIImage(named: "Custardapple")),
            ItemModel(title: "apple", subTitle: "App", productImg: UIImage(named: "Apple")),
            ItemModel(title: "lemon", subTitle: "Lem", productImg: UIImage(named: "Lemon")),
            ItemModel(title: "pine apple", subTitle: "Pin", productImg: UIImage(named: "Pineapple")),
            ItemModel(title: "mango", subTitle: "Man", productImg: UIImage(named: "Mango")),
            ItemModel(title: "coconut", subTitle: "Coc", productImg: UIImage(named: "Coconut")),

        ]
    }
    
    func numberOfItems() -> Int {
        return items.count
    }
    
    
    func item(at index: Int) -> ItemModel {
        return items[index]
    }
}

