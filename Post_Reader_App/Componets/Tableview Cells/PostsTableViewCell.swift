//
//  PostsTableViewCell.swift
//  Post_Reader_App
//
//  Created by Neosoft on 21/09/23.
//

import UIKit
import SDWebImage

class PostsTableViewCell: UITableViewCell {
    @IBOutlet weak var userProfileImageview: UIImageView!
    @IBOutlet weak var userIdLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var postsBackgroundview: UIView!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        loadRandomImage()
        setupImageview()
        setupView()
    }
    
    func setupImageview() {
        userProfileImageview?.layer.cornerRadius = (userProfileImageview?.frame.size.width ?? 0.0) / 2
        userProfileImageview?.clipsToBounds = true
        userProfileImageview?.layer.borderWidth = 3.0
        userProfileImageview?.layer.borderColor = UIColor.white.cgColor
    }
    func setupView() {
        postsBackgroundview.layer.cornerRadius = 10
        
    }
    
      func loadRandomImage() {
          guard let url = URLConstant.userProfile else { return }
          
          URLSession.shared.dataTask(with: url) { data, response, error in
              if let data = data, let image = UIImage(data: data) {
                  DispatchQueue.main.async {
                    
               //   self.userProfileImageview.sd_setImage(with: url, placeholderImage: UIImage(named: "placeholder.png"))
                     self.userProfileImageview.image = image
                      
                    //  self.userProfileImageview.sd_setImage(with: URL(string: "https://xsgames.co/randomusers/avatar.php?g=male"), placeholderImage: UIImage(named: "placeholder.png"))

                  }
              }
          }.resume()
      }
    
}
