//
//  InfoViewController.swift
//  Inter
//
//  Created by Raghav Prasad on 11/07/18.
//  Copyright © 2018 Raghav. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {
    
    var screenWidth = UIScreen.main.bounds.size.width
    var screenHeight = UIScreen.main.bounds.size.height
    
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var articleTitle: UILabel!
    @IBOutlet weak var articleBody: UILabel!
    
    @IBAction func fbButton(_ sender: UIButton) {
        UIApplication.shared.open(URL(string: "http://fb.com/macbitsgoa")!, options: [:], completionHandler: nil)
    }
    
    @IBOutlet weak var fbButton: UIButton!
    
    @IBAction func githubButtonClick(_ sender: UIButton) {
        UIApplication.shared.open(URL(string: "https://github.com/MobileApplicationsClub")!, options: [:], completionHandler: nil)
    }
    
    @IBOutlet weak var githubButton: UIButton!
    
    @IBAction func MACButtonClick(_ sender: UIButton) {
        UIApplication.shared.open(URL(string: "https://macbitsgoa.com/")!, options: [:], completionHandler: nil)
    }
    
    @IBOutlet weak var MACButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func setupViews() {
        fbButton.translatesAutoresizingMaskIntoConstraints = false
        githubButton.translatesAutoresizingMaskIntoConstraints = false
        MACButton.translatesAutoresizingMaskIntoConstraints = false
        articleBody.translatesAutoresizingMaskIntoConstraints = false
        articleTitle.translatesAutoresizingMaskIntoConstraints = false
        logo.translatesAutoresizingMaskIntoConstraints = false
        
        fbButton.centerXAnchor.constraint(equalTo: self.view.leftAnchor, constant: screenWidth/4).isActive = true
        fbButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: (-1*screenHeight)/18).isActive = true
        fbButton.widthAnchor.constraint(equalToConstant: screenWidth/7).isActive = true
        fbButton.heightAnchor.constraint(equalTo: fbButton.widthAnchor).isActive = true
        fbButton.layer.cornerRadius = fbButton.frame.height/4
        
        githubButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        githubButton.bottomAnchor.constraint(equalTo: self.fbButton.bottomAnchor).isActive = true
        githubButton.widthAnchor.constraint(equalTo: fbButton.widthAnchor).isActive = true
        githubButton.heightAnchor.constraint(equalTo: githubButton.widthAnchor).isActive = true
        githubButton.layer.cornerRadius = githubButton.frame.height/4
        
        MACButton.centerXAnchor.constraint(equalTo: self.view.rightAnchor, constant: (-1*screenWidth)/4).isActive = true
        MACButton.bottomAnchor.constraint(equalTo: fbButton.bottomAnchor).isActive = true
        MACButton.widthAnchor.constraint(equalTo: fbButton.widthAnchor).isActive = true
        MACButton.heightAnchor.constraint(equalTo: MACButton.widthAnchor).isActive = true
        MACButton.layer.cornerRadius = MACButton.frame.height/4
        
        articleTitle.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        articleTitle.topAnchor.constraint(equalTo: self.view.topAnchor, constant: screenHeight/2.2).isActive = true
        articleTitle.widthAnchor.constraint(equalToConstant: screenWidth/1.7).isActive = true
        articleTitle.heightAnchor.constraint(equalToConstant: screenHeight/15).isActive = true
        
        articleBody.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        articleBody.widthAnchor.constraint(equalToConstant: screenWidth/1.11).isActive = true
        articleBody.heightAnchor.constraint(equalToConstant: screenHeight/4).isActive = true
        articleBody.topAnchor.constraint(equalTo: articleTitle.bottomAnchor).isActive = true
        
        logo.widthAnchor.constraint(equalToConstant: screenWidth/1.5).isActive = true
        logo.heightAnchor.constraint(equalTo: logo.widthAnchor).isActive = true
        logo.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        logo.topAnchor.constraint(equalTo: self.view.topAnchor, constant: screenHeight/10).isActive = true
        
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
