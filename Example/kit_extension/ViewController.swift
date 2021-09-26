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
        
        let v = UIView()
        
        self.view.addSubview(v)
        v.backgroundColor = .white
        v.frame = .init(x: 100, y: 100, width: 100, height: 100)
        v.setShadow(.bottom)
        
        
        let btn = UIButton()
        btn.backgroundColor = .red
        btn.frame = .init(x: 100, y: 400, width: 100, height: 100)
        btn.setEnlargeEdge(top: 100, bottom: 100, left: 100, right: 100)
        btn.addTarget(self, action: #selector(click), for: .touchUpInside)
        self.view.addSubview(btn)
        

        let v1 = UIView()
        v1.backgroundColor = .white
        v1.frame = .init(x: 100, y: 220, width: 100, height: 100)
        self.view.addSubview(v1)

        v1.setShadow(.all)
        
        v1.setShadow()
       
        
    }

   @objc func click(){
        print("click")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

