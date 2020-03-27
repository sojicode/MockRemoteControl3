//
//  ConfigureViewController.swift
//  Syang_Mock Remote Control3
//
//  Created by Sojeong Yang on 2/28/20.
//  Copyright © 2020 DePaul University. All rights reserved.
//

import UIKit

class ConfigureViewController: UIViewController {
    
    
    @IBOutlet weak var segmentedCtrlbtn: UISegmentedControl!
    
    @IBOutlet weak var TextFieldLabel: UITextField!
    
    @IBOutlet weak var channelNum: UILabel!
    
    @IBOutlet weak var chStepperUpDown: UIStepper!
    
    @IBOutlet weak var cancelBtn: UIButton!
    
    @IBOutlet weak var saveBtn: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func doneEditing(_ sender: UITextField) {
        
        sender.resignFirstResponder()
    }
    
    @IBAction func chUpDown(_ sender: UIStepper) {
        
        channelNum.text = String(Int(chStepperUpDown.value))
    }
    
    @IBAction func cancelBtnPressed(_ sender: UIButton) {
        
        TextFieldLabel.text = ""
        channelNum.text = "1"
        chStepperUpDown.value = 1
        segmentedCtrlbtn.selectedSegmentIndex = 0
        
    }
    
    @IBAction func saveBtnPressed(_ sender: UIButton) {
        
        let currNum = segmentedCtrlbtn.selectedSegmentIndex
        let currTabView = tabBarController as! TabbedViewController
        
        if TextFieldLabel.text != "" && Int(TextFieldLabel.text!) == nil {
            let fav = TextFieldLabel.text!
            
            if fav.count >= 1 && fav.count <= 4 {
                currTabView.configFavChannel[currNum].label = TextFieldLabel.text!
                currTabView.configFavChannel[currNum].chNum = Int(channelNum.text!) ?? 1
            }
            
            else {
                showNumAlert(fav.count)
            }
        } else {
            showAlert()
        }
        
    }
    
    func showNumAlert(_ countValue:Int) {
        
        if countValue > 4 {
            let actionAlert = UIAlertController(title: "Warning",
                                                message: "Your label is too long.",
                                                preferredStyle: .alert)
            let cancelAction =
                UIAlertAction(title: "OK",
                              style: .cancel,
                              handler: nil)
            actionAlert.addAction(cancelAction )
            self.present(actionAlert, animated: true, completion: nil)
            
        }
            
    }
    
    func showAlert() {
        
        let actionAlert =
            UIAlertController(title: "Warning",
                              message: "Please check your input, your label is too short or invalid input. Try input letters",
                              preferredStyle: .alert)
        let cancelAction =
            UIAlertAction(title: "OK",
                          style: .cancel,
                          handler: nil)
        
        actionAlert.addAction(cancelAction)
        self.present(actionAlert, animated: true, completion: nil)
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
