//
//  SettingsViewController.swift
//  tips
//
//  Created by emma_baumstarck on 4/29/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var switchPercent5: UISwitch!
    @IBOutlet weak var switchPercent10: UISwitch!
    @IBOutlet weak var switchPercent15: UISwitch!
    @IBOutlet weak var switchPercent20: UISwitch!
    @IBOutlet weak var switchPercent25: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        // update switches
        let defaults = NSUserDefaults.standardUserDefaults()
        switchPercent5.setOn(defaults.boolForKey("5"), animated: true)
        switchPercent10.setOn(defaults.boolForKey("10"), animated: true)
        switchPercent15.setOn(defaults.boolForKey("15"), animated: true)
        switchPercent20.setOn(defaults.boolForKey("20"), animated: true)
        switchPercent25.setOn(defaults.boolForKey("25"), animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func updateToggle(sender: AnyObject) {
        var percent:Int
        if sender.isEqual(switchPercent5) {
            percent = 5
        } else if sender.isEqual(switchPercent10) {
            percent = 10
        } else if sender.isEqual(switchPercent15) {
            percent = 15
        } else if sender.isEqual(switchPercent20) {
            percent = 20
        } else if sender.isEqual(switchPercent25) {
            percent = 25
        } else {
            percent = -1
        }
        
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setBool(
//            ((sender as! UISwitch).valueForKey("important")?.boolValue)!,
            (sender as! UISwitch).on,
            forKey: String(format:"%d", percent))
        defaults.synchronize()
    }

}
