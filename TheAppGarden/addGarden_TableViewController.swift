//
//  addGarden_TableViewController.swift
//  TheAppGarden
//
//  Created by Ranula Ranatunga on 9/19/19.
//  Copyright © 2019 Ranula Ranatunga. All rights reserved.
//

import UIKit
import Firebase
import AlamofireImage

class addGarden_TableViewController: UITableViewController , UITextFieldDelegate {

    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet weak var addButton: UIBarButtonItem!
    
    
    var db: Firestore!
    
    var gardens: [GardenEntry] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        sideMenus()
        
        db = Firestore.firestore()
        
    }
    
    
    func navigateToNextViewController() {
        self.performSegue(withIdentifier: "NewGarden", sender: self)
    }
    
    
    func sideMenus(){
        
        if revealViewController() != nil {
            
            menuButton.target = revealViewController()
            menuButton.action =  #selector(SWRevealViewController.revealToggle(_:))
            revealViewController().rearViewRevealWidth = 275
            revealViewController().rearViewRevealWidth = 300
            
            //addButton.target = revealViewController()
            //addButton.action = #selector(SWRevealViewController.rightRevealToggle(_:))
            
           view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            
        }
        
    }
    
    func getGardens() {

        
        guard let userId = Auth.auth().currentUser?.uid else {
            
            return
        }
        
        print(userId)
        
        db.collection("Gardens").addSnapshotListener { (snapshot, error ) in
            
            guard let documents = snapshot?.documents else {
                
                print("Error fetching documents.")
                
                return
            }
            
            print(documents[0].data())
            
            self.gardens = documents.compactMap({ document in return GardenEntry(dictionary:document.data())
            })
            
            // DATA
            DispatchQueue.main.async {
                
                print("This is update Table")
                print(self.gardens.count)
                
                self.tableView.reloadData()
               
            }
            
        }
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
       return gardens.count
        
    }
    
  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "addGarden") as! AddGraden_TableViewCell
        
        var gardenary = gardens[indexPath.row]
        
        cell.gardenName.text = gardenary.name
        cell.gardenDescription.text = gardenary.description

        if let imageURL = URL(string: gardenary.image) {
                               
            cell.gardenImage.af_setImage(withURL: imageURL)

        }
        
        return cell
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        
        getGardens()
        
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


