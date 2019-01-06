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
    @IBOutlet weak var alarmLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loginValidation()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func loginValidation() {
        
        _ = userNameTF.rx.text.map { $0 ?? "" }.bind(to: loginViewModel.email)
        _ = passwordTF.rx.text.map { $0 ?? "" }.bind(to: loginViewModel.password)
        _ = loginViewModel.isValid.bind(to: loginButton.rx.isEnabled)
        
        loginViewModel.isValid.subscribe(onNext: {[unowned self] isValid in
            
            self.alarmLabel.text = isValid ? "You're good to go in 2 seconds" : "Try again"
            self.alarmLabel.textColor = isValid ? .green : .red
            
            if isValid {
                
                guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as? ViewController else { return }
                DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: { [weak self] in
                    
                    guard let self = self else { return }
                    
                    self.navigationController?.pushViewController(vc, animated: true)
                })
            }
            
        }).disposed(by: dispodeBag)
    }
}
