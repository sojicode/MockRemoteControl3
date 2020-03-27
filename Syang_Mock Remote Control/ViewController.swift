//
//  ViewController.swift
//  Syang_Mock Remote Control
//
//  Created by Sojeong Yang on 2/9/20.
//  Copyright © 2020 DePaul University. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var powerLabel: UILabel!
    @IBOutlet weak var volumeValue: UILabel!
    @IBOutlet weak var channelValue: UILabel!

    @IBOutlet weak var powerSwitch: UISwitch!
    @IBOutlet weak var slider: UISlider!
     
    @IBOutlet weak var chPlus: UIButton!
    @IBOutlet weak var chMinus: UIButton!
    
    @IBOutlet var btnArray: [UIButton]!
    
    @IBOutlet weak var favChannel: UISegmentedControl!
    
    var numArr = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let currentTabView = tabBarController as! TabbedViewController
        let currentConfig = currentTabView.configFavChannel
        for (Int, num) in currentConfig.enumerated() {
            favChannel.setTitle("\(num.labelName)", forSegmentAt: Int)
        }
        switchFavChannel()
    }
    
    
    @IBAction func switchToggled(_ sender: UISwitch) {

        powerLabel.text = (sender.isOn ? "On" : "Off")
//        powerSwitch.setOn(sender.isOn, animated: true)
        
        if sender.isOn == true {
//            powerLabel.text = "On"
            slider.isEnabled = true
            favChannel.isEnabled = true
            
            for btn in btnArray {
                btn.isEnabled = true
            } 
            
        } else {
//            powerLabel.text = "Off"
            slider.isEnabled = false
            favChannel.isEnabled = false
            
            for btn in btnArray {
                btn.isEnabled = false
            }
        }
        
    }
    
    @IBAction func sliderMoved(_ sender: UISlider) {
        
        volumeValue.text = "\(Int(sender.value * 100))"
        
    }
    
    
    @IBAction func chNumPressed(_ sender: UIButton) {
        
        let num:String = sender.currentTitle!
        if (numArr.count == 0 || numArr.count == 1) {
            numArr.append(num)
            //channelValue.text = ("\(num)")
        }
        if (numArr.count == 2) {
            let twoNumChannel = numArr[0] + numArr[1]
            
            if twoNumChannel == "00" {
                numArr.removeAll()
            } else {
                channelValue.text = twoNumChannel
                numArr.removeAll()
            }
        }
    
    }
    
    
    @IBAction func chPlusPressed(_ sender: UIButton) {
        
        let numChannel = Int(channelValue.text!)
        
        if (numChannel! + 1 > 99) {
            channelValue.text = String("1")
        } else {
            let changeChannel = numChannel! + 1
            channelValue.text = String(changeChannel)
        }
    }
    
    
    @IBAction func chMinusPressed(_ sender: UIButton) {
        
        let numChannel = Int(channelValue.text!)
        
        if (numChannel! - 1 < 1) {
            channelValue.text = String("99")
        } else  {
            let changeChannel = numChannel! - 1
            channelValue.text = String(changeChannel)
        }
    }
    
    var channel1:String = "05"
    var channel2:String = "31"
    var channel3:String = "44"
    var channel4:String = "18"
    
    func switchFavChannel() {
        let currentTabView = tabBarController as! TabbedViewController
        
        for num in 0..<4 {
            let channelName = currentTabView.configFavChannel[num].segNumber
            
            if channelName == 0 {
                channel1 = String(currentTabView.configFavChannel[0].chNumber)
                if favChannel.selectedSegmentIndex == 0 {
                    channelValue.text = String(currentTabView.configFavChannel[0].chNumber)
                }
            }
            else if channelName == 1 {
                channel2 = String(currentTabView.configFavChannel[1].chNumber)
                if favChannel.selectedSegmentIndex == 1 {
                    channelValue.text = String(currentTabView.configFavChannel[1].chNumber)
                }
           }
            
            else if channelName == 2 {
                channel3 = String(currentTabView.configFavChannel[2].chNumber)
                if favChannel.selectedSegmentIndex == 2 {
                    
                }
                
            }
            else if channelName == 3 {
                channel4 = String(currentTabView.configFavChannel[3].chNumber)
                if favChannel.selectedSegmentIndex == 3 {
                    channelValue.text = String(currentTabView.configFavChannel[3].chNumber)
                                        
                }
                
            }
          
        }
    }
    
    
    @IBAction func favChSelected(_ sender: UISegmentedControl) {
        
//        let newsChannel:String = sender.titleForSegment(at: sender.selectedSegmentIndex)!
        
        let newsChannel:Int = sender.selectedSegmentIndex
        
        switch (newsChannel) {
        case 0:
            channelValue.text = channel1
        case 1:
            channelValue.text = channel2
        case 2:
            channelValue.text = channel3
        case 3:
            channelValue.text = channel4
        default:
            channelValue.text = channel4
        }
    
        
    }
    

}


