//
//  ViewController.swift
//  Eng Word Match
//
//  Created by mac on 2016-10-21.
//  Copyright © 2016 Marianne Mathleins forlag. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var accuracyFromSecondVC = String()
    var totalQuestionsFromSecondVC = String()
    
    var accDefault = NSUserDefaults.standardUserDefaults()
    var totalDefault = NSUserDefaults.standardUserDefaults()
    
    var stringAcc = String()
    var stringTotal = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(accDefault.stringForKey("acc") != nil){
            accuracyFromSecondVC = accDefault.stringForKey("acc")!
            stringAcc = accDefault.stringForKey("acc")!
        }
        
        if(totalDefault.stringForKey("total") != nil){
            totalQuestionsFromSecondVC = totalDefault.stringForKey("total")!
            stringTotal = totalDefault.stringForKey("total")!
        }
        
        
        print("acc : \(accuracyFromSecondVC)")
        print("total : \(totalQuestionsFromSecondVC)")
        //Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    @IBAction func resultBtn(sender: AnyObject) {
        
        accDefault.setObject(accuracyFromSecondVC, forKey: "acc")
        totalDefault.setObject(totalQuestionsFromSecondVC, forKey: "total")
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "V1-V3"){
            let desVC:TreViewController = segue.destinationViewController as! TreViewController
            desVC.accuracyFromVC = stringAcc //accuracyFromSecondVC
            desVC.totalQuestionsFromVC = stringTotal //totalQuestionsFromSecondVC
            print("Segue performed succesfully!!! :\(accuracyFromSecondVC): \(totalQuestionsFromSecondVC)")
        }
    }
    

}

