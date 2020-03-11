//
//  ViewController.swift
//  testSwift
//
//  Created by oris on 2020/3/11.
//  Copyright © 2020 oris. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var me = ("Mars", 11,"da")

    override func viewDidLoad() {
        super.viewDidLoad()
        print(me.1)
        print(type(of: me))
    }
    
    func backATrueData() -> (Any,Any,Any) {
        return self.me
    }


}

