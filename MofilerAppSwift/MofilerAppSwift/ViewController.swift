//
//  ViewController.swift
//  MofilerAppSwift
//
//  Created by Fernando Chamorro on 10/11/16.
//  Copyright © 2016 MobileTonic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func testMofiler(_ sender: Any) {
        print("test button");
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.testMofiler();
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

