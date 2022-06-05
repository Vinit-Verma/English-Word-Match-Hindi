//
//  TreViewController.swift
//  Eng Word Match
//
//  Created by mac on 2016-11-27.
//  Copyright © 2016 Marianne Mathleins forlag. All rights reserved.
//

import UIKit

class TreViewController: UIViewController {

    @IBOutlet var accuracyLabel: UILabel!
    @IBOutlet var totalLabel: UILabel!
    
    var accuracyFromVC = String()
    var totalQuestionsFromVC = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        accuracyLabel.text = accuracyFromVC
        totalLabel.text = totalQuestionsFromVC
        //print("Tre acc \(accuracyFromVC)")
        //print("total \(totalQuestionsFromVC)")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
