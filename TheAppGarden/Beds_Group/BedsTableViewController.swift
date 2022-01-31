//
//  BedsTableViewController.swift
//  TheAppGarden
//
//  Created by Amal on 23/12/2019.
//  Copyright © 2019 Ranula Ranatunga. All rights reserved.
//

import UIKit
import Firebase
import AlamofireImage

class BedsTableViewController: UITableViewController , UITextFieldDelegate {
    
    @IBOutlet var tbView: UITableView!
    @IBOutlet weak var bedAddButton: UIBarButtonItem!
    
//    var BedName :String = ""
//    var BedDescription : String = ""
    
    var db: Firestore!
    
    var bedSize: [BedSizeEntry] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tbView.delegate = self
        tbView.dataSource = self

        db = Firestore.firestore()
        
        getBeds()
    
        
    }
    
    
    func navigateToNextViewController() {
        
        self.performSegue(withIdentifier: "addBed", sender: self)
    }
    
    
    func getBeds(){
        
        print("***************Testitng********")
    
        
        guard let userId = Auth.auth().currentUser?.uid else {

            print("****EXECUTING*****")

            return
        }

        print("userId \(userId)")
        
        db.collection("beds").addSnapshotListener {(snapshot ,error) in

            guard let documents = snapshot?.documents else {

                print("Error fetching documents.")

                return
            }

            print(documents[0].data())

            self.bedSize = documents.compactMap({ document in return BedSizeEntry(dictionary:document.data())

            })

            //data
            DispatchQueue.main.async {

                print("This is update table")
                print (self.bedSize.count)

                self.tableView.reloadData()
            }

        }
        
    }
    
   // number of cell of 
    override func numberOfSections(in tableView: UITableView) -> Int {
       
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        
        return bedSize.count
    }

  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "addnewBeds")as! BedsTableViewCell
        
        var newBeds = bedSize[indexPath.row]
        
        cell.bedNameTextField.text = newBeds.bedname
        cell.xField.text = newBeds.xField
        cell.yField.text = newBeds.yField
        cell.locationTextField.text = newBeds.location
        
        return cell
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
//        getBeds()
    }


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
