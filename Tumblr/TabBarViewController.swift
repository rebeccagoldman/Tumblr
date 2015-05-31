//
//  TabBarViewController.swift
//  Tumblr
//
//  Created by Rebecca Goldman on 5/28/15.
//  Copyright (c) 2015 codepath. All rights reserved.
//

import UIKit

class TabBarViewController: ViewController {

    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet var superView: UIView!

    var homeViewController: UIViewController!
    var searchViewController: UIViewController!
    var composeViewController: UIViewController!
    var accountViewController: UIViewController!
    var trendingViewController: UIViewController!

    @IBOutlet weak var explorePopupView: UIImageView!
    @IBOutlet weak var homeButton: UIButton!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var accountButton: UIButton!
    @IBOutlet weak var trendingButton: UIButton!
    @IBOutlet weak var composeButton: UIButton!
    var selectedTabButton: UIButton!
    var selectedViewController: UIViewController!
    
    var buttons: [UIButton]!
    var viewControllers: [UIViewController]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        homeViewController = storyboard.instantiateViewControllerWithIdentifier("HomeView") as! UIViewController
        searchViewController = storyboard.instantiateViewControllerWithIdentifier("SearchView") as! UIViewController
        composeViewController = storyboard.instantiateViewControllerWithIdentifier("ComposeView") as! UIViewController
        accountViewController = storyboard.instantiateViewControllerWithIdentifier("AccountView") as! UIViewController
        trendingViewController = storyboard.instantiateViewControllerWithIdentifier("TrendingView") as! UIViewController
        
        buttons = [homeButton, searchButton, composeButton, accountButton, trendingButton]
        viewControllers = [homeViewController, searchViewController, composeViewController, accountViewController, trendingViewController]
        
        homeViewController.view.frame = contentView.bounds
        contentView.addSubview(homeViewController.view)
        
        selectedTabButton = homeButton
        homeButton.selected = true
        
//        explorePopupView.hidden = false
        
        UIView.animateWithDuration(1, delay: 0, options: UIViewAnimationOptions.Autoreverse | UIViewAnimationOptions.Repeat, animations: {
            self.explorePopupView.transform = CGAffineTransformMakeTranslation(0, -5)
            }, completion: nil)

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
        
        for(var i = 0; i < 5; i++){

            if (tabButton.tag == i) {

                selectedTabButton = buttons[i]
                buttons[i].selected = true
                selectedViewController = viewControllers[i]
                loadContentView(selectedViewController)
                
            }
        }
        
        if tabButton.tag == 1 || tabButton.tag == 2  {
            explorePopupView.hidden = true
        } else {
            explorePopupView.hidden = false
        }
        
    }

    
    @IBAction func didPressHome(sender: AnyObject) {

        didTouchTabButton(homeButton)
        loadContentView(homeViewController)
        
    }
    
    
    @IBAction func didPressSearch(sender: AnyObject) {

        didTouchTabButton(searchButton)
        loadContentView(searchViewController)
        
    }
    
    
    @IBAction func didPressProfile(sender: AnyObject) {

        didTouchTabButton(accountButton)
        loadContentView(accountViewController)
        
    }
    
    
    @IBAction func didPressTrending(sender: AnyObject) {

        didTouchTabButton(trendingButton)
        loadContentView(trendingViewController)
        
    }

    @IBAction func didPressCompose(sender: AnyObject) {
        
        didTouchTabButton(composeButton)
        superView.addSubview(composeViewController.view)
        composeViewController.view.frame = superView.bounds

        
    }
    
    
  
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}
