//
//  InputViewController.swift
//  Inter
//
//  Created by Raghav Prasad on 24/09/17.
//  Copyright © 2017 Raghav. All rights reserved.
//

import UIKit

class InputViewController: UIViewController {
    var t1 = 0.0, h1 = 0.0, t2 = 0.0, h2 = 0.0, newValue = 0.0, answer = 0.0
    var slope = 0.0, yIntercept = 0.0
    var inputIsTemperature = true
    
    var screen_width = UIScreen.main.bounds.size.width
    var screen_height = UIScreen.main.bounds.size.height
    
    @IBOutlet weak var calculateButton: UIButton!
    
    @IBOutlet weak var T1: UITextField!
    @IBOutlet weak var H1: UITextField!
    @IBOutlet weak var T2: UITextField!
    @IBOutlet weak var H2: UITextField!
    @IBOutlet weak var newVal: UITextField!
    
    @IBOutlet weak var y_values_label: UILabel!
    @IBOutlet weak var x_values_label: UILabel!
    
    @IBOutlet weak var toggle: UISegmentedControl!
    
    @IBAction func junk(_ sender: UIButton) {
        _ = check()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(screen_width)
        print(screen_height)
        delegate()
        setup_views()
        restoreDefaults()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onSubmit(_ sender: UIButton) {
        let isOkay = check()
        if !isOkay{
            return
        }
        t1 = Double(T1.text!)!
        h1 = Double(H1.text!)!
        t2 = Double(T2.text!)!
        h2 = Double(H2.text!)!
        newValue = Double(newVal.text!)!
        
        generateLine(x1: t1, y1: h1, x2: t2, y2: h2)
        
        answer = getAnswer(m: slope, c: yIntercept)
        
        if inputIsTemperature{
            self.performSegue(withIdentifier: "inputT", sender: self)
        }
            
        else{
            self.performSegue(withIdentifier: "inputH", sender: self)
        }
        restoreDefaults()
    }
    
    
    @IBAction func onChange(_ sender: UISegmentedControl) {
        switch  sender.selectedSegmentIndex {
        case 0:
            newVal.placeholder = "y"
            inputIsTemperature = true
            break
            
        case 1:
            newVal.placeholder = "x"
            inputIsTemperature = false
            break
            
        default:
            return
        }
    }
    
    
    func setup_views() {
        
        y_values_label.translatesAutoresizingMaskIntoConstraints = false
        x_values_label.translatesAutoresizingMaskIntoConstraints = false
        toggle.translatesAutoresizingMaskIntoConstraints = false
        T1.translatesAutoresizingMaskIntoConstraints = false
        T2.translatesAutoresizingMaskIntoConstraints = false
        H1.translatesAutoresizingMaskIntoConstraints = false
        H2.translatesAutoresizingMaskIntoConstraints = false
        newVal.translatesAutoresizingMaskIntoConstraints = false
        calculateButton.translatesAutoresizingMaskIntoConstraints = false
        
        y_values_label.centerXAnchor.constraint(equalTo: self.view.leftAnchor, constant: screen_width/4).isActive = true
        y_values_label.centerYAnchor.constraint(equalTo: self.view.topAnchor, constant: screen_height/3).isActive = true
//        y_values_label.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 150).isActive = true
//        y_values_label.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: screen_width/6).isActive = true
        y_values_label.widthAnchor.constraint(equalToConstant: screen_width/4).isActive = true
        y_values_label.heightAnchor.constraint(equalToConstant: screen_height/23).isActive = true
        
        x_values_label.centerXAnchor.constraint(equalTo: self.view.rightAnchor, constant: (-1*screen_width)/4).isActive = true
        x_values_label.centerYAnchor.constraint(equalTo: self.view.topAnchor, constant: screen_height/3).isActive = true
        x_values_label.widthAnchor.constraint(equalToConstant: screen_width/4).isActive = true
        x_values_label.heightAnchor.constraint(equalToConstant: screen_height/23).isActive = true
        
        toggle.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: screen_width/12).isActive = true
        toggle.topAnchor.constraint(equalTo: self.view.topAnchor, constant: screen_height/5).isActive = true
        toggle.widthAnchor.constraint(equalToConstant: screen_width/4).isActive = true
        toggle.heightAnchor.constraint(equalTo: toggle.widthAnchor, multiplier: 7/25).isActive = true
        
        T1.centerXAnchor.constraint(equalTo: y_values_label.centerXAnchor).isActive = true
//        T1.leftAnchor.constraint(equalTo: y_values_label.leftAnchor, constant: (-1*screen_width)/10).isActive = true
//        T1.rightAnchor.constraint(equalTo: y_values_label.rightAnchor, constant: screen_width/10).isActive = true
        T1.topAnchor.constraint(equalTo: y_values_label.bottomAnchor, constant: screen_height/14).isActive = true
        T1.widthAnchor.constraint(equalToConstant: screen_width/3).isActive = true
        T1.heightAnchor.constraint(equalTo: T1.widthAnchor, multiplier: 9/25).isActive = true
        
        H1.centerXAnchor.constraint(equalTo: x_values_label.centerXAnchor).isActive = true
        H1.topAnchor.constraint(equalTo: x_values_label.bottomAnchor, constant: screen_height/14).isActive = true
        H1.widthAnchor.constraint(equalToConstant: screen_width/3).isActive = true
        H1.heightAnchor.constraint(equalTo: H1.widthAnchor, multiplier: 9/25).isActive = true
        
        T2.centerXAnchor.constraint(equalTo: T1.centerXAnchor).isActive = true
        T2.topAnchor.constraint(equalTo: T1.bottomAnchor, constant: screen_height/14).isActive = true
        T2.widthAnchor.constraint(equalTo: T1.widthAnchor).isActive = true
        T2.heightAnchor.constraint(equalTo: T1.heightAnchor).isActive = true
        
        H2.centerXAnchor.constraint(equalTo: H1.centerXAnchor).isActive = true
        H2.topAnchor.constraint(equalTo: H1.bottomAnchor, constant: screen_height/14).isActive = true
        H2.widthAnchor.constraint(equalTo: H1.widthAnchor).isActive = true
        H2.heightAnchor.constraint(equalTo: H1.heightAnchor).isActive = true
        
        newVal.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        newVal.topAnchor.constraint(equalTo: T2.bottomAnchor, constant: screen_height/14).isActive = true
        newVal.widthAnchor.constraint(equalTo: T1.widthAnchor).isActive = true
        newVal.heightAnchor.constraint(equalTo: T1.heightAnchor).isActive = true
        
        calculateButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        calculateButton.topAnchor.constraint(equalTo: newVal.bottomAnchor, constant: screen_height/12).isActive = true
        calculateButton.widthAnchor.constraint(equalTo: newVal.widthAnchor).isActive = true
        calculateButton.heightAnchor.constraint(equalTo: newVal.heightAnchor).isActive = true
        calculateButton.layer.cornerRadius = calculateButton.frame.height/2
        
    }
    
    func delegate() {
        T1.delegate = self
        T2.delegate = self
        H1.delegate = self
        H2.delegate = self
    }
    
    func generateLine(x1: Double, y1: Double, x2: Double, y2: Double){
        slope = (y2 - y1)/(x2 - x1)
        yIntercept = y1 - (slope * x1)
    }
    
    func getAnswer(m: Double, c: Double) -> Double{
        if inputIsTemperature{
            return (m * newValue) + c
        }
        
        return (newValue - c)/m
    }
    
    func check() -> Bool{
        if (T1.text?.isEmpty)! || (T2.text?.isEmpty)! || (H1.text?.isEmpty)! || (H2.text?.isEmpty)! || (newVal.text?.isEmpty)! {
           let alert = UIAlertController.init(title: "Empty fields!", message: "Please fill in all fields", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction.init(title: "OK", style: UIAlertActionStyle.default, handler: {(action) in alert.dismiss(animated: true, completion: nil)}))
            self.present(alert, animated: true, completion: nil)
            return false
        }
        return true
    }
    
    func restoreDefaults(){
        t1 = 0.0
        h1 = 0.0
        t2 = 0.0
        h2 = 0.0
        newValue = 0.0
        answer = 0.0
        slope = 0.0
        yIntercept = 0.0
        inputIsTemperature = true
        
        T1.text = nil
        T2.text = nil
        H1.text = nil
        H2.text = nil
        newVal.text = nil
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        T1.resignFirstResponder()
        T2.resignFirstResponder()
        H1.resignFirstResponder()
        H2.resignFirstResponder()
        newVal.resignFirstResponder()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender _: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        
        if segue.identifier == "inputH"{
            let hController = segue.destination as! InputHViewController
            hController.displayT = String(answer)
            
        }
        
        if segue.identifier == "inputT"{
            let tController = segue.destination as! InputTViewController
            
            tController.displayH = String(answer)
        }
        
    }
    
}

extension InputViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.resignFirstResponder()
    }
}



