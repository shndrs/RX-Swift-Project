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
    
    @IBOutlet fileprivate weak var imageView:UIImage!
    @IBOutlet fileprivate weak var label:UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction private func selectCarPressed(_ sender: UIButton) {
        
        guard let secondVC = storyboard?.instantiateViewController(withIdentifier: secondVCId) else { return }
        navigationController?.pushViewController(secondVC, animated: true)
        
    }
    
    
}

