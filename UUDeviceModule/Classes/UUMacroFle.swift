//
//  UUMacroFle.swift
//  UUDeciceCheckSDK
//
//  Created by iOSDeveloper on 2020/10/21.
//  Copyright © 2020 xiananwu. All rights reserved.
//

import Foundation

//func (_ size: CGFloat) -> CGFloat {
//    return size * (UIScreen.main.bounds.size.width / 1024)
//}

func uu_getBundle(forResource: String?) -> String? {
    let sdkbundle =  Bundle.init(for: UUDeviceCheckController.self)
    let bundlePath = sdkbundle.url(forResource: "UUCheckSources", withExtension: "bundle")
    let relBundle = Bundle.init(url: bundlePath!)
    return relBundle?.path(forResource: forResource, ofType: nil)
}

func uu_checkBundle() -> Bundle {
    let sdkbundle =  Bundle.init(for: UUDeviceCheckController.self)
    let bundlePath = sdkbundle.url(forResource: "UUCheckSources", withExtension: "bundle")
    let relBundle = Bundle.init(url: bundlePath!)
    return relBundle!
}

func uu_image_Bundle(forResource: String?) -> UIImage{
    let sdkbundle =  Bundle.init(for: UUDeviceCheckController.self)
    let bundlePath = sdkbundle.url(forResource: "UUCheckSources", withExtension: "bundle")
    let relBundle = Bundle.init(url: bundlePath!)
    var scale:Int = Int(UIScreen.main.scale)
    if scale > 2 {scale = 3} else {scale = 2}
    let imageUrl = relBundle?.path(forResource: forResource! + "@" + String(scale) + "x.png" , ofType: nil)
    return UIImage(contentsOfFile: imageUrl!)!
}
