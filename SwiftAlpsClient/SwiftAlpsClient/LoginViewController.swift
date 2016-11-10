//
//  LoginViewController.swift
//  SwiftAlpsClient
//
//  Created by Ilya Bilov on 10/11/2016.
//  Copyright © 2016 Badoo. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var anonymousLoginBtn: UIButton!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var usernameField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

