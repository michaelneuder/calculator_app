//
//  ViewController.swift
//  calculator
//
//  Created by Michael H Neuder on 12/19/16.
//  Copyright © 2016 Michael H Neuder. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    @IBOutlet private weak var display: UILabel!
    
    private var userTyping = false
    
    @IBAction private func pushButton(_ sender: UIButton) {
        
        let digit = sender.currentTitle!
        
        if userTyping {
            let textInDisplay = display.text!
            display.text = textInDisplay + digit
            } else {
            display.text = digit
        }
        userTyping = true
    }
    
    @IBAction private func pushDecimal() {
        let textInDisplay = display.text!
        if !userTyping{
            display.text = "."
        } else if (textInDisplay.range(of: ".") == nil){
            display.text = textInDisplay + "."
        }
        userTyping = true
    }
    
    private var displayValue: Double{
        get{
            return Double(display.text!)!
        }
        set{
            display.text = String(newValue)
        }
    }
    
    private var brain = CalculatorBrain()
    
    @IBAction private func performOperation(_ sender: UIButton) {
        if userTyping{
            userTyping = false
            brain.setOperand(operand: displayValue)
        }
        if let mathSymbol = sender.currentTitle{
            brain.performOperation(symbol: mathSymbol)
        }
        displayValue = brain.result
    }
}







