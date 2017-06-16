//
//  SideMenuCellView.swift
//  SampleSideMenu
//
//  Created by Douglas Galante on 6/15/17.
//  Copyright © 2017 Dougly. All rights reserved.
//

import UIKit

class SideMenuCellView: UIView {
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var optionLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        Bundle.main.loadNibNamed("SideMenuCellView", owner: self, options: nil)
        self.addSubview(contentView)
        self.constrain(contentView)
    }
    
    
}
