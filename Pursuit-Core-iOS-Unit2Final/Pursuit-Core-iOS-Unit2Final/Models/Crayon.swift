//
//  Crayon.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Alex Paul on 11/15/18.
//  Copyright © 2018 Alex Paul. All rights reserved.
//

import Foundation
import UIKit

protocol UIColorable {
    var defaultRed: Float {get}
    var defaultGreen: Float {get}
    var defaultBlue: Float {get}
    var defaultAlpha: Double {get}
    func resetValues()
    
}

class Crayon {
  var name: String
  var red: Double
  var green: Double
  var blue: Double
  var hex: String
  var delegate: UIColorable?

    private init(name: String,red:Double,green:Double,blue:Double,hex: String) {
    self.name = name
    self.red = red
    self.green = green
    self.blue = blue
    self.hex = hex
  }
    convenience init(name:String,hex:String) {
        self.init(name: name, red: 0, green: 0, blue: 0, hex: hex)
        let hexDict = makeHexIntoDict(hex: hex)
        self.red = getValueFromHex(dict: hexDict, first: 1, second: 2)
        self.green = getValueFromHex(dict: hexDict, first: 3, second: 4)
        self.blue = getValueFromHex(dict: hexDict, first: 5, second: 6)
    }
  static let allTheCrayons = [
    Crayon(name: "Almond", hex: "#EFDECD"),
    Crayon(name: "Antique Brass", hex: "#CD9575"),
    Crayon(name: "Apricot", hex: "#FDD9B5"),
    Crayon(name: "Aquamarine", hex: "#78DBE2"),
    Crayon(name: "Asparagus",hex: "#87A96B"),
    Crayon(name: "Atomic Tangerine", hex: "#FFA474"),
    Crayon(name: "Banana Mania", hex: "#FAE7B5"),
    Crayon(name: "Beaver",hex: "#9F8170"),
    Crayon(name: "Bittersweet",hex: "#FD7C6E"),
    Crayon(name: "Black", hex: "#000000"),
    Crayon(name: "Blizzard Blue", hex: "#ACE5EE"),
    Crayon(name: "Blue",hex: "#1F75FE"),
    Crayon(name: "Blue Bell",hex: "#A2A2D0"),
    Crayon(name: "Blue Gray",hex: "#6699CC"),
    Crayon(name: "Blue Green", hex: "#0D98BA"),
    Crayon(name: "Blue Violet", hex: "#7366BD")
  ]
    func getUIColor() -> UIColor {
       return UIColor(displayP3Red: CGFloat(self.red/255), green: CGFloat(self.green/255), blue: CGFloat(self.blue/255), alpha: 1)
    }
    func makeHexIntoDict(hex: String) -> [Int:Character] {
        var dict: [Int:Character] = [:]
        for (index,i) in hex.enumerated() {
            dict[index] = i
        }
        return dict
    }
    func getValueFromHex(dict: [Int:Character], first: Int, second: Int) -> Double {
        guard let firstDigit = dict[first], let secondDigit = dict[second] else {
            return Double()
        }
        if let firstNum = Int("\(firstDigit)") {
            if let secondNum = Int("\(secondDigit)") {
                return Double((firstNum * 16) + secondNum)
            } else {
                let secondLetterValue = getValue(from: secondDigit)
                return Double(firstNum * 16) + secondLetterValue
            }
        } else {
            let firstLetterValue = getValue(from: firstDigit)
            if let secondNum = Int("\(secondDigit)") {
                return (firstLetterValue * 16) + Double(secondNum)
            } else {
                let secondLetterValue = getValue(from: secondDigit)
                return (firstLetterValue * 16) + secondLetterValue
            }
        }
    }
    func getValue(from letter: Character) -> Double {
        switch letter {
        case "A":
            return 10
        case "B":
            return 11
        case "C":
            return 12
        case "D":
            return 13
        case "E":
            return 14
        case "F":
            return 15
        default:
            return Double()
        }
    }
}
