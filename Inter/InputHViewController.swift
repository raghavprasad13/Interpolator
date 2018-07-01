//
//  InputHViewController.swift
//  Inter
//
//  Created by Raghav Prasad on 24/09/17.
//  Copyright © 2017 Raghav. All rights reserved.
//

import UIKit

class InputHViewController: UIViewController {
    
    var displayT: String!

    @IBOutlet weak var dispT: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        display()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func display(){
        dispT.text = displayT
    }
        

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
