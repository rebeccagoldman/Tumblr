

//
//  SearchViewController.swift
//  Tumblr
//
//  Created by Rebecca Goldman on 5/28/15.
//  Copyright (c) 2015 codepath. All rights reserved.
//

import UIKit
import Foundation

class SearchViewController: ViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var backgroundView: UIView!
    
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
        
        backgroundView.alpha = 1
        
        var images = UIImage.animatedImageNamed("loading-", duration: 0.5)
        imageView.image = images
        
        delay(0.8, { () -> () in
            
            self.imageView.stopAnimating()
            self.imageView.hidden = true


        })
        
       UIView.animateWithDuration(0.4, delay: 1, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in

        self.backgroundView.alpha = 0
       }, completion: nil)
 
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
