//
//  HairCareTVC.swift
//  git practice
//
//  Created by Elsa B on 4/27/20.
//  Copyright © 2020 Student. All rights reserved.
//

import UIKit

class HairCareTVC: UITableViewController {

    
    //Resource Buttons
    
    @IBOutlet weak var teenPerspectiveButton: UIButton!
    
    @IBOutlet weak var commonQuestionsButton: UIButton!
    
    @IBOutlet weak var moreResourcesButton: UIButton!
    //links
    
    @IBOutlet weak var linkOne: UIButton!
    
    @IBOutlet weak var linkTwo: UIButton!
    
    @IBOutlet weak var LinkThree: UIButton!
      
    @IBOutlet weak var linkFour: UIButton!
    
    //LinkCollection
    
    @IBOutlet var linkHairCare: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()

        
    }
    
    func setUpElements() {
                  
            Utilities.styleFilledButton(teenPerspectiveButton)
            Utilities.styleFilledButton(commonQuestionsButton)
            Utilities.styleFilledButton(moreResourcesButton)
                Utilities.styleFilledButton(linkOne)
                Utilities.styleFilledButton(linkTwo)
               Utilities.styleFilledButton(LinkThree)
                Utilities.styleFilledButton(linkFour)

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
    
    //MoreResouceTapped

    @IBAction func moreResourceTapped(_ sender: Any) {
        linkHairCare.forEach {(button) in
        UIView.animate(withDuration: 0.3, animations:{
             button.isHidden = !button.isHidden
            self.view.layoutIfNeeded()
        })
    }
        
        
        
}
    @IBAction func LinkOne(_ sender: Any) {
        UIApplication.shared.open(URL(string: "https://www.medicalnewstoday.com/articles/319848#oily-or-dry")! as URL, options: [:], completionHandler: nil)
    }
    
    
    @IBAction func linkTwo(_ sender: Any) {
        UIApplication.shared.open(URL(string: "https://www.mayoclinic.org/diseases-conditions/dandruff/diagnosis-treatment/drc-20353854")! as URL, options: [:], completionHandler: nil)
    }
    
    @IBAction func DamageHairLink(_ sender: Any) {
        UIApplication.shared.open(URL(string: "https://www.whowhatwear.com/what-causes-hair-damage")! as URL, options: [:], completionHandler: nil)
    }
    
    
    @IBAction func heatstylingLink(_ sender: Any) {
      UIApplication.shared.open(URL(string: "https://www.byrdie.com/how-often-can-i-flat-iron-black-hair-400446")! as URL, options: [:], completionHandler: nil)
        
    }
    
}
