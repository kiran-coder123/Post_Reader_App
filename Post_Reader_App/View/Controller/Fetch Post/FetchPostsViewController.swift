//
//  FetchPostsViewController.swift
//  Post_Reader_App
//
//  Created by Neosoft on 22/09/23.
//

import UIKit

class FetchPostsViewController: UIViewController {
    @IBOutlet weak var fetchDataTableview: UITableView!
    
    var postsData: [UserPost] = []
  var databaseManager = PersistentStorage.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
            setupUI()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        postsData = databaseManager.fetchPosts()
        DispatchQueue.main.async {
            self.fetchDataTableview.reloadData()
        }
    }
}
