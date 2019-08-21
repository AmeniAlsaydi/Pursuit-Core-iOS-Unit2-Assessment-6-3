//
//  ColorDetailViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Levi Davis on 8/21/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit


class ColorDetailViewController: UIViewController {
    var crayon: Crayon!
    var delegate: ColorChangeDelegate?
    
    @IBOutlet weak var crayonColorLabel: UILabel!
    
    
    @IBAction func redSlider(_ sender: UISlider) {
        
    }
    
    @IBAction func greenSlider(_ sender: UISlider) {
    }
    
    @IBAction func blueSlider(_ sender: UISlider) {
    }
    
    @IBAction func alphaStepper(_ sender: UIStepper) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        crayonColorLabel.text = crayon.name
        view.backgroundColor = UIColor(red: crayon.red, green: crayon.green, blue: crayon.blue, alpha: 1.0)

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
