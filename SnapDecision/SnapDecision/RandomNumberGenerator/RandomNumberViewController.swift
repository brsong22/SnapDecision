//
//  RandomNumberViewController.swift
//  SnapDecision
//
//  Created by Richard Song on 1/11/16.
//  Copyright © 2016 brsong22. All rights reserved.
//

import UIKit

class RandomNumberViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var lowerLimitText: UITextField!
    @IBOutlet weak var lowerLimitStepper: UIStepper!
    
    @IBOutlet weak var upperLimitText: UITextField!
    @IBOutlet weak var upperLimitStepper: UIStepper!
    
    @IBOutlet weak var quantityText: UITextField!
    @IBOutlet weak var quantityStepper: UIStepper!
    
    
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
    
    @IBAction func lowerLimitAdjust(sender: UIStepper) {
        lowerLimitText.text = Int(sender.value).description
    }
    
    func dismissNumpad(){
        view.endEditing(true)
    }
    
    func updateStepValue(textFieldChanged: String){
        if textFieldChanged == "lowerLimit" {
            lowerLimitStepper.value = Double(Int(lowerLimitText.text!)!)
        }
    }
    
}
