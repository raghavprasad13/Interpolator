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
    @IBOutlet weak var infoButton: UIButton!
    @IBOutlet weak var madeByMACLogo: UIImageView!
    
    var screen_height = UIScreen.main.bounds.size.height
    var screen_width = UIScreen.main.bounds.size.width
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        goButton.translatesAutoresizingMaskIntoConstraints = false
        infoButton.translatesAutoresizingMaskIntoConstraints = false
        madeByMACLogo.translatesAutoresizingMaskIntoConstraints = false
        
        goButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        goButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        goButton.heightAnchor.constraint(equalToConstant: screen_height/5.5).isActive = true
        goButton.widthAnchor.constraint(equalTo: goButton.heightAnchor).isActive = true
        
        goButton.layer.cornerRadius = goButton.frame.height/2
        
        
        infoButton.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: (-1*screen_width)/13).isActive = true
//        infoButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: (-1*screen_width)/13).isActive = true
        infoButton.centerYAnchor.constraint(equalTo: self.view.bottomAnchor, constant: (-1*screen_height)/20).isActive = true
        infoButton.widthAnchor.constraint(equalToConstant: screen_width/14.5).isActive = true
        infoButton.heightAnchor.constraint(equalTo: infoButton.widthAnchor, multiplier: 1).isActive = true
        
//        madeByMACLogo.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        madeByMACLogo.centerYAnchor.constraint(equalTo: infoButton.centerYAnchor).isActive = true
        madeByMACLogo.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        madeByMACLogo.widthAnchor.constraint(equalToConstant: screen_width/1.8).isActive = true
        madeByMACLogo.heightAnchor.constraint(equalToConstant: screen_height/10).isActive = true
        
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

