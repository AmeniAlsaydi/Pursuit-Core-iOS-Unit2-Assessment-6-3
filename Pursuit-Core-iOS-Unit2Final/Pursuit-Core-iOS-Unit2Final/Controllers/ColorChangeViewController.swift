//
//  ColorChangeViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Sam Roman on 8/21/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class ColorChangeViewController: UIViewController {

//    var colorFromVC: Crayon!
    
    var red: Double!
    var green: Double!
    var blue: Double!
    var currentColorName: String!
    
    @IBOutlet var viewOut: UIView!
    
    //MARK: - Label Outlets
    @IBOutlet weak var redLabelOut: UILabel!
    @IBOutlet weak var greenLabelOut: UILabel!
    @IBOutlet weak var blueLabelOut: UILabel!
    
    @IBOutlet weak var alphaLabel: UILabel!
    
    @IBOutlet weak var colorNameLabel: UILabel!
    
    
    //MARK: - Actions
    
    @IBAction func resetButton(_ sender: UIButton) {
    redLabelOut.text = "Red: \(Float(red))"
    greenLabelOut.text = "Green: \(Float(green))"
    blueLabelOut.text = "Blue: \(Float(blue))"
    alphaLabel.text = "Alpha: 1.0"
    viewOut.backgroundColor = UIColor(displayP3Red: CGFloat(red), green:  CGFloat(green), blue:  CGFloat(blue), alpha: 1.0)
    redSliderOut.value = Float(red)
    greenSliderOut.value = Float(green)
    blueSliderOut.value = Float(blue)
    }
    
    @IBAction func redSliderAct(_ sender: UISlider) {
        redLabelOut.text = "Red: \(Float(sender.value))"
   viewOut.backgroundColor = UIColor(displayP3Red: CGFloat(sender.value), green:  CGFloat(greenSliderOut.value), blue:  CGFloat(blueSliderOut.value), alpha: CGFloat(stepperOut.value))
    }
    @IBAction func greenSliderAct(_ sender: UISlider) {
        greenLabelOut.text = "Green: \(Float(sender.value))"
    viewOut.backgroundColor = UIColor(displayP3Red: CGFloat(sender.value), green:  CGFloat(greenSliderOut.value), blue:  CGFloat(blueSliderOut.value), alpha: CGFloat(stepperOut.value))

    }
    @IBAction func blueSliderAct(_ sender: UISlider) {
        blueLabelOut.text = "Blue: \(Float(sender.value))"
    viewOut.backgroundColor = UIColor(displayP3Red: CGFloat(sender.value), green:  CGFloat(greenSliderOut.value), blue:  CGFloat(blueSliderOut.value), alpha: CGFloat(stepperOut.value))
    }
    @IBAction func stepperAct(_ sender: UIStepper) {
        alphaLabel.text = "Alpha: \(Float(sender.value))"
      viewOut.backgroundColor = UIColor(displayP3Red: CGFloat(sender.value), green:  CGFloat(greenSliderOut.value), blue:  CGFloat(blueSliderOut.value), alpha: CGFloat(sender.value))
    }
    
    //MARK: - Outlets
    @IBOutlet weak var redSliderOut: UISlider!
    @IBOutlet weak var greenSliderOut: UISlider!
    @IBOutlet weak var blueSliderOut: UISlider!
    @IBOutlet weak var stepperOut: UIStepper!
    
    
    
    
    
    //MARK: - LifeCycle Methods
    override func viewDidLoad() {
    viewOut.backgroundColor = UIColor(displayP3Red: CGFloat(red), green:  CGFloat(green), blue:  CGFloat(blue), alpha: 1.0)
    colorNameLabel.text = currentColorName
    redSliderOut.value = Float(red)
    greenSliderOut.value = Float(green)
    blueSliderOut.value = Float(blue)
    redLabelOut.text = "Red: \(Float(red))"
    blueLabelOut.text = "Blue: \(Float(blue))"
    greenLabelOut.text = "Green: \(Float(green))"
    alphaLabel.text = "Alpha: 1.0"
    super.viewDidLoad()
    }

}
