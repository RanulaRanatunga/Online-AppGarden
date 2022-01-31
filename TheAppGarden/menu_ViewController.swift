//
//  menu_ViewController.swift
//  TheAppGarden
//
//  Created by Amal on 10/12/2019.
//  Copyright © 2019 Ranula Ranatunga. All rights reserved.
//

import UIKit



class menu_ViewController: UIViewController {

    @IBOutlet weak var menu_button: UIBarButtonItem!
    @IBOutlet weak var notification_button: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       sideMenus()
    }
    
    
       func sideMenus(){
           
           if revealViewController() != nil {
               
               menu_button.target = revealViewController()
               menu_button.action =  #selector(SWRevealViewController.revealToggle(_:))
               revealViewController().rearViewRevealWidth = 275
               revealViewController().rearViewRevealWidth = 300
               
               notification_button.target = revealViewController()
              notification_button.action = #selector(SWRevealViewController.rightRevealToggle(_:))
               
               view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
               
            
           }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
