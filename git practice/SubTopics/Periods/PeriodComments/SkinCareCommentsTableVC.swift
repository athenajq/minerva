//
//  SkinCareCommentsTableVC.swift
//  git practice
//
//  Created by Elsa B on 4/20/20.
//  Copyright © 2020 Student. All rights reserved.
//

import UIKit
import FirebaseFirestore
import Firebase

class SkinCareTableVC: UITableViewController {

    var db: Firestore!
        
        var sweetArray = [Sweet]()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            db = Firebase.Firestore.firestore()
            loadData()
            checkForUpdates()
            
        }
        
               
           
           
        //Retreave data from Sweets collection
        func loadData() {
            db.collection("Sweet").getDocuments(){
                querySnapshot, error in
                if let error = error {
                    print("\(error.localizedDescription)")
                } else {
                    self.sweetArray = querySnapshot!.documents.flatMap({Sweet(dictionary: $0.data())})
                    DispatchQueue.main.async{
                        self.tableView.reloadData()
                    }
                }
            }
            
        }
        
        func checkForUpdates(){
            db.collection("Sweet").whereField("timeStamp", isGreaterThan: Date())
                .addSnapshotListener{
                    querySnapshot, error in
                    guard let snapshot = querySnapshot else{return}
                    
                    snapshot.documentChanges.forEach{
                        diff in
                        if diff.type == .added {
                            self.sweetArray.append(Sweet(dictionary: diff.document.data())!)
                            DispatchQueue.main.async{
                                self.tableView.reloadData()
                            }
                        }
                    }
            }
        }
      

       
  
    @IBAction func composePeriods(_ sender: Any) {
   if let x = UserDefaults.standard.object(forKey: "isInBrowseMode") as? Bool {
       if x == true {
        let signUpAlert = UIAlertController(title: "Please Signup", message: "You must sign up to add a new comment", preferredStyle: .alert)
        signUpAlert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(signUpAlert, animated: true, completion: nil)
       }else {
        let composeAlert = UIAlertController(title: "New Comment", message: "Enter the name and question", preferredStyle: .alert)
        
        composeAlert.addTextField { (textField:UITextField) in
            textField.placeholder = "The name or pseudonym"
        }
        
        composeAlert.addTextField { (textField:UITextField) in
            textField.placeholder = "Your question or comment"
        }
        
        composeAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        composeAlert.addAction(UIAlertAction(title: "Send", style: .default, handler: { (action:UIAlertAction) in
            
            // INTERESTING PART
            if let name = composeAlert.textFields?.first?.text,
                let content = composeAlert.textFields?.last?.text {
                
                let newSweet = Sweet(name: name, content: content, timeStamp: Date())
                var ref: DocumentReference? = nil
                ref =  self.db.collection("Sweet").addDocument(data: newSweet.dictionary){
                    error in
                    if let error = error {
                        print("Error adding document:\(error.localizedDescription)")
                    } else {
                        print("Document Added with ID:\(ref!.documentID)")
                    }
                }
            }
            
            
        }))
        
        self.present(composeAlert, animated: true, completion: nil)
        
       }
   }
            
            
        }
        


        // MARK: - Table view data source

        override func numberOfSections(in tableView: UITableView) -> Int {
            
            return 1
        }

        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            
            return sweetArray.count
        }

        
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

            let sweet = sweetArray[indexPath.row]
            cell.textLabel?.text = "\(sweet.name):\(sweet.content)"
            cell.detailTextLabel?.text = "\(sweet.timeStamp)"

            return cell
        }
         

}

