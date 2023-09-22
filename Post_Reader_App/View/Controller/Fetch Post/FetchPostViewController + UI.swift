//
//  FetchPostViewController + UI.swift
//  Post_Reader_App
//
//  Created by Neosoft on 22/09/23.
//

import UIKit
extension FetchPostsViewController {
    func setupUI(){
        self.setupTableview()
    }
  
    func setupTableview(){
        fetchDataTableview.register(PostsTableViewCell.self)
        fetchDataTableview.delegate = self
        fetchDataTableview.dataSource = self
        fetchDataTableview.rowHeight = UITableView.automaticDimension
        fetchDataTableview.sectionFooterHeight = 0.0
        fetchDataTableview.tableFooterView = UIView(frame: .zero)
        fetchDataTableview.separatorStyle = .singleLine
        fetchDataTableview.backgroundColor = .clear
        fetchDataTableview.showsVerticalScrollIndicator = false
        fetchDataTableview.allowsSelection = true
    }
}
