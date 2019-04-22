//
//  LoginViewModel.swift
//  PureMVVMSwift
//
//  Created by vine on 2019/4/21.
//  Copyright © 2019 vine. All rights reserved.
//

import UIKit

class LoginViewModel: NSObject {
    
    var username: String = "" {
        didSet {
            evaluateValidity()
        }
    }
    var password: String = "" {
        didSet { evaluateValidity()
        }
    }
    var isValid : Bool = false {
        didSet {
            isValidCallback?(isValid)
        }
    }
    var isValidCallback : ((_ isValid: Bool) -> Void)?
    
    private func evaluateValidity(){
        isValid = username.count > 0
            && password.count > 0
    }
    
    func attemptToLogin() {
        // truncated for space
        let params = [
            "username": username,
            "password": password
        ]
        
        DispatchQueue.global().async {
            sleep(2)
            DispatchQueue.main.async {
                print("This is value:\(params)")
            }
        }
    }
}
