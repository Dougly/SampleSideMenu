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
    let sampleData = SampleData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.sideMenuView.tableView.delegate = self
        self.sideMenuView.tableView.dataSource = self
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.sideMenuView.setCornerRadius()

    }

    @IBAction func menuButtonTapped(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.3, delay: 0, options: [.curveEaseOut], animations: { 
            if self.sideMenuViewTrailingAnchor.constant == 0 {
                self.sideMenuViewTrailingAnchor.constant = UIScreen.main.bounds.width / 2
            } else {
                self.sideMenuViewTrailingAnchor.constant = 0
            }
            self.view.layoutIfNeeded()
        }) { (success) in
            // nothing needed
        }
    }

}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sampleData.menuItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SideMenuCell") as! SideMenuCell
        cell.sideMenuCellView.optionLabel.text = sampleData.menuItems[indexPath.row]
        return cell
    }

    
    
}

