//
//  ViewController.swift
//  SampleSideMenu
//
//  Created by Douglas Galante on 6/15/17.
//  Copyright © 2017 Dougly. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var sideMenuView: SideMenuView!
    @IBOutlet weak var sideMenuViewTrailingAnchor: NSLayoutConstraint!
    @IBOutlet weak var backgroundCoverView: UIView!
    
    let sampleData = SampleData()
    var renterIsCollapsed = true
    var providerIsCollapsed = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(menuButtonTapped))
        backgroundCoverView.addGestureRecognizer(tapGR)
        backgroundCoverView.alpha = 0
        sideMenuView.tableView.delegate = self
        sideMenuView.tableView.dataSource = self

    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.sideMenuView.setCornerRadius()
    }

    @IBAction func menuButtonTapped(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.2, delay: 0, options: [.curveEaseOut], animations: {
            if self.sideMenuViewTrailingAnchor.constant == 0 {
                self.sideMenuViewTrailingAnchor.constant = self.sideMenuView.frame.width
                self.backgroundCoverView.alpha = 1
            } else {
                self.sideMenuViewTrailingAnchor.constant = 0
                self.backgroundCoverView.alpha = 0
            }
            self.view.layoutIfNeeded()
        }, completion: nil)
    }

}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sampleData.menuItems.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SideMenuCell") as! SideMenuCell
        cell.sideMenuCellView.optionLabel.text = sampleData.menuItems[indexPath.row]
        
        switch indexPath.row {
        case 0, 1, 2, 3:
            cell.sideMenuCellView.contentView.backgroundColor = UIColor.themeBlue
        case 4, 5, 6, 7:
            cell.sideMenuCellView.contentView.backgroundColor = UIColor.themeGreen
        default:
            break
        }
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if renterIsCollapsed {
            switch indexPath.row {
            case 1, 2, 3: return 0
            default: break
            }
        }
        
        if providerIsCollapsed {
            switch indexPath.row {
            case 5, 6, 7: return 0
            default: break
            }
        }
        
        return 44
    }
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            if renterIsCollapsed {
                renterIsCollapsed = false
            } else {
                renterIsCollapsed = true
            }
        case 4:
            if providerIsCollapsed {
                providerIsCollapsed = false
            } else {
                providerIsCollapsed = true
            }
        default:
            break
        }
        
        tableView.beginUpdates()
        tableView.endUpdates()
    }
    
    
}

