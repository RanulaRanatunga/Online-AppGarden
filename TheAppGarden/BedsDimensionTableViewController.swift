//
//  BedsDimensionTableViewController.swift
//  TheAppGarden
//
//  Created by Amal on 19/12/2019.
//  Copyright © 2019 Ranula Ranatunga. All rights reserved.
//

import UIKit
import Firebase

class BedsDimensionTableViewController: UITableViewController , UITextFieldDelegate {

    @IBOutlet weak var addButton: UIBarButtonItem!
    
    var db:Firestore!
    
    var beds : [BedEntry] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        db = Firestore.firestore()
        
    }


    // number of tabel sections
    override func numberOfSections(in tableView: UITableView) -> Int {
      
        return 1
    }

    // tabel function
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return 0
    }

 
    // function get beds data
    func getBeds() {
        
        
        guard let userId = Auth.auth().currentUser?.uid else {
            
            return
        }
        
        print(userId)
        
        db.collection("Beds").addSnapshotListener { (snapshot, error ) in
            
            guard let documents = snapshot?.documents else {
                
                print("Error fetching documents.")
                
                return
                
            }
            
            
            print(documents[0].data())
            
            self.beds = documents.compactMap({ document in return BedEntry(dictionary: document.data()) })
                
         
            DispatchQueue.main.async {
                
                
                print("This is update table")
                print(self.beds.count)
                
               
                
            }
            
        }
        
        }
    
        
    }


