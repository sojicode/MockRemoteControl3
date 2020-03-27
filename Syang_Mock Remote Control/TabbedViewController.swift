//
//  TabbedViewController.swift
//  Syang_Mock Remote Control3
//
//  Created by Sojeong Yang on 2/27/20.
//  Copyright © 2020 DePaul University. All rights reserved.
//

import UIKit

class ConfigChannel {
    var btnNum = 0
    var labelName = ""
    var chNumber = 1
    
    init() {}
    
    init(_ segNum:Int){
        self.btnNum = segNum
    }
    
    var segNumber:Int {
        get {
            return btnNum
        }
        set {
            btnNum = newValue
        }
    }
    
    var label:String {
        get {
            return labelName
        }
        set {
            labelName = newValue
        }
    }
    
    var chNum:Int {
        get {
            return chNumber
        }
        set {
            chNumber = newValue
        }
    }
    
}

class TabbedViewController: UITabBarController {
    
    var configFavChannel = [ConfigChannel]()

    override func viewDidLoad() {
        super.viewDidLoad()

    
        for num in 0..<4 {
            configFavChannel.append(ConfigChannel(num))
           
        }
        
        configFavChannel[0].label = "ABC"
        configFavChannel[0].chNum = 5
        configFavChannel[1].label = "NBC"
        configFavChannel[1].chNum = 31
        configFavChannel[2].label = "CBS"
        configFavChannel[2].chNum = 44
        configFavChannel[3].label = "FOX"
        configFavChannel[3].chNum = 18
        
        
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
