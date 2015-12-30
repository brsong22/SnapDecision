//
//  TurnListGenerator.swift
//  SnapDecision
//
//  Created by Richard Song on 12/28/15.
//  Copyright © 2015 brsong22. All rights reserved.
//

import UIKit

class TurnListGenerator: UIViewController {
    
    @IBOutlet weak var addUserTextField: UITextField!
    @IBOutlet weak var addUserButton: UIButton!
    @IBOutlet weak var turnListTableContainer: UIView!
    var turnListTableVC: TurnListUserTableViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
            if (segue.identifier == "turnListTableEmbed") {
                turnListTableVC = segue.destinationViewController as! TurnListUserTableViewController
        }
    }
    @IBAction func addUserButtonPress(sender: AnyObject) {
        let newUser = TurnListUser(userName: addUserTextField.text!)
        turnListTableVC.addUser(newUser)
    }
}
