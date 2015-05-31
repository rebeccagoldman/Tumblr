//
//  TabBarViewController.swift
//  Tumblr
//
//  Created by Rebecca Goldman on 5/28/15.
//  Copyright (c) 2015 codepath. All rights reserved.
//

import UIKit

class TabBarViewController: UIViewController {

    @IBOutlet weak var contentView: UIView!
    
    var homeViewController: UIViewController!
    var searchViewController: UIViewController!
    var composeViewController: UIViewController!
    var accountViewController: UIViewController!
    var trendingViewController: UIViewController!

    @IBOutlet weak var homeButton: UIButton!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var accountButton: UIButton!
    @IBOutlet weak var trendingButton: UIButton!

    var selectedTabButton: UIButton!
    var selectedViewController: UIViewController!
    
    var buttons: [UIButton]!
    var viewControllers: [UIViewController]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        homeViewController = storyboard.instantiateViewControllerWithIdentifier("HomeViewController") as! UIViewController
        searchViewController = storyboard.instantiateViewControllerWithIdentifier("SearchViewController") as! UIViewController
        composeViewController = storyboard.instantiateViewControllerWithIdentifier("ComposeViewController") as! UIViewController
        accountViewController = storyboard.instantiateViewControllerWithIdentifier("AccountViewController") as! UIViewController
        trendingViewController = storyboard.instantiateViewControllerWithIdentifier("TrendingViewController") as! UIViewController
        
        buttons = [homeButton, searchButton, accountButton, trendingButton]
        viewControllers = [homeViewController, searchViewController, accountViewController, trendingViewController]
        
        homeViewController.view.frame = contentView.bounds
        contentView.addSubview(homeViewController.view)
        
        selectedTabButton = homeButton
        homeButton.selected = true

        
    }
        
    func loadContentView(ViewController: UIViewController) {
        addChildViewController(ViewController)
        ViewController.view.frame = contentView.bounds
        contentView.addSubview(ViewController.view)
        ViewController.didMoveToParentViewController(self)
    }

    
    @IBAction func didTouchTabButton(tabButton: UIButton) {
        
        homeButton.selected = false
        searchButton.selected = false
        accountButton.selected = false
        trendingButton.selected = false
        
        for(var i = 0; i < 4; i++){

            if (tabButton.tag == i) {

                selectedTabButton = buttons[i]
                buttons[i].selected = true
                selectedViewController = viewControllers[i]
                loadContentView(selectedViewController)
                
            }
        }
        
        
        
    }


    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    @IBAction func didPressHome(sender: AnyObject) {

//        resetTabBar()

        didTouchTabButton(homeButton)
        loadContentView(homeViewController)
        
    }
    
    
    @IBAction func didPressSearch(sender: AnyObject) {

//        resetTabBar()

        didTouchTabButton(searchButton)
        loadContentView(searchViewController)
        
    }
    
    
    @IBAction func didPressProfile(sender: AnyObject) {
//        resetTabBar()

        didTouchTabButton(accountButton)
        loadContentView(accountViewController)
        
    }
    
    
    @IBAction func didPressTrending(sender: AnyObject) {
//        resetTabBar()

        didTouchTabButton(trendingButton)
        loadContentView(trendingViewController)
        
    }
    
    
    @IBAction func didPressCompose(sender: AnyObject) {
        
        addChildViewController(composeViewController)
        composeViewController.view.frame = contentView.bounds
        view.addSubview(composeViewController.view)
        
        UIView.animateWithDuration(0.1, animations: { () -> Void in
            self.composeViewController.view.alpha = 1
            }) { (Bool) -> Void in
                self.composeViewController.didMoveToParentViewController(self)
        
        }
    }
}
