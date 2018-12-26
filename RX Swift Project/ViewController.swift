//
//  ViewController.swift
//  RX Swift Project
//
//  Created by Sahand Raeisi on 12/26/18.
//  Copyright © 2018 Sahand Raeisi. All rights reserved.
//

import UIKit
import RxSwift

class ViewController: UIViewController {
    
    private let secondVCId = "SecondViewController"
    private var carObject:Car?
    private let dispodeBag = DisposeBag() // delete observer for memory management
    
    @IBOutlet fileprivate weak var imageView:UIImageView!
    @IBOutlet fileprivate weak var label:UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction private func selectCarPressed(_ sender: UIButton) {
        
        guard let secondVC = storyboard?.instantiateViewController(withIdentifier: secondVCId) as? SecondViewController else { return }
        
        secondVC.selectedCar.subscribe(onNext: { [weak self] (car) in
            
            guard let self = self else { return }
            self.carObject = car
            
            DispatchQueue.main.async {
                self.imageView.image = self.carObject?.image
                self.label.text = "Go \(self.carObject?.name ?? "Formula 1") yeaaahhhh!!!!"
            }
        }).disposed(by: dispodeBag)
        
        navigationController?.pushViewController(secondVC, animated: true)
    }
}

