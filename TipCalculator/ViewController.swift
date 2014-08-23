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
    
    override func viewWillAppear(animated: Bool) {
        
        var defaults = NSUserDefaults.standardUserDefaults()
        var theme = defaults.boolForKey("theme")
        
        if (theme) {
            self.view.backgroundColor = colorize( 0xFFCC66, alpha:1.0)
        } else {
            self.view.backgroundColor = UIColor.whiteColor()
        }
        
    }
    
    func colorize (hex: Int, alpha: Double = 1.0) -> UIColor {
        let red = Double((hex & 0xFF0000) >> 16) / 255.0
        let green = Double((hex & 0xFF00) >> 8) / 255.0
        let blue = Double((hex & 0xFF)) / 255.0
        var color: UIColor = UIColor( red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha:CGFloat(alpha) )
        return color
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

