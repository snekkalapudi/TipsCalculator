//
//  SettingsViewController.swift
//  TipCalculator
//
//  Created by Nekkalapudi, Satish on 8/23/14.
//  Copyright (c) 2014 Nekkalapudi, Satish. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tipControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        println("view did appear")
        
       
      
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        println("view will appear")
        
        var defaults = NSUserDefaults.standardUserDefaults()
        // var stringValue = defaults.objectForKey("some_key_that_you_choose") as String
        var intValue = defaults.integerForKey("defaultTipSegmentIndex")
        
        println(intValue)
        tipControl.selectedSegmentIndex = intValue
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func done(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func changeDefaultTipPercentage(sender: AnyObject) {
       
        var defaults = NSUserDefaults.standardUserDefaults()
       // defaults.setObject("some_string_to_save", forKey: "some_key_that_you_choose")
        defaults.setInteger(tipControl.selectedSegmentIndex, forKey: "defaultTipSegmentIndex")
        defaults.synchronize()
        
        print(tipControl.selectedSegmentIndex)
    }
 
}