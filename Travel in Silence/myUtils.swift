//
//  myUtils.swift
//  Travel in Silence
//
//  Created by Steve Clement on 16/04/15.
//  Copyright (c) 2015 Steve Clement. All rights reserved.
//

import Foundation


// This file implements common used utilities and other overrides


// This just renames _stdlib_getDemangledTypeName to a more digest type() function
func type(myVar: AnyObject) -> AnyObject {
    let leType = _stdlib_getDemangledTypeName(myVar)
    return leType
}

