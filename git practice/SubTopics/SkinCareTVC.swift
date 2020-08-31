//
//  SkinCareTVC.swift
//  git practice
//
//  Created by Elsa B on 4/27/20.
//  Copyright © 2020 Student. All rights reserved.
//

import UIKit

class SkinCareTVC: UITableViewController {
    
    //Button on Resource page
    
    
    @IBOutlet weak var teenPerspectiveButton: UIButton!
    
    @IBOutlet weak var commonQuestionsButton: UIButton!
    
    @IBOutlet weak var moreResourcesButton: UIButton!
    //Links
    
    @IBOutlet weak var linkOne: UIButton!
    
    @IBOutlet weak var linkTwo: UIButton!
    
    @IBOutlet weak var linkThree: UIButton!
    
    //Link collection
    
    @IBOutlet var linkSkinCare: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()

    }
    
    func setUpElements() {
                        
                  Utilities.styleFilledButton(teenPerspectiveButton)
                  Utilities.styleFilledButton(commonQuestionsButton)
                  Utilities.styleFilledButton(moreResourcesButton)
                  Utilities.styleFilledButton(linkOne)
                 // Utilities.styleFilledButton(linkTwo)
                //  Utilities.styleFilledButton(linkThree)

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

    
    @IBAction func moreResourceTapped(_ sender: Any) {
        linkSkinCare.forEach {(button) in
        UIView.animate(withDuration: 0.3, animations:{
             button.isHidden = !button.isHidden
            self.view.layoutIfNeeded()
        })
    }
}
    
    
    @IBAction func skinCareSecertsLink(_ sender: Any) {
         UIApplication.shared.open(URL(string: "https://www.aad.org/public/everyday-care/skin-care-secrets")! as URL, options: [:], completionHandler: nil)
        
        
    }
    
}
