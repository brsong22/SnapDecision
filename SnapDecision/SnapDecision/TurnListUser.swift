//
//  TurnListUser.swift
//  SnapDecision
//
//  Created by Richard Song on 12/28/15.
//  Copyright © 2015 brsong22. All rights reserved.
//

import UIKit

class TurnListUser {
    var name: String
    
    init(userName: String){
        self.name = userName
    }
    
    func setName(userName: String){
        self.name = userName
    }
    
    func getName()->String{
        return self.name
    }
}