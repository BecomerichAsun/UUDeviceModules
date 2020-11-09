//
//  UUMacroFle.swift
//  UUDeciceCheckSDK
//
//  Created by iOSDeveloper on 2020/10/21.
//  Copyright © 2020 xiananwu. All rights reserved.
//

import Foundation

public var SSScreenHeight: CGFloat {
    get {
        return min(UIScreen.main.bounds.size.width, UIScreen.main.bounds.size.height)
    }
}

public let SSScreenWidthLayout      = SSScreenHeight*1024/768.0

public let ScreenScale = UIScreen.main.bounds.size.width / 779
//
//func screenScale(_ value: Int) -> CGFloat {
//    return UIScreen.main.bounds.size.width / 667
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
