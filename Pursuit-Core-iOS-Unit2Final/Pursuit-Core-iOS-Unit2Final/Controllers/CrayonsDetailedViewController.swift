//
//  CrayonsDetailedViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Mariel Hoepelman on 8/21/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

//When the user selects a row, you should segue to a Detail View. The Detail view should have:
//A UILabel to show the name of the selected Crayon
//A background color that starts as the same color as the selected Crayon.
//A UISlider and UILabel that represents the current red value
//A UISlider and UILabel that represents the current green value
//A UISlider and UILabel that represents the current blue value
//A UIStepper and UILabel that represents the current alpha
//A reset UIButton that sets all the sliders and labels to be the corresponding colors of the Crayon the user selected and resets the alpha to 1.0.

import UIKit

class CrayonsDetailedViewController: UIViewController {
    
    var crayon: Crayon!
    
    @IBOutlet weak var selectedCrayonNameLabel: UILabel!
    @IBOutlet weak var currentRedValueLabel: UILabel!
    @IBOutlet weak var currentGreenValueLabel: UILabel!
    @IBOutlet weak var currentBlueValueLabel: UILabel!
    @IBOutlet weak var currentAlphaValueLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        switch sender.tag {
        case 0:
            crayon.red = Double(CGFloat(sender.value * 255))
            currentRedValueLabel.text = String("Current value of red: \(sender.value)")
            viewBackgroundColor()
        case 1:
            crayon.green = Double(CGFloat(sender.value * 255))
            currentGreenValueLabel.text = String("Current value of green: \(sender.value)")
            viewBackgroundColor()
        case 2:
            crayon.blue = Double(CGFloat(sender.value * 255))
            currentBlueValueLabel.text = String("Current value of blue: \(sender.value)")
            viewBackgroundColor()
        default:
            print("")
        }
    }
    
    @IBAction func stepperChanged(_ sender: UIStepper) {
        self.view.backgroundColor = UIColor(displayP3Red: CGFloat(crayon.red/255), green: CGFloat(crayon.green/255), blue: CGFloat(crayon.blue/255), alpha: CGFloat(sender.value))
        currentAlphaValueLabel.text = String("Current value of alpha: \(sender.value)")
    }
    
    func viewBackgroundColor() -> Void {
        self.view.backgroundColor = UIColor(displayP3Red: CGFloat(crayon.red/255), green: CGFloat(crayon.green/255), blue: CGFloat(crayon.blue/255), alpha: 1.0)
    }
 
    
    @IBAction func resetViewToOriginal(_ sender: UIButton) {
    }
    
    override func viewDidLoad() {
        viewBackgroundColor()
        selectedCrayonNameLabel.text = crayon.name
        currentRedValueLabel.text = String("Hex: \(crayon.red) RGB: \(crayon.red/255)")
        currentGreenValueLabel.text = String("Hex: \(crayon.green) RGB: \(crayon.green/255)")
        currentBlueValueLabel.text = ("Hex: \(crayon.blue) RGB: \(crayon.blue/255)")
        currentAlphaValueLabel.text = ""
    }

}
