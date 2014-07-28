//
//  ViewController.swift
//  SizeClasses
//
//  Created by Valerio Ferrucci on 03/07/14.
//  Copyright (c) 2014 Tabasoft. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    /*
    To avoid crash in iOS7 (no UITraitCollection) link UIKit in build phases as optional (weak link not default in swift?)
    */
    let version:NSString = UIDevice.currentDevice().systemVersion as NSString;
    
    func printTraitCollection(traitCollection : UITraitCollection) {

        switch(traitCollection.horizontalSizeClass) {
        case .Unspecified:
            println("horizontalSizeClass Unspecified");
        case .Compact:
            println("horizontalSizeClass Compact");
        case .Regular:
            println("horizontalSizeClass Regular");
        }
        switch(traitCollection.verticalSizeClass) {
        case .Unspecified:
            println("verticalSizeClass Unspecified");
        case .Compact:
            println("verticalSizeClass Compact");
        case .Regular:
            println("verticalSizeClass Regular");
        }
        println(traitCollection.displayScale);
        switch(traitCollection.userInterfaceIdiom) {
        case .Unspecified:
            println("userInterfaceIdiom Unspecified");
        case .Pad:
            println("userInterfaceIdiom Pad");
        case .Phone:
            println("userInterfaceIdiom Phone");
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if  version.doubleValue >= 8 {
            printTraitCollection(self.traitCollection);
        }
    }
    
    override func traitCollectionDidChange(previousTraitCollection: UITraitCollection!) {
        
        println("trait collection from ... ");
        if let t = previousTraitCollection {
            printTraitCollection(t);
        }
        println("to ... ");
        printTraitCollection(self.traitCollection);
    }

}

