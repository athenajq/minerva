//
//  ProfileViewController.swift
//  git practice
//
//  Created by athena on 8/30/20.
//  Copyright © 2020 Student. All rights reserved.
//

import UIKit
import Firebase

class ProfileViewController: UIViewController {

    @IBOutlet var username: UILabel!
    @IBOutlet var avatarImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let x = UserDefaults.standard.object( forKey: "avatarImageName") as? String {
            avatarImage.image = UIImage(systemName: x)
        }
        let db = Firestore.firestore()
       
        let email = Auth.auth().currentUser?.email
        db.collection("users").document("\(email ?? "")").getDocument { (docSnapshot, error) in
            if let error = error {
                print("error getting docs: \(error.localizedDescription)")
                return
            }
            let user = docSnapshot?.get("username")
            self.username.text = "\(user)"
        }
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
