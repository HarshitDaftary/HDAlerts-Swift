//
//  ViewController.swift
//  HDAlerts-Swift
//  Created by HarshitDaftary on 11/06/2015.
//  Copyright (c) 2015 HarshitDaftary. All rights reserved.
//

import UIKit
import HDAlerts_Swift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        HDAlerts_Swift.showAlertWithMessage("Message", strTitle: "Title", block: { (intButtonIndex) -> Void in
//            
//            print("Clicked button index is -> \(intButtonIndex)")
//            
//            }, firstButton:"First ","Second ")
        
//        HDAlerts_Swift.showAlertWithInputfieldAndMessage("Message1", strTitle: "Title1", block: { (intButtonIndex, strMessage) -> Void in
//            
//            print("Clicked button \(intButtonIndex) and Input message \(strMessage)")
//            
//            }, firstButton: "Login", "Logout")
        
        
        // For Actionsheets
//        let objActionsheet:UIActionSheet = HDAlerts_Swift.showActionsheet({ (intButtonIndex) -> Void in
//            
//            print("Clicked button index is -> \(intButtonIndex)")
//            
//            }, firstButton: "First Button", "Second Button")
        
//        objActionsheet.showInView(self.view)
        

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

