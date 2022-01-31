//
//  BedsDetail_TableViewController.swift
//  TheAppGarden
//
//  Created by Ranula Ranatunga on 09/01/2020.
//  Copyright © 2020 Ranula Ranatunga. All rights reserved.
//

import UIKit
import Firebase
import AlamofireImage

class BedsDetail_TableViewController: UITableViewController {
    
    @IBOutlet weak var addButton: UIBarButtonItem!
    
    var db: Firestore!
    
    var bedsize : [BedSizeEntry] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        db = Firestore.firestore()
        
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
      
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return bedsize.count
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        
        getBeds()
        
    }

    
    func getBeds() {
        
        print("***************Testitng**********")
        
    
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

            self.bedsize = documents.compactMap({ document in return BedSizeEntry(dictionary:document.data())

            })

            //data
            DispatchQueue.main.async {

                print("This is update table")
                print (self.bedsize.count)

                self.tableView.reloadData()
            }

        }
        
    }
    
  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "addnewBeds") as! BedsTableViewCell
     
        var Beds = bedsize[indexPath.row]
        
        cell.bedNameTextField.text = Beds.bedname
        cell.xField.text = Beds.xField
        cell.yField.text = Beds.yField
        cell.locationTextField.text = Beds.location

        return cell
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
