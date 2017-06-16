//
//  SideMenuCell.swift
//  SampleSideMenu
//
//  Created by Douglas Galante on 6/15/17.
//  Copyright © 2017 Dougly. All rights reserved.
//

import UIKit

class SideMenuCell: UITableViewCell {
    
    let sideMenuCellView = SideMenuCellView()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        self.contentView.addSubview(sideMenuCellView)
        self.contentView.constrain(sideMenuCellView)
        self.selectionStyle = .none
    }
}
