//
//  UserDetailsTableViewCell.swift
//  Post_Reader_App
//
//  Created by Neosoft on 21/09/23.
//

import UIKit
import SafariServices

class UserDetailsTableViewCell: UITableViewCell {
    @IBOutlet weak var userPictureImageview: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var websitesLabel: UILabel!
    
    
    var userProfile: UIImage?
    var userDetails: UserDetailsModel?
    private var application = UIApplication.shared
    var navigationController: UINavigationController?
    var userDetailViewModel: UserDetailsViewModel?
    
    var geo: Geo?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        if let image = userProfile {
            userPictureImageview.image = image
        }
        
        let emailTap = UITapGestureRecognizer(target: self, action: #selector(emailTapped))
        emailLabel.isUserInteractionEnabled = true
        emailLabel.addGestureRecognizer(emailTap)
        
        let mobileTap = UITapGestureRecognizer(target: self, action: #selector(mobileTapped))
        phoneLabel.isUserInteractionEnabled = true
        phoneLabel.addGestureRecognizer(mobileTap)
        
        let websiteTap = UITapGestureRecognizer(target: self, action: #selector(websiteTap))
        websitesLabel.isUserInteractionEnabled = true
        websitesLabel.addGestureRecognizer(websiteTap)
        
        let addressTap = UITapGestureRecognizer(target: self, action: #selector(showLocationTapped))
        locationLabel.isUserInteractionEnabled = true
        locationLabel.addGestureRecognizer(addressTap)
    }
    
    @objc func websiteTap(){
        if let website = URL(string: "https://www.+\(userDetails?.website)") {
            let safariViewController = SFSafariViewController(url: website)
            UIApplication.shared.windows.first?.rootViewController?.present(safariViewController, animated: true, completion: nil)
            
        }
    }
    
    // MARK: email address sending
    @objc func emailTapped(){
        #if targetEnvironment(simulator)
       showAlert(message: "Email Operation failed,due to simulator. its work only Physical device.")
        #else
        if let url = URL(string: "mailto:\(userDetails?.email ?? "no email address")") {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
           
        } else {
        showAlert()
        }
        #endif
    }
    
    func showAlert(message: String? = nil){
        let alertController = UIAlertController(title: "Alert", message: "\(message ?? "")", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in }
      alertController.addAction(okAction)
               
               if let viewController = UIApplication.shared.keyWindow?.rootViewController {
                   viewController.present(alertController, animated: true, completion: nil)
        }
    }

    
    // MARK: mobile calling
    
    @objc func mobileTapped(){
        #if targetEnvironment(simulator)
        showAlert(message: "Mobile Operation failed,due to simulator. its work only Physical device.")
        #else
        if let phoneUrl = URL(string:"tel://\( userDetails?.phone ?? "")"){
            if application.canOpenURL(phoneUrl){
                application.open(phoneUrl, options: [:], completionHandler: nil)
            } else {
                // alert
                print("no mobile found")
            }
        }
#endif
    }
    
    @objc func showLocationTapped(){
        if let latitude = userDetailViewModel?.userDetails?.address?.geo?.lat,
           let longitude = userDetailViewModel?.userDetails?.address?.geo?.lng,
           let lat = Double(latitude),
           let lng = Double(longitude) {
            let urlStr = "https://www.google.com/maps/search/?api=1&query=\(lat),\(lng)"
            if let url = URL(string: urlStr), UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        } else {
             showAlertLocation(message: "Invalid latitude or longitude")
        }
   }
    
    func showAlertLocation(message: String? = nil){
        let alertController = UIAlertController(title: "Alert", message: "\(message ?? "")", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in }
      alertController.addAction(okAction)
               
               if let viewController = UIApplication.shared.keyWindow?.rootViewController {
                   viewController.present(alertController, animated: true, completion: nil)
        }
    }
    
}
