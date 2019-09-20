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
import FirebaseStorage
import SDWebImage


class ColViewController: UIViewController, UICollectionViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var loginButton: UIBarButtonItem!
   @IBOutlet weak var logoutButton: UIBarButtonItem!
    @IBOutlet weak var loginInfoLabel: UILabel!
    @IBOutlet weak var imageCollection: UICollectionView!
    var customImageFlowLayout : CustomImageFlowLayout!
    var images = [CatInsta]()
    
    var dbRef: DatabaseReference!
    let imagePicker = UIImagePickerController()

    override func viewDidLoad() {
        super.viewDidLoad()

        dbRef = Database.database().reference().child("images")
        loadDB()
        customImageFlowLayout = CustomImageFlowLayout()
        imageCollection.collectionViewLayout = customImageFlowLayout
        imageCollection.backgroundColor = .white
    }
      func loadDB() {
        dbRef.observe(DataEventType.value, with: { (snapshot) in
            var newImages = [CatInsta]()
            for catInstaSnapshot in snapshot.children {
                let catInstaObject = CatInsta(snapshot: catInstaSnapshot as! DataSnapshot)
                newImages.append(catInstaObject)
            }
            self.images = newImages
            self.imageCollection.reloadData()
        })
  
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
        cell.imageView.sd_setImage(with:URL(string: image.url), placeholderImage: UIImage(named: "image1"))
        return cell
    }
   
            
            
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
    dismiss(animated: true, completion: nil)
    
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage{
            // Data in memory
            var data = Data()
            data = UIImageJPEGRepresentation(pickedImage, 0.8)!
            let imageRef = Storage.storage().reference().child("images/" + randomString(20));
            _ = imageRef.putData(data, metadata: nil) {
                (metadata, error) in
                guard let metadata = metadata else {
                    return
                }
                let downloadURL = metadata.downloadURL()
                print(downloadURL?.absoluteString ?? "")
                //let childUpdates = ["/\(key)": images]
                //self.dbRef.updateChildValues(childUpdates)
                let key = self.dbRef.childByAutoId().key
                let image = ["url": downloadURL?.absoluteString]
                let childUpdates = ["/posts/\(key)": image]
                self.dbRef.updateChildValues(childUpdates)
            }
          }
     }
           @IBAction func loadImageButtonClicked(_ sender: Any) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        
        present(imagePicker, animated: true, completion: nil)
    }
    func randomString(_ length: Int) -> String {
        let letters : NSString = "bhhbhbhbhbhbb0090"
        let len = UInt32(letters.length)
        var randomstring = ""
        
        for _ in 0 ..< length {
            let rand = arc4random_uniform(len)
            var nextChar = letters.character(at: Int(rand))
            randomstring += NSString(characters: &nextChar, length: 1) as String
            
            
        }
        return randomstring
    }
    
}
