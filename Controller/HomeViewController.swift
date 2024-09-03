//
//  ViewController.swift
//  MachineTestNeoSoft-UIKit
//
//  Created by APPLE on 02/09/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    ///Carousel Collection view outlets
    @IBOutlet weak var CarouselCollectionView: UICollectionView!
    @IBOutlet weak var CarouselCount: UIPageControl!
    
    ///Table view outlets
    @IBOutlet weak var TableViewHeight: NSLayoutConstraint!
    @IBOutlet weak var searchItem: UISearchBar!
    @IBOutlet weak var itemTblList: UITableView!
    @IBOutlet weak var CarouselHeight: NSLayoutConstraint!
    @IBOutlet var bottomSheetView: UIView!
    
    /// popup outlets
    @IBOutlet weak var headerLbl: UILabel!
    @IBOutlet weak var characterCountLbl: UILabel!
    @IBOutlet weak var itemNameLbl: UILabel!
    
    let viewModel = ItemViewModel()
    var filteredData = [ItemModel]()
    var isSearching = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        initialSetUp()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        ItemCalculation()
    }
    
    ///set up item Tbl view cell / colloection view cell
    func initialSetUp(){
        itemTblList.register(UINib(nibName: "ItemTVC", bundle: nil), forCellReuseIdentifier: "ItemTVC")
        CarouselCollectionView.register(UINib(nibName: "CarouselCVC", bundle: nil), forCellWithReuseIdentifier: "CarouselCVC")
        viewModel.fetchItems()
        
        searchItem.placeholder = "Search for items..."
        if let layout = CarouselCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
        CarouselCollectionView.isPagingEnabled = true
        CarouselCount.numberOfPages = viewModel.carouselImages.count
        CarouselCount.currentPage = 0
    }
    
    ///calculate character count / total item
    private func ItemCalculation(){
        headerLbl.text = "Total \(viewModel.items.count) item in list"
        
        let titles = viewModel.items.compactMap { $0.title }
        itemNameLbl.text = titles.joined(separator: ", ")
        
        let characterCounts = countCharacterOccurrences(items: viewModel.items)
        let top3Characters = getTopNCharacters(from: characterCounts, topN: 3)
        characterCountLbl.text = top3Characters.map { "\($0.0) = \($0.1) time(s)" }.joined(separator: "\n")
    }
    
    ///each character count from itemModel (title)
    private func countCharacterOccurrences(items: [ItemModel]) -> [Character: Int] {
        var characterCountDict: [Character: Int] = [:]
        for item in items {
            let title = item.title!
            for character in title {
                if character.isWhitespace { continue }
                characterCountDict[character, default: 0] += 1
            }
        }
        return characterCountDict
    }
    
    private func getTopNCharacters(from counts: [Character: Int], topN: Int) -> [(Character, Int)] {
        return counts.sorted(by: { $0.value > $1.value }).prefix(topN).map { ($0.key, $0.value) }
    }
    override func viewWillLayoutSubviews() {
        self.TableViewHeight.constant = self.itemTblList.contentSize.height
    }
    
    ///for custome popup view
    func AddSubViewtoParentView(parentview: UIView! , subview: UIView!) {
        subview.translatesAutoresizingMaskIntoConstraints = false
        parentview.addSubview(subview);
        parentview.addConstraint(NSLayoutConstraint(item: subview as Any, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: parentview, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1.0, constant: 0.0))
        parentview.addConstraint(NSLayoutConstraint(item: subview as Any, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: parentview, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1.0, constant: 0.0))
        parentview.addConstraint(NSLayoutConstraint(item: subview as Any, attribute: NSLayoutConstraint.Attribute.bottom, relatedBy: NSLayoutConstraint.Relation.equal, toItem: parentview, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1.0, constant: 0.0))
        parentview.addConstraint(NSLayoutConstraint(item: subview as Any, attribute: NSLayoutConstraint.Attribute.trailing, relatedBy: NSLayoutConstraint.Relation.equal, toItem: parentview, attribute: NSLayoutConstraint.Attribute.trailing, multiplier: 1.0, constant: 0.0))
        parentview.layoutIfNeeded()
    }
    
    @IBAction func PresentSheetBtnAction(_ sender: Any) {
        AddSubViewtoParentView(parentview: self.view, subview: bottomSheetView)
    }
    
    @IBAction func dismissPopUpBtnAction(_ sender: Any) {
        self.bottomSheetView.removeFromSuperview()
    }
}






///comments code
//for (character, count) in top3Characters {
//    print("\(character) =  \(count) time(s)")
//}
//for (title, count) in characterCounts {
//    print("\(title): \(count) characters")
//}
