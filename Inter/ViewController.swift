//
//  ViewController.swift
//  Inter
//
//  Created by Raghav Prasad on 24/09/17.
//  Copyright © 2017 Raghav. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var goButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        goButton.translatesAutoresizingMaskIntoConstraints = false
        goButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        goButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        goButton.heightAnchor.constraint(equalToConstant: 105).isActive = true
        goButton.widthAnchor.constraint(equalToConstant: 105).isActive = true
        
        goButton.layer.cornerRadius = goButton.frame.height/2
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

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

