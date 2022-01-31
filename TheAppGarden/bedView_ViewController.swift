//
//  bedView_ViewController.swift
//  TheAppGarden
//
//  Created by Ranula Ranatunga on 9/27/19.
//  Copyright © 2019 Ranula Ranatunga. All rights reserved.
//

import UIKit

class bedView_ViewController: UIViewController , UICollectionViewDataSource ,UICollectionViewDelegate {
    
    @IBOutlet weak var bedViewCollection: UICollectionView!
    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet weak var notificationButton: UIBarButtonItem!
    
    
    //vegetable image array
    var vegetableArray =  [UIImage(named: "beetroot"), UIImage(named: "cabbage") , UIImage(named: "Mushroom") , UIImage(named: "beetroot") ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        sideMenus()

      let itemSize = UIScreen.main.bounds.width/3 - 3
        
      let layout = UICollectionViewFlowLayout()
      layout.sectionInset = UIEdgeInsets(top: 20,left: 0,bottom: 10,right: 0)
      layout.itemSize = CGSize(width: itemSize, height: itemSize)
        
      layout.minimumInteritemSpacing = 3
      layout.minimumLineSpacing = 3
        
      bedViewCollection.collectionViewLayout = layout
        
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
    

    // Number of views
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return vegetableArray.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "bedViewCellCollection", for: indexPath) as! bedView_CollectionViewCell
        
        //cell.bedImage.image = UIImage(named:vegetableArray [indexPath.row] + ".JPG")
        
        cell.bedImage.image = vegetableArray[indexPath.row]
        
        return cell
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
