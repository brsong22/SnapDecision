//
//  ViewController.swift
//  SnapDecision
//
//  Created by Richard Song on 12/26/15.
//  Copyright © 2015 brsong22. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationController!.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "Noteworthy-Bold", size: 20)!]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let backButton = UIBarButtonItem()
        backButton.title = "O Snap!"
        backButton.style = UIBarButtonItemStyle.Plain
        backButton.setTitleTextAttributes([NSFontAttributeName: UIFont(name: "Noteworthy", size: 20)!], forState: UIControlState.Normal)
        navigationItem.backBarButtonItem = backButton
    }

}

