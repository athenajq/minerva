//
//  SkinCareReplyTVC.swift
//  git practice
//
//  Created by Elsa B on 4/22/20.
//  Copyright © 2020 Student. All rights reserved.
//

import UIKit
import Firebase

class SkinCareReplyTVC: UITableViewController {

      var db:Firestore!
            
            var relpyArray = [Reply]()
            
            override func viewDidLoad() {
                super.viewDidLoad()
                
                db = Firestore.firestore()
                loadData()
                checkForUpdates()
                
            }
            
                   
               
               
            //Retreave data from Sweets collection
            func loadData() {
                db.collection("Reply").getDocuments(){
                    querySnapshot, error in
                    if let error = error {
                        print("\(error.localizedDescription)")
                    } else {
                        self.relpyArray = querySnapshot!.documents.flatMap({Reply(dictionary: $0.data())})
                        DispatchQueue.main.async{
                            self.tableView.reloadData()
                        }
                    }
                }
                
            }
            
            func checkForUpdates(){
                db.collection("Reply").whereField("timeStamp", isGreaterThan: Date())
                    .addSnapshotListener{
                        querySnapshot, error in
                        guard let snapshot = querySnapshot else{return}
                        
                        snapshot.documentChanges.forEach{
                            diff in
                            if diff.type == .added {
                                self.relpyArray.append(Reply(dictionary: diff.document.data())!)
                                DispatchQueue.main.async{
                                    self.tableView.reloadData()
                                }
                            }
                        }
                }
            }
          

           
    @IBAction func ReplyCompose(_ sender: Any) {

                let composeAlert = UIAlertController(title: "New Reply", message: "Enter your Name and your Reply", preferredStyle: .alert)
                
                composeAlert.addTextField { (textField:UITextField) in
                    textField.placeholder = "Your Name"
                }
                
                composeAlert.addTextField { (textField:UITextField) in
                    textField.placeholder = "Your Reply"
                }
                
                composeAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
                
                composeAlert.addAction(UIAlertAction(title: "Send", style: .default, handler: { (action:UIAlertAction) in
                    
                    // INTERESTING PART
                    if let name = composeAlert.textFields?.first?.text,
                        let content = composeAlert.textFields?.last?.text {
                        
                        let newReply = Reply(name: name, content: content, timeStamp: Date())
                        
                        var ref: DocumentReference? = nil
                        ref =  self.db.collection("Reply").addDocument(data: newReply.dictionary){
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
            


            // MARK: - Table view data source

            override func numberOfSections(in tableView: UITableView) -> Int {
                
                return 1
            }

            override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                
                return relpyArray.count
            }

            
            override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                let ReplyCell = tableView.dequeueReusableCell(withIdentifier: "ReplyCell", for: indexPath)

                let reply = relpyArray[indexPath.row]
                ReplyCell.textLabel?.text = "\(reply.name):\(reply.content)"
                ReplyCell.detailTextLabel?.text = "\(reply.timeStamp)"

                return ReplyCell
            }
             

    }

