//
//  ViewController.swift
//  RGB-Sliders
//
//  Created by Joy Umali on 7/21/16.
//  Copyright © 2016 Joy Umali. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var colorSquare: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // want background color to be grey when app first opens. (0.5 of RGB = grey not white)
        updateBackgroundColor(view)
        
        // give the square view a one pixel black border
        colorSquare.layer.borderColor = UIColor.blackColor().CGColor
        colorSquare.layer.borderWidth = 1
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func updateBackgroundColor(sender: AnyObject) {
        let red = CGFloat(redSlider.value)
        let green = CGFloat(greenSlider.value)
        let blue = CGFloat(blueSlider.value)
        
        /* Code below is to update background color of entire screen.
        view.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1)
        */
        
        // Code for updating color of just the colorSquare instead of the screen.
        colorSquare.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1)
    }
    
    
}

