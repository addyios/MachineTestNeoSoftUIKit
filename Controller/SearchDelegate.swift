//
//  SearchDelegate.swift
//  MachineTestNeoSoft-UIKit
//
//  Created by APPLE on 03/09/24.
//
import UIKit
import Foundation

//Mark: Search bar delegate methods
extension HomeViewController: UISearchBarDelegate{
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        CarouselHeight.constant = 0.0
        searchItem.showsCancelButton = true
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            isSearching = false
            filteredData.removeAll()
        } else {
            isSearching = true
            filteredData = viewModel.items.filter { item in
                item.title!.lowercased().hasPrefix(searchText.lowercased())
            }
        }
        itemTblList.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        CarouselHeight.constant = 240.0
        initialSetUp()
        isSearching = false
        searchItem.showsCancelButton = false
        searchBar.text = ""
        searchBar.resignFirstResponder()
        itemTblList.reloadData()
    }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tapGesture = UITapGestureRecognizer(target: self,action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
}
