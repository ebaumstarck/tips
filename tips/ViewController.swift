//
//  ViewController.swift
//  tips
//
//  Created by emma_baumstarck on 4/28/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipSelectorSegment: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        billField.text = ""
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        tipSelectorSegment.removeAllSegments()
        
        let defaults = NSUserDefaults.standardUserDefaults()
        
        var numAdded = 0
        var percent = 5
        while percent <= 25 {
            if defaults.boolForKey("\(percent)") {
                tipSelectorSegment.insertSegmentWithTitle(
                    "\(percent)%", atIndex: numAdded, animated: true)
                numAdded += 1
            }
            percent += 5
        }
        tipSelectorSegment.selectedSegmentIndex = numAdded / 2
        billField.text = ""
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
//        let tipPercentages = [0.15, 0.2, 0.25]
//        let tipPercentage = tipPercentages[tipSelectorSegment.selectedSegmentIndex]
        let displayedPercentage = tipSelectorSegment.titleForSegmentAtIndex(tipSelectorSegment.selectedSegmentIndex)
        let percentage = Int(
            (displayedPercentage?.substringToIndex(
                (displayedPercentage?.endIndex.advancedBy(-1))!))!)
        
        let billAmount = NSString(string: billField.text!).doubleValue
        let tip = billAmount * 0.01 * Double(percentage!)
        let total = billAmount + tip
//    tipSelectorSegment.insertSegmentWithTitle("FOO", atIndex: 3, animated: true)
//        tipSelectorSegment.removese
        
        tipLabel.text = String(format: "$%.02f", tip)
        totalLabel.text = String(format: "$%.02f", total)
    }
    
    @IBAction func onBackgroundTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

