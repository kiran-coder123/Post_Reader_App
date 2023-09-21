//
//  UserDetailsViewController + UI.swift
//  Post_Reader_App
//
//  Created by Neosoft on 21/09/23.
//

import UIKit

//MARK: all UI related Methods
extension UserDetailsViewController {
    func setupUI() {
        setupTableviewCell()
         
    }
    func setupTableviewCell(){
        userDetailsTableview.register(UserDetailsTableViewCell.self)
        userDetailsTableview.delegate = self
        userDetailsTableview.dataSource = self
        userDetailsTableview.sectionFooterHeight = 0.0
        userDetailsTableview.tableFooterView = UIView(frame: .zero)
        userDetailsTableview.separatorStyle = .singleLine
        userDetailsTableview.backgroundColor = .clear
        userDetailsTableview.showsVerticalScrollIndicator = false
        userDetailsTableview.allowsSelection = true
    }
}
