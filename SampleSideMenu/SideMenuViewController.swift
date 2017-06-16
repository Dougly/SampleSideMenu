//
//  SideMenuViewController.swift
//  SampleSideMenu
//
//  Created by Douglas Galante on 6/15/17.
//  Copyright © 2017 Dougly. All rights reserved.
//

import UIKit

class SideMenuViewController: UIViewController {
    
    let sideMenuView = SideMenuView()
    
    override func viewDidLoad() {
        sideMenuView.tableView.delegate = self
        sideMenuView.tableView.dataSource = self
    }
    
    func setupView() {
        self.view.addSubview(sideMenuView)
        self.view.constrain(sideMenuView)
    }
    
}

extension SideMenuViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SideMenuCell")!
        return cell
    }
    
}
