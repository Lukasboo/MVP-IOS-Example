//
//  ViewController.swift
//  MVP Tutorial
//
//  Created by Lucas Daniel on 01/12/18.
//  Copyright © 2018 Smn. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ViewControllerDelegate {

    var presenter: ViewControllerPresenter!
    
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var lblErrorMessage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()        
        lblErrorMessage.isHidden = true
        presenter = ViewControllerPresenter()
        presenter.delegate = self
    }
    
    func showMessage(message: String) {
        self.lblErrorMessage.isHidden = false
        self.lblErrorMessage.textColor = UIColor.red
        self.lblErrorMessage.text = message
    }
    
    func userSuccessFullyLoggedIn() {
        print("User Data == \(presenter.name) \(presenter.email) \(presenter.gender)")
        self.lblErrorMessage.isHidden = false
        self.lblErrorMessage.text = "UserLoggedIn"
        self.lblErrorMessage.textColor = UIColor.green
    }
    
    @IBAction func Submit(_ sender: UIButton) {
        self.lblErrorMessage.isHidden = true
        self.presenter.validateData(userName: txtUsername.text!, password: txtPassword.text!)
    }
    
}

