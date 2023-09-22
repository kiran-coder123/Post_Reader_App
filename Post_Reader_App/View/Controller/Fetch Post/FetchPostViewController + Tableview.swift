//
//  FetchPostViewController + Tableview.swift
//  Post_Reader_App
//
//  Created by Neosoft on 22/09/23.
//

import UIKit

extension FetchPostsViewController: UITableViewDelegate {
    
}
extension FetchPostsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = fetchDataTableview.dequeReusableCell(PostsTableViewCell.self) else {return UITableViewCell()}
        let post = postsData[indexPath.row]
        cell.userProfileImageview.isHidden = true
        cell.userIdLabel.text = "\(post.userId)"
         cell.idLabel.text = "\(post.id)"
        cell.titleLabel.text = "Title: \t \(post.title ?? " ")"
        cell.bodyLabel.text = "Body: \t \(post.body ?? " ")"
        return cell
    }
    
    
}
