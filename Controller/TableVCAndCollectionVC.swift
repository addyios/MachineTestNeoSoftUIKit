//
//  ItemsTVDelegatesAndDataSource.swift
//  MachineTestNeoSoft-UIKit
//
//  Created by APPLE on 03/09/24.
//

import UIKit
import Foundation


//MARK: item list (table view cell data source and delegate)
extension HomeViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isSearching ? filteredData.count : viewModel.numberOfItems()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = itemTblList.dequeueReusableCell(withIdentifier: "ItemTVC", for: indexPath) as? ItemTVC else {
            return UITableViewCell()
        }
        let currentItem = isSearching ? filteredData[indexPath.row] : viewModel.item(at: indexPath.row)
        cell.configure(with: currentItem)
        return cell
    }
}

//MARK: Carouse Slide with count control (Collectionn view cell data source and delegate)
extension HomeViewController:UICollectionViewDataSource, UICollectionViewDelegateFlowLayout,UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.carouselImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = CarouselCollectionView.dequeueReusableCell(withReuseIdentifier: "CarouselCVC", for: indexPath) as! CarouselCVC
       
        cell.carouselImgView.image = UIImage(named: viewModel.carouselImages[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        let height: CGFloat = 206
        return CGSize(width: width, height: height)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageWidth = scrollView.frame.size.width
        let page = Int(scrollView.contentOffset.x / pageWidth)
        CarouselCount.currentPage = page
    }
    
}
