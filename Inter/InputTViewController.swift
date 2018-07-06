//
//  InputTViewController.swift
//  Inter
//
//  Created by Raghav Prasad on 24/09/17.
//  Copyright © 2017 Raghav. All rights reserved.
//

import UIKit

class InputTViewController: UIViewController {
    
    var displayH: String!
    
    var screen_height = UIScreen.main.bounds.size.height
    var screen_width = UIScreen.main.bounds.size.width

    @IBOutlet weak var corr_x_label: UILabel!
    @IBOutlet weak var dispH: UILabel!
    
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
        dispH.text = displayH
        
        corr_x_label.translatesAutoresizingMaskIntoConstraints = false
        dispH.translatesAutoresizingMaskIntoConstraints = false
        
        corr_x_label.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        corr_x_label.topAnchor.constraint(equalTo: self.view.topAnchor, constant: screen_height/2.5).isActive = true
        corr_x_label.widthAnchor.constraint(equalToConstant: screen_width/2).isActive = true
        corr_x_label.heightAnchor.constraint(equalTo: corr_x_label.widthAnchor, multiplier: 1/6).isActive = true
        
        dispH.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        dispH.topAnchor.constraint(equalTo: corr_x_label.bottomAnchor, constant: screen_height/15).isActive = true
        dispH.widthAnchor.constraint(equalToConstant: screen_width/2).isActive = true
        dispH.heightAnchor.constraint(equalTo: corr_x_label.heightAnchor).isActive = true
        
        
        
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
