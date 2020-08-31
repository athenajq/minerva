//
//  DDHomeVC.swift
//  git practice
//
//  Created by Elsa B on 4/23/20.
//  Copyright © 2020 Student. All rights reserved.
//

import UIKit

class DDHomeVC: UIViewController {
    
    
    @IBOutlet weak var TableView: UITableView!
    
    //Individual Button names
    
    @IBOutlet weak var hygieneButton: UIButton!
    @IBOutlet weak var hairCareButton: UIButton!
    @IBOutlet weak var shavingButton: UIButton!
    @IBOutlet weak var skinCareButton: UIButton!
    @IBOutlet weak var periodsButton: UIButton!
    @IBOutlet weak var bodyImageButton: UIButton!
    @IBOutlet weak var sexualityButton: UIButton!
    @IBOutlet weak var masturbationButton: UIButton!
    @IBOutlet weak var contraceptionButton: UIButton!
    @IBOutlet weak var consentButton: UIButton!
    @IBOutlet weak var LGBTQButton: UIButton!
    @IBOutlet weak var mentalHealthButton: UIButton!
    @IBOutlet weak var PhysicalHealthButton: UIButton!
    @IBOutlet weak var RelationshipsButton: UIButton!
    
    //Button Collections
    
    @IBOutlet var HygieneSubTopics: [UIButton]!
    @IBOutlet var SexualitySubTopics: [UIButton]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()

        // Do any additional setup after loading the view.
        if let x = UserDefaults.standard.object(forKey: "isInBrowseMode") as? Bool {
            if x == true {
                self.tabBarController?.tabBar.isHidden = true
            }else {
                self.tabBarController?.tabBar.isHidden = false
            }
        }
    }
    
     func setUpElements() {
                  
            Utilities.styleFilledButton(hygieneButton)
            Utilities.styleFilledButton(hairCareButton)
            Utilities.styleFilledButton(shavingButton)
            Utilities.styleFilledButton(skinCareButton)
            Utilities.styleFilledButton(periodsButton)
            Utilities.styleFilledButton(bodyImageButton)
            Utilities.styleFilledButton(sexualityButton)
            Utilities.styleFilledButton(masturbationButton)
            Utilities.styleFilledButton(contraceptionButton)
            Utilities.styleFilledButton(consentButton)
            Utilities.styleFilledButton(LGBTQButton)
            Utilities.styleFilledButton(mentalHealthButton)
            Utilities.styleFilledButton(PhysicalHealthButton)
            Utilities.styleFilledButton(RelationshipsButton)

    }
  
    @IBAction func HygieneTapped(_ sender: UIButton) {
        
        HygieneSubTopics.forEach {(button) in
            UIView.animate(withDuration: 0.3, animations:{
                 button.isHidden = !button.isHidden
                self.view.layoutIfNeeded()
            })
        }
    }
    
    
    
    @IBAction func SexualityTapped(_ sender: UIButton) {
        
       SexualitySubTopics.forEach {(button) in
                   UIView.animate(withDuration: 0.3, animations:{
                        button.isHidden = !button.isHidden
                       self.view.layoutIfNeeded()
                   })
               }
        
    }
    
    
    @IBAction func unwindToMenu(segue:UIStoryboardSegue){
    
    }
    

}
