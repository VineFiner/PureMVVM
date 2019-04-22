//
//  LoginViewController.swift
//  PureMVVMSwift
//
//  Created by vine on 2019/4/21.
//  Copyright © 2019 vine. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmButton: UIButton!
    
    //viewModel is just a member variable here.
    var viewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //
        usernameTextField.addTarget(self, action: #selector(usernameTextFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        passwordTextField.addTarget(self, action: #selector(passworldTextFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        
        self.confirmButton.isEnabled = false
        
        //
        viewModel.isValidCallback = { [weak self] (isValid) in
            self?.confirmButton.isEnabled = isValid
        }
    }
    
    @objc
    func usernameTextFieldDidChange(textField: UITextField){
        viewModel.username = textField.text ?? ""
    }
    
    @objc
    func passworldTextFieldDidChange(textField: UITextField){
        viewModel.password = textField.text ?? ""
    }
    
    @IBAction func confirmButtonTapped(_ sender: UIButton) {
        viewModel.attemptToLogin()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
