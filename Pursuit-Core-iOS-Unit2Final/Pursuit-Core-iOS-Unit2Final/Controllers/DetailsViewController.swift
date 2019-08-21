//
//  DetailsViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Sunni Tang on 8/21/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    @IBOutlet weak var alphaLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var alphaStepper: UIStepper!
    
    var currentCrayon: Crayon?
    
    var currentRedValue: CGFloat = 1.0
    var currentGreenValue: CGFloat = 1.0
    var currentBlueValue: CGFloat = 1.0
    var currentAlpha: CGFloat = 1.0 //Change this? didset?
    let defaultAlpha = Crayon.defaultAlpha
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setInitialDetails()
    }
    
    
    func setInitialDetails() {

        if let currentCrayon = currentCrayon {
            
            currentRedValue = currentCrayon.convertCrayonValue(value: currentCrayon.red)
            currentGreenValue = currentCrayon.convertCrayonValue(value: currentCrayon.green)
            currentBlueValue = currentCrayon.convertCrayonValue(value: currentCrayon.blue)
            
            self.nameLabel?.text = currentCrayon.name
            redLabel?.text = "Red Value: \(currentRedValue)"
            greenLabel?.text = "Green Value: \(currentGreenValue)"
            blueLabel?.text = "Blue Value: \(currentBlueValue)"
            alphaLabel?.text = "Alpha Value: \(currentAlpha)"
            redSlider.value = Float(currentRedValue)
            greenSlider.value = Float(currentGreenValue)
            blueSlider.value = Float(currentBlueValue)
            
            self.view.backgroundColor = UIColor(red: currentRedValue, green: currentGreenValue, blue: currentBlueValue, alpha: currentAlpha)
        }
    }
    
    
    
    @IBAction func sliderChangeValue(_ sender: UISlider) {

        switch sender.tag {
            case 0:
                currentRedValue = CGFloat(sender.value)
                redLabel?.text = "Red Value: \(sender.value)"
                self.view.backgroundColor = UIColor(red: currentRedValue, green: currentGreenValue, blue: currentBlueValue, alpha: currentAlpha)
            case 1:
                currentGreenValue = CGFloat(sender.value)
                greenLabel?.text = "Green Value: \(sender.value)"
                self.view.backgroundColor = UIColor(red: currentRedValue, green: currentGreenValue, blue: currentBlueValue, alpha: currentAlpha)
            case 2:
                currentBlueValue = CGFloat(sender.value)
                blueLabel?.text = "Blue Value: \(sender.value)"
                self.view.backgroundColor = UIColor(red: currentRedValue, green: currentGreenValue, blue: currentBlueValue, alpha: currentAlpha)
            default:
                fatalError("No slider was used")
        }
    }
    
  
    @IBAction func stepperChangeValue(_ sender: UIStepper) {
        currentAlpha = CGFloat(sender.value)
            
        self.view.backgroundColor = UIColor(red: currentRedValue, green: currentGreenValue, blue: currentBlueValue, alpha: currentAlpha)
        alphaLabel?.text = "Alpha Value: \(currentAlpha)"
    }

}