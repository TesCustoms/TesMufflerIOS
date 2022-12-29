//
//  ViewController.swift
//  TesMuffler
//
//  Created by Alex Fife on 11/8/22.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBOutlet weak var profilePic: UIImageView!
    
    self.profilePic.layer.cornerRadius = self.profilePic.frame.size.width / 2;
    self.profilePic.layer.borderWidth: 3.0f;
    self.profilePic.layer.borderColor: [UIColor __blackColor].GCColor;
    //comment out the above to get it to build into ios sim without issue
    
    //supposedly rounds the profilePic and adds a mid width black border around it. 3.0f = circle and 10.0f = rounded square
}

