//
//  LoginViewModel.swift
//  RX Swift Project
//
//  Created by Sahand Raeisi on 1/6/19.
//  Copyright © 2019 Sahand Raeisi. All rights reserved.
//

import Foundation
import RxSwift

public struct LoginViewModel {
    
    public var email = Variable<String>("")
    public var password = Variable<String>("")
    
    public var isValid: Observable<Bool> {
        return Observable.combineLatest(email.asObservable(), password.asObservable()) { email, password in
            email == "sahandraeisi1994@gmail.com" && password == "shndrs"
        }
    }
    
}
