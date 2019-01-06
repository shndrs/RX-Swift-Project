//
//  LoginViewController.swift
//  RX Swift Project
//
//  Created by Sahand Raeisi on 1/6/19.
//  Copyright © 2019 Sahand Raeisi. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class LoginViewController: UIViewController {
    
    private let loginViewModel = LoginViewModel()
    private let dispodeBag = DisposeBag()

    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var usernameAlarmLabel: UILabel!
    @IBOutlet weak var passwordAlarmLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loginValidation()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        userNameTF.text = nil
        passwordTF.text = nil
        
        userNameTF.becomeFirstResponder()
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    @IBAction private func loginButtonPressed(_ sender: UIButton) {
        loginViewModel.userIsValid.subscribe(onNext: {[unowned self] isValid in
            
            if isValid {
                guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as? ViewController else { return }
                DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: { [weak self] in
                    guard let self = self else { return }
                    self.navigationController?.pushViewController(vc, animated: true)
                })
            }
        }).disposed(by: dispodeBag)
    }
    
    func loginValidation() {
        
        _ = userNameTF.rx.text.map { $0 ?? "" }.bind(to: loginViewModel.username)
        _ = passwordTF.rx.text.map { $0 ?? "" }.bind(to: loginViewModel.password)
        
        _ = loginViewModel.usernameIsValid.bind(to: loginButton.rx.isEnabled)
        _ = loginViewModel.passwordIsValid.bind(to: loginButton.rx.isEnabled)
        
        loginViewModel.usernameIsValid.subscribe(onNext: {[unowned self] isValid in
            
            self.usernameAlarmLabel.text = isValid ? "Username is correct" : "Try Again!"
            self.usernameAlarmLabel.textColor = isValid ? .green : .lightGray
            
        }).disposed(by: dispodeBag)
        
        loginViewModel.passwordIsValid.subscribe(onNext: {[unowned self] isValid in
            
            self.passwordAlarmLabel.text = isValid ? "Password is correct" : "Try Again!"
            self.passwordAlarmLabel.textColor = isValid ? .green : .lightGray
            
        }).disposed(by: dispodeBag)
    }
}

