//
//  ShavingTVC.swift
//  git practice
//
//  Created by Elsa B on 4/25/20.
//  Copyright © 2020 Student. All rights reserved.
//

import UIKit

class ShavingTVC: UITableViewController {
    
 //calling buttons
    @IBOutlet weak var TeenShaving: UIButton!
    @IBOutlet weak var commonQuestionShaving: UIButton!
    @IBOutlet weak var moreResourcesShaving: UIButton!
    @IBOutlet weak var linkOne: UIButton!
    @IBOutlet weak var linkTwo: UIButton!
    @IBOutlet weak var linkThree: UIButton!
    
    
    
    @IBOutlet var shavinglinks: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()

    }
    
    func setUpElements() {
                     
               Utilities.styleFilledButton(TeenShaving)
               Utilities.styleFilledButton(commonQuestionShaving)
               Utilities.styleFilledButton(moreResourcesShaving)
               Utilities.styleFilledButton(linkOne)
               Utilities.styleFilledButton(linkTwo)
               Utilities.styleFilledButton(linkThree)

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
        
        shavinglinks.forEach {(button) in
               UIView.animate(withDuration: 0.3, animations:{
                    button.isHidden = !button.isHidden
                   self.view.layoutIfNeeded()
               })
        
        }
    }
    
    
    @IBAction func shavingMythsDebunkedLink(_ sender: Any) {
        UIApplication.shared.open(URL(string: "https://www.gillettevenus.com/en-us/womens-shaving-guide/facts-and-myths/shaving-myths-debunked/")! as URL, options: [:], completionHandler: nil)
    }
    
    
    @IBAction func ShavingPubicHair(_ sender: Any) {
        UIApplication.shared.open(URL(string: "https://www.byrdie.com/how-to-shave-your-pubic-hair-area-for-women-1717028")! as URL, options: [:], completionHandler: nil)
    }
    
    
    @IBAction func ToShaveOrNotToShaveLink(_ sender: Any) {
        UIApplication.shared.open(URL(string: "https://www.vogue.com/article/body-hair-new-generation-not-shaving")! as URL, options: [:], completionHandler: nil)
    }
    
}
