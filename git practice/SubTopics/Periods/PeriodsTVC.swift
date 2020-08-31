//
//  PeriodsTVC.swift
//  git practice
//
//  Created by Elsa B on 4/23/20.
//  Copyright © 2020 Student. All rights reserved.
//

import UIKit

class PeriodsTVC: UITableViewController {
    
    @IBOutlet weak var TeenPerspectiveButton: UIButton!
    
    @IBOutlet weak var commonQuestionsButton: UIButton!
    
    @IBOutlet weak var moreResourcesButton: UIButton!
    
    // Link buttons
    
    @IBOutlet weak var tamponButton: UIButton!
    
    @IBOutlet weak var padButton: UIButton!
    
    @IBOutlet weak var menstrualButton: UIButton!
    
    //Outlet Collection for More Resources
    
    @IBOutlet var linkDropDown: [UIButton]!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpElements()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItemisInBrowseMode = true
    }

    // MARK: - Table view data source
    func setUpElements() {
                  
            Utilities.styleFilledButton(TeenPerspectiveButton)
            Utilities.styleFilledButton(commonQuestionsButton)
            Utilities.styleFilledButton(moreResourcesButton)
        Utilities.styleFilledButton(tamponButton)
        Utilities.styleFilledButton(padButton)
        Utilities.styleFilledButton(menstrualButton)

    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
    
   //Down Drop for More Resources
    @IBAction func moreResourcesTapped(_ sender: UIButton) {
        linkDropDown.forEach {(button) in
        UIView.animate(withDuration: 0.3, animations:{
             button.isHidden = !button.isHidden
            self.view.layoutIfNeeded()
        })
    }
}
 
    //Links Work
    
    
    @IBAction func tamponLink(_ sender: Any) {
        
         UIApplication.shared.open(URL(string: "https://www.youtube.com/watch?v=zTou-ckjvg4")! as URL, options: [:], completionHandler: nil)
    }
    
    
    @IBAction func padLink(_ sender: Any) {
        
         UIApplication.shared.open(URL(string: "https://www.youtube.com/watch?v=ZJad7a9Pu9k")! as URL, options: [:], completionHandler: nil)
    }
    
    
    @IBAction func menstrualLink(_ sender: Any) {
        
         UIApplication.shared.open(URL(string: "https://www.youtube.com/watch?v=o9fPUfm-uYE")! as URL, options: [:], completionHandler: nil)
    }
    
    
    @IBAction func menstrualCycleLink(_ sender: Any) {
        
          UIApplication.shared.open(URL(string: "https://www.betterhealth.vic.gov.au/health/conditionsandtreatments/menstrual-cycle")! as URL, options: [:], completionHandler: nil)
    }
    
    
    
    @IBAction func toxicShockSyndromeLink(_ sender: Any) {
        
          UIApplication.shared.open(URL(string: "https://www.mayoclinic.org/diseases-conditions/toxic-shock-syndrome/symptoms-causes/syc-20355384")! as URL, options: [:], completionHandler: nil)
    }
    
}
