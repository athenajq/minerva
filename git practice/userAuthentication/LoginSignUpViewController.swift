//
//  LoginSignUpViewController.swift
//  git practice
//
//  Created by athena on 8/30/20.
//  Copyright © 2020 Student. All rights reserved.
//

import UIKit

class LoginSignUpViewController: UIViewController {

    @IBOutlet var signUp: UIButton!
    @IBOutlet var login: UIButton!
    
    var isInBrowseMode = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Utilities.styleFilledButton(signUp)
        Utilities.styleHollowButton(login)
    }
    @IBAction func browseAsGuestClicked(_ sender: Any) {
        isInBrowseMode = true
        UserDefaults.standard.set(isInBrowseMode, forKey: "isInBrowseMode")
        transitionToHome()
    }
    
    @IBAction func loginClicked(_ sender: Any) {
        isInBrowseMode = false;        UserDefaults.standard.set(isInBrowseMode, forKey: "isInBrowseMode")
    }
    func transitionToHome() {
        //sets the view controller to the home vc
        let vc = storyboard!.instantiateViewController(identifier: "homeVC") as! WelcomeViewController
        view.window?.rootViewController = vc
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
