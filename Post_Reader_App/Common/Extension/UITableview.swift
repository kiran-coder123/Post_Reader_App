//
//  UITableview.swift
//  Post_Reader_App
//
//  Created by Neosoft on 21/09/23.
//

import UIKit
public extension UITableView {

    func register(_ type: UITableViewCell.Type) {
        let className =  String(describing: type)
        register(UINib(nibName: className, bundle: nil), forCellReuseIdentifier: className)
    }

    func dequeReusableCell<T>(_ type: T.Type) -> T? {
        let className =  String(describing: type)
        return dequeueReusableCell(withIdentifier: className) as? T
    }
}

public extension UITableViewCell {

    @objc class var identifier: String {
        return String(describing: self)
    }
}
