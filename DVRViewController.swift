//
//  DVRViewController.swift
//  Syang_Mock Remote Control2
//
//  Created by Sojeong Yang on 2/21/20.
//  Copyright © 2020 DePaul University. All rights reserved.
//

import UIKit

class DVRViewController: UIViewController {
        
    
    @IBOutlet weak var dvrPowerLabel: UILabel!
    
    @IBOutlet weak var stateLabel: UILabel!
    
    @IBOutlet weak var dvrPowerSwitch: UISwitch!
    
    @IBOutlet var dvrBtns: [UIButton]!
    
    var isState: String = "Stopped"
    var wasState: String = "Stopped"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func dvrPowerSwith(_ sender: UISwitch) {
        
        if dvrPowerSwitch.isOn {
            stateLabel.text = "Stopped"
            isState = "Stopped"
            dvrPowerLabel.text = "On"
            print("User switched Power On")
            
            for btn in dvrBtns {
                btn.isEnabled = true
            }
            
        } else {
            stateLabel.text = "Stopped"
            dvrPowerLabel.text = "Off"
            print("User switched Power Off")
            
            for btn in dvrBtns {
                btn.isEnabled = false
            }
        }
    }
    
    
    @IBAction func playPressed(_ sender: UIButton) {
        
        if isState != "Recording" {
            isState = "Playing"
            wasState = "Playing"
            stateLabel.text = "Playing"
            print("User click Play button")

        } else {
            //action sheet
            actionSheetPopUp("Playing","Playing")
            wasState = isState
        }
        
    }
    
    
    @IBAction func stopPressed(_ sender: UIButton) {
        
        wasState = "Stopped"
        isState = "Stopped"
        stateLabel.text = "Stopped"
        print("User click Stop button")
       
    }
    
    
    @IBAction func pausePressed(_ sender: UIButton) {
        
        if ["Playing",
            "Pausing",
            "Fast forwarding",
            "Fast rewinding"].contains(isState) {
            wasState = isState
            isState = "Pausing"
            stateLabel.text = "Pausing"
            print("User click Pause button")
        } else {
            //action sheet
            actionSheetPopUp("Pausing", isState)
        }
    }
    
    
    
    @IBAction func fastForwardPressed(_ sender: UIButton) {
        
        if ["Playing",
            "Pausing",
            "Fast forwarding",
            "Fast rewinding"].contains(isState) {
            wasState = isState
            isState = "Fast forwarding"
            stateLabel.text = "Fast forwarding"
            print("User click Fast forwarding button")
        } else {
            //action sheet
            actionSheetPopUp("Fast forwarding", isState)
        }
    }
    
    
    @IBAction func fastRewindPressed(_ sender: UIButton) {
        
        if ["Playing",
            "Pausing",
            "Fast forwarding",
            "Fast rewinding"].contains(isState) {
            wasState = isState
            isState = "Fast rewinding"
            stateLabel.text = "Fast rewinding"
            print("User click Fast rewinding button")
        } else {
            //action sheet
            actionSheetPopUp("Fast rewinding", isState)
        }
        
    }
    
    
    @IBAction func recordPressed(_ sender: UIButton) {
        
        if isState == "Stopped" {
            wasState = isState
            isState = "Recording"
            stateLabel.text = "Recording"
            print("User click Record button")
        } else {
            wasState = isState
            //action sheet
            actionSheetPopUp("Recording", isState)
        }
    }
    
    func actionAlert(_ stateName:String) {
        
        let alertController =
            UIAlertController(title: "Confirm",
                              message: "\(wasState) operation has been stopped and \(stateName) operation proceeds",
                              preferredStyle: .alert)
        
        let cancelAction =
            UIAlertAction(title: "OK",
                          style: .cancel,
                          handler: nil)
        
        alertController.addAction(cancelAction)
        self.present(alertController,
                     animated: true,
                     completion: nil)
        
    }
    
    
    func actionSheetPopUp(_ stateName:String, _ isState:String) {
        
        let actionSheet =
            UIAlertController(title: "Warning",
                              message: "Requested operation is not possible",
                              preferredStyle: .actionSheet)
        
        let CancelAction =
            UIAlertAction(title: "Cancel",
                          style: .destructive,
                          handler: {(UIAlertAction) in
                            print("User click Cancel")
            })
        
        let forceTo = UIAlertAction(title: "Proceed",
                                    style: .default,
                                    handler: {(UIAlertAction) in
                                        self.stateLabel.text = stateName
                                        self.wasState = self.isState
                                        self.isState = stateName
                                        self.actionAlert(stateName)
                                        print("User choose Proceed and click OK")
        })
        
        actionSheet.addAction(CancelAction)
        actionSheet.addAction(forceTo)
        self.present(actionSheet, animated: true, completion: nil)
        
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
