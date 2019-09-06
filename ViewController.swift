//
//  ViewController.swift
//  TheMagicTheWorldTheYou
//
//  Created by Lili on 03/09/2019.
//  Copyright © 2019 Lily. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var UISegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var label: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
     //  label.isHidden = true
        label.font = label.font.withSize(35)
        label.textAlignment = .center
        label.numberOfLines = 2
        
        UISegmentedControl.insertSegment(withTitle: "сроки выполнения", at: 2, animated: true)
    }

    @IBAction func choiceSegment(_ sender: UISegmentedControl) {
        label.isHidden = false
        switch UISegmentedControl.selectedSegmentIndex {
        case 0:
            label.text = "мы рады видеть вас в нашем мире сказки ! "
            label.textColor = .red
        case 1:
            label.text = "hi дорогой друг это мы "
            label.textColor = .blue
        case 2:
            label.text = "это мы "
            label.textColor = .yellow
        default:
            print("Sothing wrong!")
        }
        
        
        
        
    }
    
}

