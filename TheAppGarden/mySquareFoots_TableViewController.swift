//
//  mySquareFoots_TableViewController.swift
//  TheAppGarden
//
//  Created by Ranula Ranatunga on 9/19/19.
//  Copyright © 2019 Ranula Ranatunga. All rights reserved.
//

import UIKit

class mySquareFoots_TableViewController: UITableViewController {
    
    var gardenName : NSArray = []
    var gardenBedID : NSArray = []
    var gardenSlotID : NSArray = []
    var gardenImageOne : NSArray = []
    var gardenImageTwo : NSArray = []
    var gardenImageThree : NSArray = []

    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet weak var notificationBell: UIBarButtonItem!
     
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sideMenus()
        
        gardenName = ["TTB Garden One" ,"TTB Garden Two" ,"TTB Garden Three" ,"TTB Garden Four"]
        gardenImageOne = [UIImage(named: "carrot")! , UIImage(named: "carrot")! , UIImage (named:"carrot")! , UIImage(named:"carrot")!]
        gardenImageTwo = [UIImage(named: "carrot")! , UIImage(named: "carrot")! , UIImage (named:"carrot")! , UIImage(named:"carrot")!]
        gardenImageThree = [UIImage(named: "carrot")! , UIImage(named: "carrot")! , UIImage (named:"carrot")! , UIImage(named:"carrot")!]
    
      
    }
    
    func sideMenus(){
        
        if revealViewController() != nil {
            
            menuButton.target = revealViewController()
            menuButton.action =  #selector(SWRevealViewController.revealToggle(_:))
            revealViewController().rearViewRevealWidth = 275
            revealViewController().rearViewRevealWidth = 300
            
            notificationBell.target = revealViewController()
            notificationBell.action = #selector(SWRevealViewController.rightRevealToggle(_:))
            
         view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())

        }
        
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        return gardenName.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "squarefoots_cell") as!squareFoots_TableViewCell

        cell.plantedImageOne.image = gardenImageOne[indexPath.row] as! UIImage
        cell.plantedImageTwo.image = gardenImageTwo[indexPath.row] as! UIImage
        cell.plantesImageThree.image = gardenImageThree[indexPath.row] as! UIImage
        cell.gardenName.text! = gardenName[indexPath.row]as! String
        cell.bedID.text! = gardenBedID[indexPath.row]as! String
        cell.slotID.text! = gardenSlotID[indexPath.row]as! String

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
