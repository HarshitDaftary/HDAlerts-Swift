//
//  HDAlerts-Swift.swift
//  HDAlerts-Swift
//
//  Created by Harshit on 06/11/15.
//  Copyright © 2015 CocoaPods. All rights reserved.
//

import UIKit

class HDAlerts_Swift: NSObject, UIAlertViewDelegate, UIActionSheetDelegate {

    typealias ActionBlock = (intButtonIndex:Int) -> Void
    typealias InputAlertBlock = (intButtonIndex:Int, strMessage:String) -> Void
    
    var objActionBlock:ActionBlock!
    var objInputAlertBlock:InputAlertBlock!
    
    class var sharedInstance: HDAlerts_Swift {
        struct Static {
            static var onceToken: dispatch_once_t = 0
            static var instance: HDAlerts_Swift? = nil
        }
        dispatch_once(&Static.onceToken) {
            Static.instance = HDAlerts_Swift()
        }
        return Static.instance!
    }
    
    static func showAlertWithMessage(strMessage:String, strTitle:String, block:ActionBlock, firstButton:String, _ moreTitles:String...) ->Void{
    
        let objAlert:HDAlerts_Swift = HDAlerts_Swift.sharedInstance
        objAlert.objActionBlock = block
        
        let objAlertView:UIAlertView = UIAlertView(title: strTitle, message: strMessage, delegate: objAlert, cancelButtonTitle: nil, otherButtonTitles:firstButton)
        
        if moreTitles.count > 0 {
        
            for strButtonTitle in moreTitles {
            
                objAlertView.addButtonWithTitle(strButtonTitle)
            }
        }
        objAlertView.show()
    }
    
    static func showAlertWithInputfieldAndMessage(strMessage:String, strTitle:String, block:InputAlertBlock, firstButton:String, _ moreTitles:String...) ->Void{
        
        let objAlert:HDAlerts_Swift = HDAlerts_Swift.sharedInstance
        objAlert.objInputAlertBlock = block
        
        let objAlertView:UIAlertView = UIAlertView(title: strTitle, message: strMessage, delegate: objAlert, cancelButtonTitle: nil, otherButtonTitles:firstButton)
        
        if moreTitles.count > 0 {
            
            for strButtonTitle in moreTitles {
                
                objAlertView.addButtonWithTitle(strButtonTitle)
            }
        }
        objAlertView.alertViewStyle = UIAlertViewStyle.PlainTextInput
        objAlertView.show()
    }
    
    static func showActionsheet(block:ActionBlock, firstButton:String, _ moreTitles:String...) -> UIActionSheet! {
    
        let objAlert:HDAlerts_Swift = HDAlerts_Swift.sharedInstance
        objAlert.objActionBlock = block
        
        let objActionSheet:UIActionSheet = UIActionSheet(title: "", delegate: objAlert, cancelButtonTitle: nil, destructiveButtonTitle: firstButton)
        
        if moreTitles.count > 0 {
            
            for strButtonTitle in moreTitles {
            
                if (strButtonTitle.lowercaseString != "cancel"){
                    objActionSheet.addButtonWithTitle(strButtonTitle)
                }
            }
            objActionSheet.addButtonWithTitle("Cancel")
            objActionSheet.cancelButtonIndex = objActionSheet.numberOfButtons - 1
        }
        return objActionSheet
    }
    
    //MARK: - UIAlertview Delegate
    
    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        
        if alertView.alertViewStyle == UIAlertViewStyle.PlainTextInput {
        
            let txtInput = alertView.textFieldAtIndex(0)
            objInputAlertBlock?(intButtonIndex: buttonIndex, strMessage: (txtInput?.text)!)
        }
        else {
            objActionBlock?(intButtonIndex:buttonIndex)
        }
    }
    
    //MARK: - UIActionSheet Delegate
    
    func actionSheet(actionSheet: UIActionSheet, clickedButtonAtIndex buttonIndex: Int) {
        
            objActionBlock?(intButtonIndex:buttonIndex)
        
    }

}
