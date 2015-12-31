//
//  TurnListGenerator.swift
//  SnapDecision
//
//  Created by Richard Song on 12/28/15.
//  Copyright © 2015 brsong22. All rights reserved.
//
//  *code for setting up data passing to tableview using
//  prepareforsegue adapted from: http://makeapppie.com/2014/07/01/swift-swift-using-segues-and-delegates-in-navigation-controllers-part-1-the-template/
//
//  *code to hide keyboard on tap outside of textfield found at: stackoverflow.com/questions/24126678/close-ios-keyboard-by-touching-anywhere-using-swift
//

import UIKit

class TurnListGenerator: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var addUserTextField: UITextField!
    @IBOutlet weak var addUserButton: UIButton!
    @IBOutlet weak var turnListTableContainer: UIView!
    var turnListTableVC: TurnListUserTableViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        errorLabel.layer.borderColor = UIColor.redColor().CGColor
        errorLabel.layer.borderWidth = 1.0
        errorLabel.layer.cornerRadius = 5
        errorLabel.hidden = true
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
    
    @IBAction func generateListButtonPress(sender: AnyObject) {
        
    }
    
    func addUser(){
        let newUser = TurnListUser(userName: addUserTextField.text!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()))
        if(newUser.getName() != ""){
            let users = turnListTableVC.getUserList()
            for user in users{
                if(user.compareUsers(newUser)){
                    errorLabel.hidden = false
                    return
                }
            }
            turnListTableVC.addUser(newUser)
            errorLabel.hidden = true
        }
        clearText()
    }
    
    func dismissKeyboard(){
        view.endEditing(true)
        errorLabel.hidden = true
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        addUser()
        return true
    }
    func clearText(){
        addUserTextField.text = ""
    }
}
