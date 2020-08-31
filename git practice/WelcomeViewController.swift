//
//  WelcomeViewController.swift
//  git practice
//
//  Created by Student on 4/17/20.
//  Copyright © 2020 Student. All rights reserved.
//

import UIKit
class WelcomeViewController: UIViewController {
    
    
   
    @IBOutlet weak var imgForGif: UIImageView!
    
    

       override func viewDidLoad() {

           super.viewDidLoad()

           // Do any additional setup after loading the view.

           imgForGif.loadGif(name: "LSbackground")

           imgForGif.frame = CGRect(x: 32.0, y: 0.0, width: 350.0, height: 850.0)
       }


}
