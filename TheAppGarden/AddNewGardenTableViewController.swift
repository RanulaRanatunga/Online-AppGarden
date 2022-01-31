//
//  AddNewGardenTableViewController.swift
//  TheAppGarden
//
//  Created by Amal on 13/12/2019.
//  Copyright © 2019 Ranula Ranatunga. All rights reserved.
//

import UIKit
import Firebase
import AlamofireImage

class AddNewGardenTableViewController: UITableViewController {
    
    @IBOutlet weak var gardenName : UITextField!
    @IBOutlet weak var gardenDescription : UITextView!
    @IBOutlet weak var gardensaveButton :UIBarButtonItem!
    
    
    var Garden : GardenEntry?
    
    var db: Firestore!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if Garden != nil {
                   
                   self.gardenName.isEnabled = false
                   self.gardenDescription.isEditable = false
                   self.gardensaveButton.isEnabled = false
                   self.gardenName.text = Garden!.name
                   self.gardenDescription.text = Garden!.description
               }
       
    }
    
    
    @IBAction func didTapSave(sender:UIBarButtonItem) {
        
      //self.addGarden(name: self.gardenName.text!, entry: self.journalDetail.text!)
        
        self.addGarden(name: self.gardenName.text!, description: self.gardenDescription.text!)
        
        self.navigationController?.popViewController(animated: true)
    }
    
    
    func addGarden(name: String , description : String) {

        guard let userID = Auth.auth().currentUser?.uid else {return}
        db = Firestore.firestore()
        let GEntry = GardenEntry.init(description: name, name: description, image: userID)
        var ref: DocumentReference? = nil
        ref = self.db.collection("Gardens").addDocument(data: GEntry.dictionary, completion: { error in guard error == nil else {return}
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        })
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
      
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        return 2
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
