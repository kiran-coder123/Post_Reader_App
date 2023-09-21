//
//  PostViewController + UI.swift
//  Post_Reader_App
//
//  Created by Neosoft on 21/09/23.
//

import UIKit
extension PostViewController {
    
    func setupUI() {
        setupTableviewCell()
    }
    func setupTableviewCell(){
        postTableview.register(PostsTableViewCell.self)
        postTableview.delegate = self
        postTableview.dataSource = self
        postTableview.rowHeight = UITableView.automaticDimension
        postTableview.sectionFooterHeight = 0.0
        postTableview.tableFooterView = UIView(frame: .zero)
        postTableview.separatorStyle = .singleLine
        postTableview.backgroundColor = .clear
        postTableview.showsVerticalScrollIndicator = false
        postTableview.allowsSelection = true
    }
    
    
    
}
