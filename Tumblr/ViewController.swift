//
//  ViewController.swift
//  Tumblr
//
//  Created by Rebecca Goldman on 5/28/15.
//  Copyright (c) 2015 codepath. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    enum ViewPresentation {
        case Normal
        case Modal
    }
    
    var presentationMode = ViewPresentation.Normal
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

