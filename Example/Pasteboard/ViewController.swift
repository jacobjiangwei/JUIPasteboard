//
//  ViewController.swift
//  Pasteboard
//
//  Created by Jacob Jiang on 08/18/2020.
//  Copyright (c) 2020 Jacob Jiang. All rights reserved.
//

import UIKit
import Pasteboard

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let board:Pasteboard = Pasteboard()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

