//
//  PostViewController.swift
//  Post_Reader_App
//
//  Created by Neosoft on 21/09/23.
//

import UIKit

class PostViewController: UIViewController {
    @IBOutlet weak var postTableview: UITableView!
    
    var postViewModel = PostsViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        DispatchQueue.main.async {
            self.fetchPosts()
        }
        
       
     }
    func fetchPosts(){
        postViewModel.getPostsRecord { [weak self] post in
            self?.postViewModel.posts = post ?? []
            DispatchQueue.main.async {
                self?.postTableview.reloadData()
            }
        }
    }

}
