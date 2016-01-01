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
            turnListTableVC = segue.destinationViewController as! TurnListUserTableViewController
    }
    
    @IBAction func generateListButtonPress(sender: AnyObject) {
        turnListTableVC.users = turnListTableVC.users.shuffle()
        turnListTableVC.tableView.reloadData()
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

//functions for shuffle found at
//http://stackoverflow.com/questions/24026510/how-do-i-shuffle-an-array-in-swift

//extend the shuffle method of Swift collections
extension CollectionType {
    func shuffle() -> [Generator.Element] {
        var list = Array(self)
        list.shuffleInPlace()
        return list
    }
}

//extend the shuffleInPlace method
extension MutableCollectionType where Index == Int {
    mutating func shuffleInPlace(){
        if (count > 1){
            for(var i = 0; i < count-1; i++){
                let rand = Int(arc4random_uniform(UInt32(count - i))) + i
                guard i != rand else {//if i == rand dont swap the index with itself
                    continue
                }
                swap(&self[i], &self[rand]) //if i != rand swap the indices
            }
        }
        
    }
}
