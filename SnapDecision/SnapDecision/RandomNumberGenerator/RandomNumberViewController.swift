//
//  RandomNumberViewController.swift
//  SnapDecision
//
//  Created by Richard Song on 1/11/16.
//  Copyright © 2016 brsong22. All rights reserved.
//

import UIKit

class RandomNumberViewController: UIViewController, UITextFieldDelegate {

    var randomNumTableVC: TurnListUserTableViewController!
    
    @IBOutlet weak var lowerLimitText: UITextField!
    @IBOutlet weak var lowerLimitStepper: UIStepper!
    
    @IBOutlet weak var upperLimitText: UITextField!
    @IBOutlet weak var upperLimitStepper: UIStepper!
    
    @IBOutlet weak var quantityText: UITextField!
    @IBOutlet weak var quantityStepper: UIStepper!
    
    @IBOutlet weak var generateNumbersButton: UIButton!
    @IBOutlet weak var clearRandNumTableButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.lowerLimitText.delegate = self
        self.upperLimitText.delegate = self
        self.quantityText.delegate = self
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissNumpad")
        view.addGestureRecognizer(tap)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!){
        if(segue.identifier == "RandNumTableIDEmbed"){
            randomNumTableVC = segue.destinationViewController as! TurnListUserTableViewController
        }
    }
    
    @IBAction func lowerLimitAdjust(sender: UIStepper) {
        lowerLimitText.text = Int(sender.value).description
    }
    
    @IBAction func upperLimitAdjust(sender: UIStepper) {
        upperLimitText.text = Int(sender.value).description
    }
    
    @IBAction func quantityAdjust(sender: UIStepper) {
        quantityText.text = Int(sender.value).description
    }
    
    @IBAction func lowerLimitChanged(sender: UITextField) {
        lowerLimitText.text = Int(lowerLimitText.text!)!.description
        updateStepValue(sender.tag)
    }
    
    @IBAction func upperLimitChanged(sender: UITextField) {
        updateStepValue(sender.tag)
    }
    
    @IBAction func quantityChanged(sender: UITextField) {
        updateStepValue(sender.tag)
    }
    
    func dismissNumpad(){
        view.endEditing(true)
    }
    
    func updateStepValue(senderID: Int){
        switch senderID{
        case 1:
            lowerLimitStepper.value = Double(Int(lowerLimitText.text!)!)
            break
        case 2:
            upperLimitStepper.value = Double(Int(upperLimitText.text!)!)
            break
        case 3:
            quantityStepper.value = Double(Int(quantityText.text!)!)
            break
        default:
            break
        }
    }
    
    func addNumber(r: Int){
        let newNumber = TurnListUser(userName: String(r))
        randomNumTableVC.addUser(newNumber)
    }
    
    @IBAction func generateNumbers(){
        let q = Int(quantityStepper.value)
        let lower = UInt32(lowerLimitStepper.value)
        let upper = UInt32(upperLimitStepper.value)
        
        var i = 0
        while i < q {
            let rNum = Int(lower) + Int(arc4random_uniform(upper-lower+1))
            addNumber(rNum)
            ++i
        }
    }
    
    @IBAction func clearRandNumTable(sender: UIButton) {
        randomNumTableVC.clearUsers()
    }
    
}
