//
//  SideMenuView.swift
//  SampleSideMenu
//
//  Created by Douglas Galante on 6/15/17.
//  Copyright © 2017 Dougly. All rights reserved.
//

import UIKit

class SideMenuView: UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var profilePictureImageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var headerViewTopConstraint: NSLayoutConstraint!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        Bundle.main.loadNibNamed("SideMenuView", owner: self, options: nil)
        self.addSubview(contentView)
        self.constrain(contentView)
        headerViewTopConstraint.constant = UIApplication.shared.statusBarFrame.height
        profilePictureImageView.layer.borderColor = UIColor.white.cgColor
        profilePictureImageView.layer.borderWidth = 1
        tableView.register(SideMenuCell.self, forCellReuseIdentifier: "SideMenuCell")
    }
    
    func setCornerRadius() {
        profilePictureImageView.layer.cornerRadius = profilePictureImageView.frame.height / 2
    }
    
}


