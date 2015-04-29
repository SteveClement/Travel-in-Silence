//
//  myUtils.swift
//  Travel in Silence
//
//  Created by Steve Clement on 16/04/15.
//  Copyright (c) 2015 Steve Clement. All rights reserved.
//

import Foundation
import UIKit

// This file implements common used utilities and other overrides


// This just renames _stdlib_getDemangledTypeName to a more digest type() function
func type(myVar: AnyObject) -> AnyObject {
    let leType = _stdlib_getDemangledTypeName(myVar)
    return leType
}

// This class gives access to Device related values
class DeviceMonitor {
    
    init() {
        // Enable battery monitoring to get current level
        UIDevice.currentDevice().batteryMonitoringEnabled = true
    }
    
    // return simple string to poll the batteries state
    var batteryState: String {
        if UIDevice.currentDevice().batteryState == UIDeviceBatteryState.Unplugged {
            return "Unplugged"
        }
        if UIDevice.currentDevice().batteryState == UIDeviceBatteryState.Charging {
            return "Charging"
        }
        if UIDevice.currentDevice().batteryState == UIDeviceBatteryState.Full {
            return "Full"
        }
        return "Unknown"
    }

    // Returns Float between 0.01 and 1.0 on current battery level
    func batteryLevel()-> Float {
        return UIDevice.currentDevice().batteryLevel
    }
}