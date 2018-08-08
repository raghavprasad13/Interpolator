//
//  ViewController.swift
//  Inter
//
//  Created by Raghav Prasad on 24/09/17.
//  Copyright © 2017 Raghav. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var screen_height = UIScreen.main.bounds.size.height
    var screen_width = UIScreen.main.bounds.size.width
    
    @IBOutlet weak var MACLogo: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.asyncAfter(deadline: .now()+1, execute: {
            self.performSegue(withIdentifier: "showCalcView", sender: self)
        })
        
        MACLogo.translatesAutoresizingMaskIntoConstraints = false
        
        MACLogo.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        MACLogo.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        MACLogo.heightAnchor.constraint(equalToConstant: screen_height/3.36).isActive = true
        MACLogo.widthAnchor.constraint(equalToConstant: screen_width/1.33).isActive = true
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        DispatchQueue.main.asyncAfter(deadline: .now()+1, execute: {
//            self.performSegue(withIdentifier: "showCalcView", sender: self)
//        })
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
}

