//
//  ColViewController.swift
//  TheMagicTheWorldTheYou
//
//  Created by Lili on 15/09/2019.
//  Copyright © 2019 Lily. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class ColViewController: UIViewController, UICollectionViewDataSource {
    
    @IBOutlet weak var loginButton: UIBarButtonItem!
   @IBOutlet weak var logoutButton: UIBarButtonItem!
    @IBOutlet weak var loginInfoLabel: UILabel!
    @IBOutlet weak var imageCollection: UICollectionView!
    var customImageFlowLayout : CustomImageFlowLayout!
    var images = [CatInsta]()
    
    var dbRef: DatabaseReference!

    override func viewDidLoad() {
        super.viewDidLoad()

        dbRef = Database.database().reference().child("images")
        loadDB()
        customImageFlowLayout = CustomImageFlowLayout()
        imageCollection.collectionViewLayout = customImageFlowLayout
        imageCollection.backgroundColor = .white
    }
      func loadDB() {
        dbRef.observe(DataEventType.value) { (snapshot) in
            var newimages = [CatInsta]()
            
        }

            self.imageCollection.reloadData()
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func viewWillAppear(_ animated: Bool) {
        if Auth.auth().currentUser != nil {
            self.loginButton.isEnabled = false
            self.logoutButton.isEnabled = true
            self.loginInfoLabel.text = "Hello"  + (Auth.auth().currentUser?.email)!
        } else  {
            self.loginButton.isEnabled = true
            self.logoutButton.isEnabled = false
            self.loginInfoLabel.text = "Hello please login"
          }
        
        }
    
    @IBAction func logoutButtonClicked(_ sender: Any) {
        if Auth.auth().currentUser != nil {
            do {
                try Auth.auth().signOut()
                self.loginButton.isEnabled = true
                self.logoutButton.isEnabled = false
                self.loginInfoLabel.text = "Hello please login"
                
            } catch let signOutError as NSError  {
                print("Error singing out: %@, singOutError")
        }
    }
    
    }
    func collectionView(_ imageCollection: UICollectionView, numberOfItemsInSection section : Int) -> Int  {
        
    return images.count
         }
    func collectionView(_ imageCollection: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell  {
     let cell = imageCollection.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! ImageCollectionViewCell
        let image = images[indexPath.row]
        cell.imageView.image = image;
        return cell
    }
    
}
