//
//  HomeViewController.swift
//  Tumblr
//
//  Created by Rebecca Goldman on 5/28/15.
//  Copyright (c) 2015 codepath. All rights reserved.
//

import UIKit

class HomeViewController: ViewController {

    @IBOutlet weak var loginBackgroundView: UIView!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var loginView: UIView!
    
    @IBOutlet weak var emailField: UITextField!
    
    var thisPresentationMode = ViewPresentation.Normal
    
    override var presentationMode: ViewPresentation {
        get {
            return thisPresentationMode
        }
        set {
            thisPresentationMode = newValue as ViewPresentation
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginBackgroundView.alpha = 0
        loginView.center.y = 600
        emailField.isFirstResponder()


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPressLogin(sender: AnyObject) {
        
        emailField.becomeFirstResponder()
        
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.loginBackgroundView.alpha = 0.96
            self.loginView.center.y -= 450
            
            
        }, completion: nil)
        
    }
    
    
    @IBAction func didPressCancel(sender: AnyObject) {
        emailField.resignFirstResponder()


        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.loginBackgroundView.alpha = 0
            self.loginView.center.y += 450
            
            
            }, completion: nil)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
