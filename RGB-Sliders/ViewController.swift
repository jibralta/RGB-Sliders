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
        
        // Loading from NSUserDefault - Extracts the numeric value of the colors and applies them to the sliders. Make sure to place this bit before updateBackgroundColor.
        let defaults = NSUserDefaults.standardUserDefaults()
        redSlider.value = defaults.floatForKey("red")
        greenSlider.value = defaults.floatForKey("green")
        blueSlider.value = defaults.floatForKey("blue")
        // no need to synchronize because not storing.  Only extracting data.
        
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
        
        // This line below stores a reference to the shared defaults object
        let defaults = NSUserDefaults.standardUserDefaults()
        
        // Saving to NSUserDefault - The three slider values are then stored within the shared defaults object
        defaults.setFloat(redSlider.value, forKey: "red")
        defaults.setFloat(greenSlider.value, forKey: "green")
        defaults.setFloat(blueSlider.value, forKey: "blue")
        defaults.synchronize()
    }
    
    // points the segue to the destination and tells the new screen what color.  Same color as square from first screen.
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "openColor") {
            let newViewController = segue.destinationViewController
            newViewController.view.backgroundColor = colorSquare.backgroundColor
        }
        
    }
    
    
}

