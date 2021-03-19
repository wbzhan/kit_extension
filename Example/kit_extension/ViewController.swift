//
//  ViewController.swift
//  kit_extension
//
//  Created by zhanwenbaoit@126.com on 01/05/2021.
//  Copyright (c) 2021 zhanwenbaoit@126.com. All rights reserved.
//

import UIKit
import kit_extension
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var array = [1,2,3,4,5,6]
        array.removeObj(2)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

