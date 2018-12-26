//
//  SecondViewController.swift
//  RX Swift Project
//
//  Created by Sahand Raeisi on 12/26/18.
//  Copyright © 2018 Sahand Raeisi. All rights reserved.
//

import UIKit
import RxSwift

class SecondViewController: UIViewController {
    
    private let selectedCarVariable = Variable(Car(image: UIImage(named: "f1")!,
                                                   name: "Formula One"))
    var selectedCar:Observable<Car> {
        return selectedCarVariable.asObservable()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction private func carButtonsPressed(_ sender: UIButton) {
        guard let titleStr = sender.titleLabel?.text else { return }
        let carObject = Car(image: UIImage(named: titleStr)!, name: titleStr)
        selectedCarVariable.value = carObject
    }
    
}

