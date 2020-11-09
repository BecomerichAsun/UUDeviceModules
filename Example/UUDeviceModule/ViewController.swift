//
//  ViewController.swift
//  UUDeviceModule
//
//  Created by becomerichios@163.com on 11/09/2020.
//  Copyright (c) 2020 becomerichios@163.com. All rights reserved.
//

import UIKit
import UUDeviceModule

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let vc = UUDeviceCheckController()
        vc.modalPresentationStyle = .fullScreen
        vc.callTheHeadTeacherForHelp {
            print("呼叫班主任")
        }
        vc.deviceCheckCompleteWithResultModel { (mode) in }
        self.present(vc, animated: true, completion: nil)
    }
}

