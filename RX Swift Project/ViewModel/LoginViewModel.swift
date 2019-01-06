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
    
    public var username = Variable<String>("")
    public var password = Variable<String>("")
    
    public var usernameIsValid: Observable<Bool> {
        return Observable.combineLatest(username.asObservable(), password.asObservable()) { username, password in
            username == "shndrs@gmail.com"
        }
    }
    
    public var passwordIsValid: Observable<Bool> {
        return Observable.combineLatest(password.asObservable(), password.asObservable()) { username, password in
            password == "shndrs"
        }
    }
    
    public var userIsValid: Observable<Bool> {
        return Observable.combineLatest(username.asObservable(), password.asObservable()) { username, password in
            username == "shndrs@gmail.com" && password == "shndrs"
        }
    }
    
}
