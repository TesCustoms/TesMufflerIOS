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
    
    // These work but not while in a tabbed view
    
    
    
    /*
     Horn slider
     *
     *
     */
    @IBOutlet weak var hornVolLabel: UILabel! //default to 50% b/c it sits in the middle
    @IBAction func hornSlider(_ sender: UISlider) {
        let hornValue = sender.value
        let roundedHorn = Int(hornValue*100)
        hornVolLabel.text = "\(roundedHorn)%"
        /* print(hornVolLabel.text)
         * print slider value to console for checking */
    }
    /*
     Acceleration Slider
     *
     *
     */
    @IBOutlet weak var AccVolLabel: UILabel!
    @IBAction func AccSlider(_ sender: UISlider) {
        let AccValue = sender.value
        let roundedAcc = Int(AccValue*100)
        AccVolLabel.text = "\(roundedAcc)%"
    }
    /*
     Idle Slider
     *
     *
     */
    @IBOutlet weak var idleVolLabel: UILabel!
    @IBAction func idleSlider(_ sender: UISlider) {
        let idleValue = sender.value
        let roundedIdle = Int(idleValue*100)
        idleVolLabel.text = "\(roundedIdle)%"
    }
    
    
    
}
