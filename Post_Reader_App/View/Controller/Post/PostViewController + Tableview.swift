//
//  PostViewController + Tableview.swift
//  Post_Reader_App
//
//  Created by Neosoft on 21/09/23.
//

import UIKit

//MARK: Postviewcontroller Delegate Method
extension PostViewController: UITableViewDelegate {
    
}

//MARK: Postviewcontroller Datasource Method
extension PostViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return postViewModel.posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = postTableview.dequeReusableCell(PostsTableViewCell.self) else {return UITableViewCell()}
        let post = postViewModel.posts[indexPath.row]
        cell.loadRandomImage()
        cell.userIdLabel.text = "UserID: \(post.userId ?? 0 )"
        cell.idLabel.text = "ID: \(post.id ?? 0)"
        cell.titleLabel.text = "Tilte:\t \(post.title ?? " ")"
        cell.bodyLabel.text = "Body:\t \(post.body ?? " ")"
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let userDetailsVC = storyboard?.instantiateViewController(identifier: "UserDetailsViewController") as! UserDetailsViewController
        
        let post = postViewModel.posts[indexPath.row]
         userDetailsVC.user_Id = Int(post.userId ?? 0)
        self.navigationController?.pushViewController(userDetailsVC, animated: true)
        postTableview.deselectRow(at: indexPath, animated: true)
    }
    
  
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
   if indexPath.row == postViewModel.posts.count - 1, currentPage < totalPages {
               let pageToLoad = currentPage + 1 // Assuming currentPage is a property tracking the current page
               postViewModel.fetchPosts(page: pageToLoad, limit: 10) { [weak self] newPosts in
                   guard let newPosts = newPosts else { return }
                   self?.postViewModel.posts.append(contentsOf: newPosts)
                   self?.currentPage += 1
                   self?.totalPages = 100 // Calculate the total number of pages based on your data
                   self?.postTableview.reloadData()
               }
           }
        
        
    }
    
    
}
