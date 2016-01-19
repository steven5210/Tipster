//
//  ViewController.swift
//  Tipster
//
//  Created by Steven Huynh on 10/13/15.
//  Copyright © 2015 Steven Huynh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tabTotal: UILabel!
    var displayValue : Double {
        get {
            return Double(tabTotal.text!)!
        }
        set {
            tabTotal.text = "\(newValue)"
        }
    }
    var groupSizes : Double {
        get {
            return Double(groupSize.text!)!
        }
        set {
            groupSize.text = "\(newValue)"
        }
    }
    var tipPercentages : Double {
        get {
            return Double(tipPercent1.text!)!
        }
        set {
            tipPercent1.text = "\(newValue)"
        }
    }
    var totalExist = false
    var savedTotal : Double = 0
    var userIsTyping = false
    
    @IBOutlet weak var tipPercent1: UILabel!
    @IBOutlet weak var tipPercent2: UILabel!
    @IBOutlet weak var tipPercent3: UILabel!
    @IBOutlet weak var tipAmount1: UILabel!
    @IBOutlet weak var tipAmount2: UILabel!
    @IBOutlet weak var tipAmount3: UILabel!
    @IBOutlet weak var totalWithTip: UILabel!
    @IBOutlet weak var totalWithTip2: UILabel!
    @IBOutlet weak var totalWithTip3: UILabel!
    @IBOutlet weak var groupSize: UILabel!


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipPercent1.text = String(10)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func digitPressed(sender: UIButton) {
        let digit = sender.currentTitle
        
        if userIsTyping == false {
            tabTotal.text = ""
            tabTotal.text = digit
            userIsTyping = true
        }
        else {
            tabTotal.text = tabTotal.text! + digit!
            updateUI()
        }
    }
    @IBAction func clearPressed(sender: UIButton) {
        tabTotal.text = ""
    }
    @IBAction func tipSlide(sender: UISlider) {
        tipPercent1.text = String(format: "%.0f", round(sender.value))
        tipPercent2.text = String(format: "%.0f",round(sender.value) + 5) + "%"
        tipPercent3.text = String(format: "%.0f",round(sender.value) + 10) + "%"
        updateUI()
    }
    @IBAction func sizeSlide(sender: UISlider) {
        groupSize.text = String(format: "%.0f",round(sender.value))
        updateUI()
    }
    func updateUI(){
        tipAmount1.text = String(format: "%.2f",((tipPercentages / 100) * displayValue) / groupSizes)
        tipAmount2.text = String(format: "%.2f",((tipPercentages / 100 + 0.05) * displayValue) / groupSizes)
        tipAmount3.text = String(format: "%.2f",((tipPercentages / 100 + 0.10) * displayValue) / groupSizes)
        totalWithTip.text = String(format: "%.2f",(((tipPercentages / 100) * displayValue) + displayValue) / groupSizes)
        totalWithTip2.text = String(format: "%.2f",(((tipPercentages / 100 + 0.05) * displayValue) + displayValue) / groupSizes)
        totalWithTip3.text = String(format: "%.2f",(((tipPercentages / 100 + 0.10) * displayValue) + displayValue) / groupSizes)
    }

}

