//
//  Utilities.swift
//  git practice
//
//  Created by Elsa B on 4/20/20.
//  Copyright © 2020 Student. All rights reserved.
//
import Foundation
import UIKit

class Utilities {
    
    static func styleTextField(_ textfield:UITextField) {
        
        // Create the bottom line
        let bottomLine = CALayer()
        
        bottomLine.frame = CGRect(x: 0, y: textfield.frame.height - 2, width: textfield.frame.width, height: 2)
      
        bottomLine.frame = CGRect(x: 0, y: textfield.frame.height - 2, width: textfield.frame.width, height: 2)

       // bottomLine.backgroundColor = UIColor.init(red: 5/255, green: 84/255, blue: 5/255, alpha: 1).cgColor
        bottomLine.backgroundColor = UIColor.init(red: 255/255, green: 185/255, blue: 142/255, alpha: 1).cgColor
        
        // Remove border on text field
        textfield.borderStyle = .none
        
        // Add the line to the text field
        textfield.layer.addSublayer(bottomLine)
        
        //Yellow color
        //UIColor.init(red: 225/255, green: 194/255, blue: 62/255, alpha: 1).cgColor
        
        //Pink color
        //UIColor.init(red: 255/255, green: 177/255, blue: 198/255, alpha: 1).cgColor
        
        //Pink-Yellow
        //UIColor.init(red: 255/255, green: 185/255, blue: 142/255, alpha: 1).cgColor
        
        //DarkGreen
        //UIColor.init(red: 5/255, green: 84/255, blue: 5/255, alpha: 1).cgColor
        
        //LightGreen
        //UIColor.init(red: 67/255, green: 166/255, blue: 67/255, alpha: 1).cgColor
        
    }
    
    static func styleFilledButton(_ button:UIButton) {
        
        // Filled rounded corner style
       // button.backgroundColor = UIColor.white
        button.layer.cornerRadius = 25.0
        //button.tintColor = UIColor.white
        button.backgroundColor = UIColor.init(red: 255/255, green: 177/255, blue: 198/255, alpha: 1)

    }
    

    
    static func styleHollowButton(_ button:UIButton) {
        
        // Hollow rounded corner style
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.init(red: 255/255, green: 177/255, blue: 198/255, alpha: 1).cgColor
        button.layer.cornerRadius = 25.0
        button.tintColor = UIColor.black
    }
  
    //Hallow look for labels (not Buttons)
    /* static func styleHollowLabel(_ label:UILabel) {
        
        // Hollow rounded corner style
        label.layer.borderWidth = 2
        label.layer.borderColor = UIColor.init(red: 255/255, green: 177/255, blue: 198/255, alpha: 1).cgColor
        label.layer.cornerRadius = 25.0
        label.tintColor = UIColor.black
    }*/

    static func isPasswordValid(_ password : String) -> Bool {
        
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        //has to contain 8 characters, a capital and lowercase letter, and a special character
        return passwordTest.evaluate(with: password)
    }
}

