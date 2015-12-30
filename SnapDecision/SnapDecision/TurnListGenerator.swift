//
//  TurnListGenerator.swift
//  SnapDecision
//
//  Created by Richard Song on 12/28/15.
//  Copyright © 2015 brsong22. All rights reserved.
//
//  *code to hide keyboard on tap outside of textfield found at: stackoverflow.com/questions/24126678/close-ios-keyboard-by-touching-anywhere-using-swift
//

import UIKit

class TurnListGenerator: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var addUserTextField: UITextField!
    @IBOutlet weak var addUserButton: UIButton!
    @IBOutlet weak var turnListTableContainer: UIView!
    var turnListTableVC: TurnListUserTableViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.addUserTextField.delegate = self
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
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
        let newUser = TurnListUser(userName: addUserTextField.text!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()))
        if(newUser.getName() != ""){
            turnListTableVC.addUser(newUser)
        }
        clearText()
        dismissKeyboard()
    }
    
    func dismissKeyboard(){
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        addUserButtonPress(self)
        return true
    }
    func clearText(){
        addUserTextField.text = ""
    }
}
