//
//  TurnListUser.swift
//  SnapDecision
//
//  Created by Richard Song on 12/28/15.
//  Copyright © 2015 brsong22. All rights reserved.
//
//  code for configuring table view and cells adapted from: 
//      https://developer.apple.com/library/ios/referencelibrary/GettingStarted/DevelopiOSAppsSwift/Lesson7.html
//

import UIKit

class TurnListUserTableViewController: UITableViewController {

    var users = [TurnListUser]()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        self.turnListTable.registerClass(UITableViewCell.self, forCellReuseIdentifier: "TurnListTableCell")
//        
//        turnListTable.delegate = self
//        turnListTable.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "TurnListTableCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! TurnListTableCell
        let user = users[indexPath.row]
        if(cell.turnListCellLabel == nil){
            print("nil label")
        }
        cell.turnListCellLabel.text = user.getName()
        
        return cell
    }
    
    func addUser(newUser: TurnListUser){
        users.append(newUser)
        tableView.reloadData()
    }
}
