//
//  termsandConditions_ViewController.swift
//  TheAppGarden
//
//  Created by Ranula Ranatunga on 9/19/19.
//  Copyright © 2019 Ranula Ranatunga. All rights reserved.
//

import UIKit

class termsandConditions_ViewController: UIViewController {
    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet weak var notificationButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        sideMenus()
    }
    
    func sideMenus(){
        
        if revealViewController() != nil {
            
            menuButton.target = revealViewController()
            menuButton.action =  #selector(SWRevealViewController.revealToggle(_:))
            revealViewController().rearViewRevealWidth = 275
            revealViewController().rearViewRevealWidth = 300
            
            notificationButton.target = revealViewController()
            notificationButton.action = #selector(SWRevealViewController.rightRevealToggle(_:))
            
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
