//
//  PostViewController.swift
//  Post_Reader_App
//
//  Created by Neosoft on 21/09/23.
//

import UIKit
import Network

class PostViewController: UIViewController {
    @IBOutlet weak var postTableview: UITableView!
    
    var userPost: [UserPost] = []
    var postViewModel = PostsViewModel()
    var currentPage = 1
    var totalPages = 1
    let refreshControl = UIRefreshControl()
    
    let monitor = NWPathMonitor()
    let queue = DispatchQueue(label: "Network Monitor")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkInternetConnection()
        setupUI()
        DispatchQueue.main.async {
            self.fetchPosts()
        }
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
           postTableview.addSubview(refreshControl)
       
     }
    
    
    @objc func refresh(_ sender: AnyObject) {
        refreshControl.endRefreshing()
        fetchPosts()
        postTableview.reloadData()
     }
    
    func checkInternetConnection(){
        monitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                // network is available
               
            } else {
                // network not available
                DispatchQueue.main.async {
                    self.displayAlert()
                }
            }
        }
        monitor.start(queue: queue)
    }
    
    func displayAlert() {
           let alert = UIAlertController(title: "No Network", message: "Please check your network connection, click database Icon to get data from database", preferredStyle: .alert)
           let action = UIAlertAction(title: "OK", style: .default, handler: nil)
           alert.addAction(action)
           present(alert, animated: true, completion: nil)
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
