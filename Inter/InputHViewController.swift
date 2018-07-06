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
    
    var screen_height = UIScreen.main.bounds.size.height
    var screen_width = UIScreen.main.bounds.size.width

    @IBOutlet weak var corr_y_label: UILabel!
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
        
        corr_y_label.translatesAutoresizingMaskIntoConstraints = false
        dispT.translatesAutoresizingMaskIntoConstraints = false
        
        corr_y_label.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        corr_y_label.topAnchor.constraint(equalTo: self.view.topAnchor, constant: screen_height/2.5).isActive = true
        corr_y_label.widthAnchor.constraint(equalToConstant: screen_width/2).isActive = true
        corr_y_label.heightAnchor.constraint(equalTo: corr_y_label.widthAnchor, multiplier: 1/6).isActive = true
        
        dispT.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        dispT.topAnchor.constraint(equalTo: corr_y_label.bottomAnchor, constant: screen_height/15).isActive = true
        dispT.widthAnchor.constraint(equalToConstant: screen_width/2).isActive = true
        dispT.heightAnchor.constraint(equalTo: corr_y_label.heightAnchor).isActive = true
        
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
