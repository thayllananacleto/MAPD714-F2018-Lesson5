//
//  SwitchingViewController.swift
//  MAPD714-F2018-Lesson5
//
//  Created by Thayllan Anacleto on 2018-10-04.
//  Copyright © 2018 Thayllan Anacleto. All rights reserved.
//

import UIKit

class SwitchingViewController: UIViewController {

    // private instance variables
    private var blueViewController: BlueViewController!
    private var yellowViewController: YellowViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        blueViewController = (storyboard?.instantiateViewController(withIdentifier: "Blue") as! BlueViewController)
        
        blueViewController.view.frame = view.frame
        switchViewController(from: nil, to: blueViewController)
        
    }

    @IBAction func switchViews(_ sender: UIBarButtonItem) {
        
        // Create the new view controller if required
        if yellowViewController?.view.superview == nil {
            if yellowViewController == nil {
                yellowViewController = (storyboard?.instantiateViewController(withIdentifier: "Yellow") as! YellowViewController)
            }
        } else if blueViewController?.view.superview == nil {
            if blueViewController == nil {
                blueViewController = (storyboard?.instantiateViewController(withIdentifier: "Blue") as! BlueViewController)
            }
        }
        
        // Switch View Controllers
        if blueViewController != nil && blueViewController!.view.superview != nil {
            yellowViewController.view.frame = view.frame
            switchViewController(from: blueViewController, to: yellowViewController)
        } else {
            blueViewController.view.frame = view.frame
            switchViewController(from: yellowViewController, to: blueViewController)
        }
        
    }
    
    private func switchViewController(from fromVC: UIViewController?, to toVC: UIViewController?) {
        
        if fromVC != nil {
            fromVC!.willMove(toParent: nil)
            fromVC!.view.removeFromSuperview()
            fromVC!.removeFromParent()
        }
        
        if toVC != nil {
            self.addChild(toVC!)
            self.view.insertSubview(toVC!.view, at: 0)
            toVC!.didMove(toParent: self)
        }
        
    }
    
}
