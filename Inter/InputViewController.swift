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
    
    @IBOutlet weak var calculateButton: UIButton!
    
    @IBOutlet weak var T1: UITextField!
    @IBOutlet weak var H1: UITextField!
    @IBOutlet weak var T2: UITextField!
    @IBOutlet weak var H2: UITextField!
    @IBOutlet weak var newVal: UITextField!
    
    @IBAction func junk(_ sender: UIButton) {
        _ = check()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate()
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
    
    
    func delegate(){
        T1.delegate = self
        T2.delegate = self
        H1.delegate = self
        H2.delegate = self
                
        calculateButton.layer.cornerRadius = calculateButton.frame.height/2
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



