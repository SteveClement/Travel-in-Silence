//
//  AppDelegate.swift
//  Travel in Silence
//
//  Created by Steve Clement on 11/04/15.
//  Copyright (c) 2015 Steve Clement. All rights reserved.
//

import UIKit
import SwifteriOS

let appInfo = NSBundle.mainBundle().infoDictionary as Dictionary<String,AnyObject>!

// Make the version string available across the App
let shortVersionString = appInfo["CFBundleShortVersionString"] as! String
let bundleVersion      = appInfo["CFBundleVersion"] as! String

// enable global debugging to NSLog()/println()
let debug = true

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    // Setup coreLocationController
    var coreLocationController:CoreLocationController?
    
    func application(application: UIApplication, openURL url: NSURL, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Swifter integration
        Swifter.handleOpenURL(url)
        // Setup coreLocationController for any Location related things
        self.coreLocationController     = CoreLocationController()
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
        
        // call pauseGame here
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        
        // call pause game here and make sure we gracefully resume when user comes back
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.

        // Show gratitude to the user that he came back to the Game
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        
        // Save any game states that are worth save, careful this needs to happen very fast, so no silly internet calls
    }


}

