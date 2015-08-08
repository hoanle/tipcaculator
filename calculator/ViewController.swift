//
//  ViewController.swift
//  calculator
//
//  Created by Hoan Le on 8/8/15.
//  Copyright (c) 2015 Hoan Le. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipRate: UISegmentedControl!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var totalLable: UILabel!
    let numberFormatter = NSNumberFormatter()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tipLabel.text = "$0.00"
        totalLable.text = "$0.00"
        billField.text = ""
        billField.placeholder = "Enter money here"
        
        numberFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        var billAmount = 0.0
        
        if (countElements(billField.text!) > 10) {
            billField.deleteBackward()
            billAmount = numberFormatter.numberFromString(billField.text)!
        }else if (countElements(billField.text!) > 0){
            billAmount = numberFormatter.numberFromString(billField.text)!
        }else{
            billAmount = 0.0
        }
        
        var tip = billAmount * getTipPercentage()
        var total = billAmount + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLable.text = String(format: "$%.2f", total)
        
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    func getTipPercentage()-> Double{
        switch tipRate.selectedSegmentIndex{
            case 1:
                return 0.20
            case 2:
                return 0.22
            default:
                return 0.18
        }
    }
    @IBAction func onValueChanged(sender: AnyObject) {
        onEditingChanged(sender)
    }
}

