//
//  ViewController.swift
//  TipCalculator
//
//  Created by Nekkalapudi, Satish on 8/23/14.
//  Copyright (c) 2014 Nekkalapudi, Satish. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
                            
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipLabel  : UILabel!

    @IBOutlet weak var tipControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tipLabel.text  = "$0.0"
        totalLabel.text = "$0.0"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        println("view did appear")
        
        var defaults = NSUserDefaults.standardUserDefaults()
       // var stringValue = defaults.objectForKey("some_key_that_you_choose") as String
        var intValue = defaults.integerForKey("defaultTipSegmentIndex")
        
        println(intValue)
        tipControl.selectedSegmentIndex = intValue
        
        updateTip()
        
        
    }
    
    
    @IBAction func onEditingChanged(sender: AnyObject) {
       
        updateTip()
        
        
        
        
    }
    
    func updateTip() {
        var tipPercentages = [0.18, 0.2, 0.22]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        var billAmount = NSString(string: billField.text).doubleValue
        
        var tip = billAmount * tipPercentage
        
        var totalAmount = billAmount + tip
        
        tipLabel.text = "\(tip)"
        totalLabel.text = "\(totalAmount)"
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", totalAmount)
    }
    
    
    

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}
