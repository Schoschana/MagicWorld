//
//  CatInsta.swift
//  TheMagicTheWorldTheYou
//
//  Created by Lili on 18/09/2019.
//  Copyright © 2019 Lily. All rights reserved.
//

import Foundation
import FirebaseDatabase

struct CatInsta {
    let key: String!
    let url: String!
    
    let itemRef: DatabaseReference?
    init( url: String, key: String) {
        self.key = key
        self.url = url
        self.itemRef = nil
        
    }
    init(snapshot: DataSnapshot)  {
        key = snapshot.key
        itemRef = snapshot.ref
        let snapshoValue = snapshot.value as? NSDictionary
        if let imageUrl = snapshoValue?["url"] as? String {
            url = imageUrl
        } else  {
            url = ""
            
        }
}
}
